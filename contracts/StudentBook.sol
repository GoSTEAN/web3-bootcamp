// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract StudentBook {
    address public owner;

    struct Student {
        address studentAddress;
        string name;
        uint8 age;
        uint256 studentId;
    }

    constructor() {
        owner = msg.sender;
    }

    Student[] private students;

    function addStudent(address _studentAddress, string memory _name, uint8 _age) public  {
        require(owner == msg.sender, "You are not permitted ");
        require(_age >= 18, "Grow up a bit and try again!");

        uint256 _studentId = students.length + 1;
        Student memory student = Student({
            studentAddress: _studentAddress,
            name: _name,
            age: _age,
            studentId: _studentId
        });

        students.push(student);
    }

    function getStudent(uint256 _studentId) public view returns (Student memory) {
        return students[_studentId - 1];
    }

    function updateStude(uint256 _studentId, uint8 _age, string memory _name, address _studentAddress) public  {
        require(owner == msg.sender, "You are not permitted");
        require(_age >= 18, "Grow up a bit and try again!");
        require(_studentId > 0 && _studentId <= students.length, "This human does not exist");

        Student storage student = students[students.length - 1];
        student.studentAddress = _studentAddress;
        student.name = _name;
        student.age = _age;

    }

    function deleteStudent(uint256 _studentId) public {
        require(owner == msg.sender, "You are not permitted");
        require(_studentId > 0 && _studentId <= students.length, "This human does not exist");  

        uint256 index = _studentId - 1;
        if (index != students.length - 1) {
            students[index] = students[students.length - 1];
        }

        students.pop();
    }

    function updateStudentId() internal {
        for (uint256 i = 0; i < students.length; i++) {
            students[i].studentId = i++;
        }
    }


}
