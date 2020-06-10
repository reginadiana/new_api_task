import React, { Component } from "react";

class GET_API extends Component {
     constructor(props) {
       super(props);
       this.state = {
         tasks: [],
         tasksDone: 0,
	 tasksInProgress: 0
       };
     }

       async loadTasks() {
       let response = await fetch(`http://localhost:3001/tasks`);
       const tasks = await response.json();
       this.setState({ tasks: tasks });

	       tasks.map((task) => {
		if(task.done) {
		  this.setState({ tasksDone: this.state.tasksDone + 1 });
		} else {
		  this.setState({ tasksInProgress: this.state.tasksInProgress + 1 });
		}
	       }); 
       return tasks;
     }
} 	

export default GET_API;
