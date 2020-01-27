import React, {Component} from 'react';
class Control extends Component{
    render(){
      return(
        <div class = "control">
        <a href = "/create" onClick={function(e){
          e.preventDefault();
          this.props.onChangeMode('create');
        }.bind(this)}><button>Create</button></a>

        <a href = "/update" onClick={function(e){
          e.preventDefault();
          this.props.onChangeMode('update');
        }.bind(this)}><button>Update</button></a>

        <input id = "deleteBtn" type = "button" value = "Delete" onClick={function(e){
          e.preventDefault();
          this.props.onChangeMode('delete');
        }.bind(this)}></input>
      </div>
      );
   }
}

export default Control;