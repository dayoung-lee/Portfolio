import React, {Component} from 'react';
import './Home.css';
import Background from '../img/main_noodle1.jpg';
import logo from '../img/logo.png';
import { Link } from 'react-router-dom';

var backgroundStyle = {
    width: "100%",
    height: "960px",
    backgroundImage: `url(${Background})`
  };

var menuColor = {
    color: "greenyellow"
};
  
class Home extends Component{
    render(){
        return(
            <div style = {backgroundStyle}>        
            <nav>        
                <ul>
                  <li><Link to = "/" style = {menuColor}>Home</Link></li>
                  <li><Link to = "/about">About</Link></li>
                  <li><Link to = "/menu">Menu</Link></li>
                  {/* <li><Link to = "/order">Order Online</Link></li> */}
                  <li><Link to = "/review">Reviews</Link></li>
                </ul>            
            </nav>
            <div id = 'logo' >
              <Link to = "/"><img src = {logo}/></Link>
            </div>
            <div className = "mainContainer">
              <p id = "title">Taste of the East</p>
              <p id = "title_desc">Toronto's Most acclaimed Asian Restaurant</p>
            </div>
    
              <div className = "mainBannerContainer">
                  <div className = "mainBanner1">
                    <a href = "#"></a>         
                      <p className = "contentTitle1">APPETIZER</p>
                      <p className = "content1">I'm a paragraph. Click here to add your own text and edit me.</p>
                  </div>
                  <div className = "mainBanner2">
                    <a href = "#"></a>         
                    <p className = "contentTitle2">SOUP</p>
                    <p className = "content2">I'm a paragraph. Click here to add your own text and edit me.</p>
                  </div>
                
                  <div className = "mainBanner3">
                    <a href = "#"></a>         
                    <p className = "contentTitle3">NOODLE</p>
                      <p className = "content3">I'm a paragraph. Click here to add your own text and edit me.</p>
                  </div>
    
                 <div id = 'menuBtn'><Link to = "/menu">See Menu</Link></div>            
            </div>
            <div className = "homeFooter">
                <div id ="address">
                    <p id = "footerTitle">ADDRESS</p>
                    <p id = "footerContent">100 Pemberton Ave</p>
                    <p id = "footerContent">North York, ON M2M4L1</p>
                  </div>
                  <div id ="hours">
                    <p id = "footerTitle">OPENING HOURS</p>
                    <p id = "footerContent">Mon- Fri: 11am - 10pm</p>
                    <p id = "footerContent">Sat - Sun: 11am - 12am</p>
                  </div>
                  <div id ="contact">
                    <p id = "footerTitle">CONTACT</p>
                    <p id = "footerContent">123-456-7890</p>
                    <p id = "footerContent">info@choisnoodle.com</p>
                  </div>
                  <div id = "info">
                      @2020 Choi's Noodle created by Dayoung Lee.
                  </div>
            </div>
                  
            </div>
        );
    }
}
export default Home;