import React, {Component} from 'react';
class Subject extends Component{
    render(){
      return(
        <header>
          <p><a href = "/" onClick={function(e){
              e.preventDefault();
              this.props.onChangePage();
          }.bind(this)}>{this.props.title}</a></p>
          {this.props.sub}
          </header>
      );
   }
}

export default Subject;