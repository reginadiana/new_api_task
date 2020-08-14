import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Col from 'react-bootstrap/Col';
import './style.css'
import { BASE_URL } from '../../services/GET_API'
   
function CreateTask(props) {
  const [title, setTitle] = useState('');
  
  const headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  }
  
  const handleSubmit = (async () => {
    const content = JSON.stringify({ task: { title: title, done: false } })
    if(title) {
      await fetch(BASE_URL, { method: 'POST', headers: headers, body: content })
      setTitle('');
      props.loadTasks();
    } else {
      alert("Task cannot be blank");
    }
  });
   
  return (
    <div>
      <Form.Group>
        <Form.Row>
          <Col>
            <Form.Control size="lg" type="text" placeholder="Write your new task ..." onChange={e => setTitle(e.target.value)}/>
          </Col>
          <Col xs="auto">
            <Button type="submit" className="mb-2" onClick={e => handleSubmit()}>
              Register
            </Button>
          </Col>
        </Form.Row>
      </Form.Group>
    </div>
  );
}
   
export default CreateTask;