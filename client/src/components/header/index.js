import React, { Component } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import './style.css'
   
class Header extends Component {
     render() {
       return (
         <div className="navbar">
	  <div className="nav-items">
                 <FontAwesomeIcon className="check-circle" icon="check-circle" size="lg"/> 
		 <p>Task Finisher</p>
           </div>
         </div>
       );
     }
   }
   
export default Header;
