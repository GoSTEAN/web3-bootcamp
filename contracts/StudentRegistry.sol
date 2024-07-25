// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract StudentRegistry {
    // struct
    struct Student {
        address studentAddr;
        uint256 studentId;
        string name;
        // age should not be less than 18
        // add function to update student 
        // add delete function to delete student from the registry
        uint8 age;
    }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    Student[] private students;

    // why is memory attached to _name? because string are converted to arrays so it need memory to store it
    function addStudent(address _studentAddr, string memory _name, uint8 _age) public  {

        require(owner == msg.sender, "You are not authorized");
        require(_age >= 18, "You are not up to age");
        uint256 _studentId = students.length + 1;
        Student memory student = Student({
            studentAddr: _studentAddr,
            name: _name,
            age: _age,
            studentId: _studentId
        });

        students.push(student);
    }

    function getStudent(uint256 _studentId) public view returns (Student memory) {
        return  students[_studentId - 1];
    }

    function updateStudent(address _studentAddr, string memory _name, uint8 _age, uint256 _studentId) public {
        require(owner == msg.sender, "You are not authorized");
        require(_studentId > 0 && _studentId <= students.length, "This is an invalid student");
        require(_age >= 18, "You are not up to age");

        Student storage student = students[_studentId - 1];
        student.studentAddr = _studentAddr;
        student.name = _name;
        student.age = _age;
    }

    function deleteStudent(uint256 _studentId) public {
        require(owner == msg.sender, "You are not authorized");
        require(_studentId > 0 && _studentId <= students.length, "This is an invalid student");

        uint256 index = _studentId - 1;
        if (index != students.length - 1) {
            students[index] = students[students.length - 1];
        }

        students.pop();
    }
}