// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract MappingCrud {
    struct Item {
        string name;
        uint256 id;
        bool exists;
    }

    mapping(uint256 => Item) public itemsMapping;
    uint256 nextId = 1;

    function add(string memory name) public {
        itemsMapping[nextId] = Item(name, nextId, true);
        nextId++;
    }

    function get(uint256 id) public view returns (string memory, uint256) {
        Item memory item = itemsMapping[id];
        // require(bytes(item.name).length != 0, "Item does not exist");
        // require(item.id == id, "Item does not exist");
        require(item.exists == true, "Item does not exist");
        return (item.name, item.id);
    }

    function update(uint256 id, string memory name) public {
        Item storage item = itemsMapping[id];
        require(bytes(item.name).length != 0, "Item does not exist");
        item.name = name;
    }

    function remove (uint256 id) public {
        Item storage item = itemsMapping[id];
        // require(bytes(item.name).length != 0, "Item does not exist");
        require( item.exists == true, "Item does not exist");
        delete itemsMapping[id];
    }

    function getAllMappedItems() public view returns (Item[] memory) {
        uint256 length = nextId - 1;
        Item[] memory allItems = new Item[](length);
        uint256 counter = 0;
        for (uint256 i = 1; i <= length; i++) {
            if (bytes(itemsMapping[i].name).length != 0) {
                allItems[counter] = itemsMapping[i];
                counter++;
            }
        }
        return allItems;
    }

    function getLength() public view returns (uint256) {
        uint256 length = nextId - 1;
        uint256 itemCount = 0;
        for (uint256 i = 1; i <= length; i++) {
            if (bytes(itemsMapping[i].name).length != 0) {
                itemCount++;
            }
        }
        return itemCount;
    }
}