import React, { Component } from 'react';
import './style.css'
import { BASE_URL } from '../../services/GET_API'

class CountTasks extends Component {
	constructor(props) {
    	super(props);
    	this.state = {
        	tasks: [],
        	tasksDone: 0,
			tasksInProgress: 0
    	};
	}
	
	async loadTasks() {
		let response = await fetch(BASE_URL);
		const tasks = await response.json();
		this.setState({ tasks: tasks });
		
		tasks.map((task) => {
			if(task.done) {
				console.log(task);
				this.setState({ tasksDone: this.state.tasksDone + 1 });
			} else {
				this.setState({ tasksInProgress: this.state.tasksInProgress + 1 });
			}
		});
	}

	componentDidMount() {
		this.loadTasks();
	}
	 
	render() {
    	const { tasksDone, tasksInProgress } = this.state;
	
		return (
			<div className="div-results">
				<div className="result">
					<h3>{tasksDone}</h3>
					<p>Tasks Completed</p>
				</div>
				<div className="result">
					<h3>{tasksInProgress}</h3>
					<p>Tasks To be Done</p> 
				</div>
			</div>
		);
	}
} 	

export default CountTasks;