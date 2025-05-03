// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract LevelTwo is Initializable {
    using SafeERC20 for IERC20;

    address principal;
    bool inSession;
    uint256 public sessionEnd;
    uint256 public bursary;
    uint256 public cutOffScore;
    mapping(address => bool) public isTeacher;
    mapping(address => bool) public isStudent;
    mapping(address => uint256) public studentScore;
    address[] listOfStudents;
    address[] listOfTeachers;

    uint256 public constant TEACHER_WAGE_L2 = 40;
    uint256 public constant PRINCIPAL_WAGE_L2 = 5;
    uint256 public constant PRECISION = 100;

    IERC20 usdc;

    function graduate() public reinitializer(2) {}

    function getPrincipal() external view returns (address) {
        return principal;
    }

    function getSchoolFeesToken() external view returns (address) {
        return address(usdc);
    }

    function getTotalTeachers() external view returns (uint256) {
        return listOfTeachers.length;
    }

    function getTotalStudents() external view returns (uint256) {
        return listOfStudents.length;
    }

    function getListOfStudents() external view returns (address[] memory) {
        return listOfStudents;
    }

    function getListOfTeachers() external view returns (address[] memory) {
        return listOfTeachers;
    }
}
