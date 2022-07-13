// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract ERC20Mintable is ERC20("AhsenToken", "AST") {
    function mint(uint256 amount) public {
        _mint(msg.sender, amount);
    }
}
