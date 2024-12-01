# Buying Cats with DegenToken

This Solidity program is a fun cat buying program where you can use DegenToken to buy cats. Transactions from this smart contract can be viewed through the Snowtrace Testnet. 

## Description

This program can be used to mint, burn, transfer, redeem cats, and show the balance of different wallets. The program also gives privileges to the owner that deploys it and limits the access of minting from other users. You can buy 4 breeds of cats including:
- British Shorthair
- American Shorthair
- Tabby
- Calico

## Functions

1. decimals():
- Disallows the use of fractions and decimals in transactions

2.  showBalance():
- Returns the token balance of the caller's address.

3. mint():
- Allows the contract owner to mint new tokens and assign them to their address.

4. burnTokens():
- Burns a specified number of tokens from the caller’s balance if they have enough tokens.

5. showCatID():
- Returns the name and price of a cat given a valid cat ID from the catList.
 
6. buyCat():
- Allows users to buy a cat by burning the required token amount and adds the cat to their owned list if they have enough tokens.

7. getOwnedCats():
- Returns a list of cats owned by the caller.

## Authors

Francis L. Chuegan
FEU Institute of Technology
202111700@fit.edu.ph
Egan

