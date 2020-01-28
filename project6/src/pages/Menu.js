import React, {Component} from 'react';
import './Menu.css';
import { Link } from 'react-router-dom';
import logo from '../img/logo.png';
import Background from '../img/menu_img.jpg';

var backgroundStyle = {
    width: "100%",
    height: "1000px",
    backgroundImage: `url(${Background})`
  };
var menuColor = {
    color: "greenyellow"
};


class Menu extends Component{
    render(){
        return(
            <div style = {backgroundStyle}>        
                <nav>        
                    <ul>
                    <li><Link to = "/">Home</Link></li>
                    <li><Link to = "/about">About</Link></li>
                    <li><Link to = "/menu" style = {menuColor}>Menu</Link></li>
                    {/* <li><Link to = "/order">Order Online</Link></li> */}
                    <li><Link to = "/review">Reviews</Link></li>
                    </ul>
                </nav>               
                <div id = 'logo' ><Link to = "/"><img src = {logo} alt = "logo"/></Link></div>

                <div className = "menu">
                    <p>MENU</p>
                    <hr/>
                    <p id = "menuItems">
                        Appetizer
                        <ol>
                            <li>AAA ..................................................................................... $4</li>
                            <li>BBB ...................................................................................... $8</li>
                            <li>CCC ...................................................................................... $5</li>
                            <li>DDD ..................................................................................... $6</li>
                        </ol>
                        Soup
                        <ol>
                        <li>AAA ..................................................................................... $4</li>
                            <li>BBB ...................................................................................... $8</li>
                            <li>CCC ...................................................................................... $5</li>
                            <li>DDD ..................................................................................... $6</li>
                        </ol>
                        Noodle
                        <ol>
                        <li>AAA ..................................................................................... $4</li>
                            <li>BBB ...................................................................................... $8</li>
                            <li>CCC ...................................................................................... $5</li>
                            <li>DDD ..................................................................................... $6</li>
                        </ol>
                        
                    </p>

                </div>

                 <div className = "menuFooter">
                    <div id ="address">
                        <p id = "footerTitle">ADDRESS</p>
                        <p id = "footerContent"> 100 Pemberton Ave</p>
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
export default Menu;