// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.13;

contract Community {

    // Constants

    address public constant SENTINEL_MEMBER = address(0x1);

    // max 65536 members in a single community
    // the binary tree is depth 16
    uint256 public constant MAX_MEMBERS = 2**16;

    // State variables

    mapping(address => address) public membersIterable; 

    // Constructor

    constructor() {

    }

    // External functions

    function enter() external {
        _insertMember(msg.sender);
    }

    // Private functions

    function _insertMember(address _member) private {
        require(
            address(_member) != address(0),
            "Member cannot be zero address."
        );
        require(
            address(membersIterable[_member]) == address(0),
            "Member cannot be inserted twice."
        );
        // prepend the new member in the iterable linked list
        membersIterable[_member] = SENTINEL_MEMBER;
        membersIterable[SENTINEL_MEMBER] = _member;
    }
}