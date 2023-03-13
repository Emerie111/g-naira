// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract GNaira is ERC20, ERC20Burnable, AccessControl, ERC20Permit {
    bytes32 public constant GOVERNOR = keccak256("GOVERNOR");

    constructor() ERC20("G-Naira", "gNGN") ERC20Permit("G-Naira") {
        _mint(msg.sender, 1000 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(GOVERNOR, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(GOVERNOR) {
        _mint(to, amount);
    }
}