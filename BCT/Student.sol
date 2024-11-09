// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Structure to store student information
    struct Student {
        string name;
        uint256 age;
        uint256 id;
    }

    // Mapping to store students by their ID
    mapping(uint256 => Student) private studentsById;

    // Variable to track total number of students
    uint256 private totalStudents;

    // Event to emit when a student is added
    event StudentAdded(string name, uint256 age, uint256 id);

    // Function to add a new student
    function addStudent(string memory _name, uint256 _age, uint256 _id) public {
        // Create a new student struct and add it to the mapping
        Student memory newStudent = Student({
            name: _name,
            age: _age,
            id: _id
        });

        studentsById[_id] = newStudent;
        totalStudents++; // Increment the total student count
        emit StudentAdded(_name, _age, _id);
    }

    // Function to retrieve student information by id
    function getStudentById(uint256 _id) external view returns (string memory name, uint256 age, uint256 id) {
        require(studentsById[_id].id != 0, "Student not found.");
        Student memory student = studentsById[_id];
        return (student.name, student.age, student.id);
    }

    // Function to get the total number of students
    function getTotalStudents() external view returns (uint256) {
        return totalStudents; // Return the current count of students
    }

    // Fallback function to receive Ether (optional)
    receive() external payable {}
}



//install metamask
change to testnet sepolia
open sepolia faucet and paste wallet address
in remix deploy tab open environment and select connected wallets
then deploy
