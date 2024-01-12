import { ApiPromise, WsProvider, Keyring } from "@polkadot/api";
import TokenConstructors from "./types/constructors/adder";
import {
  Addresses,
  uploadCode,
  storeAddresses,
  estimateContractInit,
} from "./utils";
import "dotenv/config";
import "@polkadot/api-augment";

const envFile = process.env.ENV || "dev";
async function import_env() {
  return await import(`./env/${envFile}.json`);
}

async function main(): Promise<void> {
  let {
    ws_node,
    authority,
    authority_seed,
  } = await import_env();

  let wsProvider = new WsProvider(ws_node);
  let keyring = new Keyring({ type: "sr25519" });

  const api = await ApiPromise.create({ provider: wsProvider });
  const deployer = keyring.addFromUri(authority_seed);

  const adderCodeHash = await uploadCode(api, deployer, "adder.contract");

  console.log("adder code hash:", adderCodeHash);

  const adderConstructors = new TokenConstructors(api, deployer);

  let estimatedGasToken = await estimateContractInit(
    api,
    deployer,
    "adder.contract",
    [],
  );
  const { address: adderAddress } = await adderConstructors.new(
    // 1,
    { gasLimit: estimatedGasToken },
  );

  console.log("adder address:", adderAddress);

  const addresses: Addresses = {
    adder: adderAddress,
  };

  console.log("addresses:", addresses);

  storeAddresses(addresses);

  await api.disconnect();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
