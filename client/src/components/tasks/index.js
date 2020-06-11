import React, { Component } from 'react';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import List from '../list/index';
import CreateTask from '../create_tasks/index';
import Button from 'react-bootstrap/Button';
import './style.css'
   
class Tasks extends Component {

     constructor(props) {
       super(props);
       this.state = {
         tasks: []
       };
       this.loadTasks = this.loadTasks.bind(this);
     }
     
     async loadTasks() {
       let response = await fetch(`https://test-rails-app-to-do.herokuapp.com/tasks`);
       const tasks = await response.json();
       this.setState({ tasks: tasks });
     }
     
     componentDidMount() {
       this.loadTasks();
     }
     
      deleteAll() {
         if (window.confirm(`Are you sure you want to delete all tasks`)) {
	     this.state.tasks.map((task) => {
		fetch(`https://test-rails-app-to-do.herokuapp.com/tasks/${task.id}`, {method: 'DELETE'});
		this.loadTasks();
             })
        }
     }

     render() {

       const { tasks } = this.state;

       return (
	<>
         <Row>
           <CreateTask loadTasks={this.loadTasks}/>
           <Col xs={{ span: 15, offset: 0 }} className="tasks_list">
             <p className="title">To-do</p>
	     <List loadTasks={this.loadTasks} tasks={tasks.filter((task) => task.done !== true)}/>
           </Col>
           <Col xs={{ span: 15, offset: 0 }} className="tasks_list">
             <p className="title">Done</p>
             <List loadTasks={this.loadTasks} tasks={tasks.filter((task) => task.done === true)}/>
           </Col>
         </Row>
         <Button onClick={() => this.deleteAll()} 
		variant="red" className="float-right remove_tasks_btn">
		Remove all tasks
	  </Button>
      </>
       );
     }
   }
   
export default Tasks;
