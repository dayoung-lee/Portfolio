import React, {Component} from 'react';

class TOC extends Component{
  shouldComponentUpdate(newProps, newState){    
    if(this.props.data === newProps.data){
      return false;
    }

    return true;
  }  
  render(){
        var lists = [];
        var _data = this.props.data;
        var i = 0;
        while( i< _data.length ){
            lists.push(
            <tr key={_data[i].id}>
                <td height = "40">{_data[i].id}</td>
                <td>
                <a href = {'/content/' + _data[i].id}                
                onClick = {function(id, e){  
                    e.preventDefault();
                    this.props.onChangePage(id);
                }.bind(this, _data[i].id)}
                >{_data[i].title}</a></td>
                <td>{_data[i].name}</td>
                <td>{_data[i].date}</td>
            </tr>
            );            
            i++;
        }
      return(
        <div class = "list">
          <table>
            <tr>
              <th width = "4%">#</th>
              <th width = "40%">Title</th>
              <th width = "15%">Name</th>
              <th width = "7%">Date</th>
            </tr>
            {lists}
            </table>
        </div>    
      );
    }
  }

  export default TOC;