#![cfg_attr(not(feature = "std"), no_std, no_main)]

#[ink::contract]
pub mod adder {

    pub const VERSION: u32 = 2;

    #[ink(storage)]
    pub struct Adder {
        counter: u8,
    }

    impl Adder {
        #[ink(constructor)]
        pub fn new() -> Self {
            Self { counter: 0 }
        }

        #[ink(message)]
        pub fn add(&mut self, value: u8) {
            self.counter += value;
        }

        #[ink(message)]
        pub fn get(&self) -> u8 {
            self.counter
        }
    }
}
