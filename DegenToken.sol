/*
The smart contract should be able to:
1. Mint
2. Transfer
3. Check Balance
4. Redeem
5. Burn
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    
    string public showCatList;

    struct CatList {
        uint256 catID;
        string CatName;
        uint256 CatPrice;
    }
    
    CatList[] public catList;

    // mapping(uint8 => CatList) public catList;
    mapping(address => CatList[]) private redeemedCats;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender){
        catList.push(CatList(1, "British Shorthair", 50));
        catList.push(CatList(2, "American Shorthair", 40));
        catList.push(CatList(3, "Tabby", 25));
        catList.push(CatList(4, "Calico", 20));

        showCatList = "Cats Available to Purchase: 1. British Shorthair 2. American Shorthair 3. Tabby 4. Calico";
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function showBalance () external view returns (uint256) {
        uint256 balance = balanceOf(msg.sender);
        return balance;
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "You can not burn more than what you have!");
        _burn(msg.sender, amount);
    }

    function showCatID(uint8 catID) public view returns (string memory, uint256) {
        require(catID >= 0 && catID <= 3, "Invalid cat ID");
        CatList memory cat = catList[catID];
        return (cat.CatName, cat.CatPrice);
    }

    function buyCat(uint256 catID) external {
        require(catID > 0 && catID <= catList.length, "Cat Not Available!");
        CatList memory cat = catList[catID - 1]; 

        require(balanceOf(msg.sender) >= cat.CatPrice, "Insufficient funds!");

        _burn(msg.sender, cat.CatPrice);

        redeemedCats[msg.sender].push(cat);

        emit CatRedeemed(msg.sender, cat.catID, cat.CatName, cat.CatPrice);
    }

    function getOwnedCats() external view returns (CatList[] memory) {
        return redeemedCats[msg.sender];
    }

    event  CatRedeemed(address indexed cat, uint256 catID, string CatName, uint256 CatPrice);
}
