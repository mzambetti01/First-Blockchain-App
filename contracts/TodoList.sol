pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
        string assigned_date;
        string complete_by_date;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public {
        createTask("Check out new apartment", "Feb 6th 2023", "Feb 8th 2023");
        createTask("Complete Quiz0: CS532", "Feb 6th 2023", "Feb 8th 2023");
        createTask("Submit Final Project: ECE 656", "None", "Feb 6th 2023");
        createTask("Call Landlord", "Feb 6th 2023", "Feb 9th 2023");
    }

    function createTask(string memory _content, string memory _adate, string memory _cdate) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false, _adate, _cdate);
        emit TaskCreated(taskCount, _content, false);

    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }




}