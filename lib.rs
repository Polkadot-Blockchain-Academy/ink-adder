#![cfg_attr(not(feature = "std"), no_std, no_main)]

#[ink::contract]
pub mod adder {

    pub const VERSION: u32 = 1;

    #[ink(storage)]
    pub struct Adder {}

    impl Adder {
        #[ink(constructor)]
        pub fn new() -> Self {
            Self {}
        }

        #[ink(message)]
        pub fn add(&mut self, _value: u32) {
            todo!()
        }

        #[ink(message)]
        pub fn get(&self) -> u32 {
            todo!()
        }
    }
}
