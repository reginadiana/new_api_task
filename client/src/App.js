import React from 'react';
import './App.css';
import Container from 'react-bootstrap/Container'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faCheckCircle, faTrashAlt } from '@fortawesome/free-solid-svg-icons'

/*Componentes*/
import Header from './components/header/index';
import Tasks from './components/tasks/index';
import CountTasks from './components/count_tasks/index';
   
library.add(faCheckCircle, faTrashAlt)

function App() {

  return (
    <div className="App">
      <Header/>
      <CountTasks />
	<Container>
          <Tasks/>
        </Container>
    </div>
  );
}

export default App;
