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



The StudentData smart contract showcases key concepts of blockchain-based data storage and interaction on the Ethereum network. Here's a brief explanation of the core concepts:

1. Smart Contracts:
A smart contract is a self-executing program that runs on the blockchain. It contains predefined logic and rules (written in Solidity, in this case) and automatically enforces those rules when specific conditions are met.
In this contract, the logic manages student data and allows interactions like adding a student, retrieving information, and tracking the total number of students.
2. Structs:
A struct is a custom data type that groups multiple variables of different types into one unit. In the contract, the Student struct contains three variables: name, age, and id, which represent a student's basic information.
Structs help organize data efficiently in a contract and enable storing complex data types.
3. Mappings:
A mapping is a key-value store in Solidity, used to store data in a way that can be accessed via a unique key. Here, the mapping(uint256 => Student) associates each student's ID (of type uint256) with their corresponding Student struct.
This allows efficient retrieval and modification of student data based on their unique ID.
4. Events:
Events are important for logging activities that occur on the blockchain. They allow external applications (like dApps or front-end interfaces) to listen and react to state changes in the contract.
In this case, the StudentAdded event is emitted every time a new student is added, notifying any listeners of this action.
