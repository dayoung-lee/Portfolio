import React, {Component} from 'react';
class TOC extends Component{    
    render(){
        var lists = [];
        var _data = this.props.data;
        var i = 0;
        while(i< _data.length){
            lists.push(
                <div>
                    {/* <p>{_data[i].id}</p> */}
                    <p id = "reviewName">{_data[i].name} | <span>{_data[i].date}</span></p>                    
                    <p>{_data[i].desc}</p>
                    <hr/>
                </div>
            );
            i++;
        }
          
      return(    
          
          <div>
            {lists}
          </div>    
      );
    }
  
  }
export default TOC;