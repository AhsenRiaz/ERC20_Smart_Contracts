// Implementing pause mechanism. Although it can be implemented by inheriting the Pausable file from openzeppelin but implementing it for practice
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./ERC20.sol";

contract ERC20Pausable is ERC20 {
    bool private _paused;

    constructor(string memory name_, string memory symbol_)
        ERC20(name_, symbol_)
    {}

    modifier whenPaused() {
        _requirePaused();
        _;
    }

    modifier whenNotPaused() {
        _requiredNotPaused();
        _;
    }

    function paused() public view returns (bool) {
        return _paused;
    }

    function _requirePaused() internal view {
        require(paused() == true, "Pausable: not paused");
    }

    function _requiredNotPaused() internal view {
        require(paused() == false, "Pausable: paused");
    }

    function _pause() internal whenNotPaused {
        _paused = true;
    }

    function _unpause() internal whenPaused {
        _paused = false;
    }
}
