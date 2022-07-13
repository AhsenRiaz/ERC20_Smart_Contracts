// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "./IERC20.sol";

contract TokenTimeLock {
    IERC20 private _token;

    address private _beneficiary;

    uint256 private _releaseTime;

    mapping(address => uint256) private _balances;

    constructor(address token_, address beneficiary_) {
        _token = IERC20(token_);
        _beneficiary = beneficiary_;
        _releaseTime = block.timestamp + 60;
    }

    function token() public view returns (IERC20) {
        return _token;
    }

    function beneficiary() public view returns (address) {
        return _beneficiary;
    }

    function releaseTime() public view returns (uint256) {
        return _releaseTime;
    }

    function release() public {
        require(
            block.timestamp > _releaseTime,
            "TokenTimeLock: no tokens to release"
        );
        uint256 amount = token().balanceOf(address(this));
        require(amount > 0, "TokenTimelock: no tokens to release");

        token().transfer(beneficiary(), amount);
    }
}
