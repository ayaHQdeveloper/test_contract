// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract ExampleContract {
    function whoami() public view returns (address) {
		address sender = msg.sender;
		return sender;
	}
}