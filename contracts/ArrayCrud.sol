// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract ArrayCrud {
    struct Item {
        string name;
        uint256 id;
        bool exists;
    }

    Item[] public itemsArray; 
    uint256 public nextId = 1;

    function createItem(string memory _name) public {
        itemsArray.push(Item(_name, nextId, true));
        nextId++;
    }

    function findItem(uint256 id) internal view returns (uint256) {
        for (uint256 i = 0; i < itemsArray.length; i++) {
            if (itemsArray[i].id == id) {
                return i;
            }
        }
        revert('Item does not exist');
    }

    function getItem(uint256 id) public view returns (string memory, uint256) {
        uint256 i = findItem(id);
        return (itemsArray[i].name, itemsArray[i].id);
    }

    function removeItem(uint256 id) public {
        uint256 i = findItem(id);
        itemsArray[i] = itemsArray[itemsArray.length - 1];
        itemsArray.pop();
    }

    function updateItem(uint256 id, string memory _name) public {
        uint256 i = findItem(id);
        itemsArray[i].name = _name;
    }

    function getAllItem() public view returns (Item[] memory) {
        return itemsArray;
    }

    function getArrayLength() public view returns (uint256) {
        return itemsArray.length;
    }
    
}