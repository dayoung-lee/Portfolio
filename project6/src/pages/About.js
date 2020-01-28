import React, {Component} from 'react';
import './About.css';
import Background from '../img/aboutImg1.jpg';
import logo from '../img/logo.png';
import { Link } from 'react-router-dom';

var backgroundStyle = {
    width: "630px",
    height: "880px",
    backgroundImage: `url(${Background})`
  };

var menuColor = {
    color: "greenyellow"
};
class About extends Component{
    render(){
        return(
            <div>        
                <nav>        
                    <ul>
                    <li><Link to = "/">Home</Link></li>
                    <li><Link to = "/about" style = {menuColor}>About</Link></li>
                    <li><Link to = "/menu">Menu</Link></li>
                    {/* <li><a href = "/order">Order Online</a></li> */}
                    <li><Link to = "/review">Reviews</Link></li>
                    </ul>
                </nav>
                <div id = 'logo' ><Link to = "/"><img src = {logo}/></Link></div>
                <div id = "aboutImg" style = {backgroundStyle}></div>
                
                <div id = "aboutContent">
                    <p id = "contentTitle">Our Story Begins In The East</p>
                    <p id = "contentP">I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. Feel free to drag and drop me anywhere you like on your page. I’m a great place for you to tell a story and let your users know a little more about you.This is a great space to write long text about your company and your services. You can use this space to go into a little more detail about your company. 
                    </p>
                </div>

            </div>
        );
    }
}
export default About;