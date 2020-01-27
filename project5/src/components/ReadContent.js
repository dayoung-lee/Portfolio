import React, {Component} from 'react';


class ReadContent extends Component{    
    render(){
      return(        
        <article>
          <p id = "title">{this.props.title}</p>
          <p id = "nameDate">Name: {this.props.name} Date: {this.props.date}</p>          
          <p id = "content">Content: {this.props.desc}</p>
      </article>
      );
    }
  
  }
export default ReadContent;