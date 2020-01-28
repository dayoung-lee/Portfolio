import React, {Component} from 'react';
import './Review.css';
import { Link } from 'react-router-dom';
import logo from '../img/logo.png';
import reviewImage from '../img/review.jpg';
import TOC from './components/TOC';

var menuColor = {
    color: "greenyellow"
};

class Review extends Component{
    constructor(props){
        super(props);
        this.state = {
            // selected_content_id: 4,
            contents:[
                {id: 1, name: 'Dayoung Lee', date: '2020/01/20', desc: 'The noodle is awesome!'},
                {id: 2, name: 'John Doe', date: '2020/01/22', desc: 'It is a bit spicy. good tho.'},
                {id: 3, name: 'Tyler Yeo', date: '2020/01/25', desc: 'nice place for cold weather.'}
            ]
        }
    }
    // getReadContent(){        
    //     var i = 0;        
    //     while(i<this.state.contents.length){
    //         var data = this.state.contents[i];
    //         if(data.id < this.state.selected_content_id)
    //             return data;
    //             break;        
    //         }
    //         i++;        
    // }

    // getContent(){
    //     var _article = null;
    //     var _content = this.getReadContent();
    //     _article = <ReadContent name = {_content.name} date = {_content.date} desc = {_content.desc}></ReadContent>

    //     return _article;
    // }

    render(){
        return(
            <div className = "reviewBody">        
                <nav>        
                    <ul>
                    <li><Link to = "/">Home</Link></li>
                    <li><Link to = "/about">About</Link></li>
                    <li><Link to = "/menu">Menu</Link></li>
                    {/* <li><Link to = "/order">Order Online</Link></li> */}
                    <li><Link to = "/review" style = {menuColor}>Reviews</Link></li>
                    </ul>
                </nav>               
                <div id = 'logo' ><Link to = "/"><img src = {logo}/></Link></div>
                <img id = "reviewImg" src = {reviewImage}/>
                <div className = "review">
                    <p>Review</p>
                    <hr/>                        
                        <div className = "reviewsContent">
                            <TOC onChangePage = {
                                function(id){
                                    this.setState({
                                        selected_content_id: Number(id)
                                    })
                                }.bind(this)}
                                data = {this.state.contents}></TOC>
                            
                            {/* {this.getContent()} */}
                        </div>
                </div>

                {/* footer */}
                <div className = "reviewFooter">
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
export default Review;