import React, {Component} from 'react';
import './Order.css';
import { Link } from 'react-router-dom';
import logo from '../img/logo.png';
import Background from '../img/menu_img.jpg';

var backgroundStyle = {
    width: "100%",
    height: "960px",
    backgroundImage: `url(${Background})`
  };


class Order extends Component{
    render(){
        return(
            <div style = {backgroundStyle}>        
                <nav>        
                    <ul>
                    <li><Link to = "/">Home</Link></li>
                    <li><Link to = "/about">About</Link></li>
                    <li><Link to = "/menu">Menu</Link></li>
                    {/* <li><Link to = "/order">Order Online</Link></li> */}
                    <li><Link to = "/review">Reviews</Link></li>
                    </ul>
                </nav>               
                <div id = 'logo' ><a href = "/"><img src = {logo}/></a></div>

                <div className = "order">
                    <p>ORDER ONLINE</p>      

                </div>
            </div>
        );
    }
}
export default Order;