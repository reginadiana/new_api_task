import React, { useState } from "react";
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import './style.css'
import { BASE_URL } from '../../services/GET_API'
   
function CreateTask(props) {
  const [title, setTitle] = useState('');
  const [show, setShow] = useState('');

  const handleSubmit = (async () => {
    if(title) {
      await fetch(BASE_URL, {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
          body: JSON.stringify({ task: { title: title, done: false } })
      })
      setShow(false)
      setTitle('')
      props.loadTasks();

    } else {
      alert("Task cannot be blank");
    }
  });
  
  return (
    <div>
      <Button onClick={e => setShow(true)} variant="dark" className="float-right create_task_btn">+ Tasks</Button>
      <Modal show={show || false} onHide={e => setShow(false)} className="card-new-task">
        <Modal.Header closeButton>
          <Modal.Title>New Task</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form.Control type="email" placeholder="Enter with your task..." value={title || ''} onChange={e => setTitle(e.target.value)} />
        </Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={e => setShow(false)}>Close</Button>
            <form onSubmit={handleSubmit}>
              <Button variant="dark" type="submit" className="button-create-task">Create</Button>
            </form>
          </Modal.Footer>
        </Modal>
    </div>
  );
}
   
export default CreateTask;
