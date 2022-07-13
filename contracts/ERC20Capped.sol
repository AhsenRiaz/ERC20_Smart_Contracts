// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;
import "./ERC20.sol";

contract ERC20Capped is ERC20 {
    uint private _cap;

    constructor(
        uint cap_,
        string memory name_,
        string memory symbol_
    ) ERC20(name_, symbol_) {
        require(cap_ > 0, "ERC20Capped: cap is zero");
        _cap = cap_;
    }

    function cap() public view returns (uint256) {
        return _cap;
    }

    function mint(address account, uint256 amount) public {
        require(
            ERC20.totalSupply() + amount <= _cap,
            "ERC20Capped: cap exceeded"
        );
        super._mint(account, amount);
    }
}
