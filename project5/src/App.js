import React, {Component, createContext} from 'react';
import TOC from './components/TOC';
import MainContent from './components/MainContent';
import ReadContent from './components/ReadContent';
import UpdateContent from './components/UpdateContent';
import CreateContent from './components/CreateContent';
import Subject from './components/Subject';
import Control from './components/Control';
import SlideMenu from 'react-slide-menu';
import './App.css';

import $ from "jquery";

class App extends Component {  
  constructor(props){
    super(props);
    this.max_content_id=3;
    this.state = {
      mode:'welcome',
      // selected_content_id : 1,
      subject:{title:'BOARD'},
      welcome:{title:'Welcome', desc:'Hello, React!! This is main page.'},     
      contents:[
        {id:1, title:'Test1', name: 'Dayoung Lee', date: '2020/01/20', desc: 'This is test1!'},
        {id:2, title:'Test2', name: 'Jane Doe', date: '2020/01/23', desc: 'This is test2!'},
        {id:3, title:'Test3', name: 'Tyler Yeo', date: '2020/01/24', desc: 'This is test3!'}
      ]
    }
  }
  
  getReadContent(){
    var i = 0;
        while (i < this.state.contents.length){        
          var data = this.state.contents[i];  
          if(data.id === this.state.selected_content_id){
            return data;
            // _title = data.title;
            // _name = data.name;
            // _date= data.date;
            // _desc = data.desc;
            break;
          }
          i++;
        }
  }
  getContent(){
      var _title, _name, _date, _desc, _article = null;
      // main
      if(this.state.mode === 'welcome'){
        _title = this.state.welcome.title;
        _desc = this.state.welcome.desc;
        _article = <MainContent title = {_title} desc = {_desc}></MainContent>
      } // read
      else if (this.state.mode === 'read'){
        var _content = this.getReadContent();
        _article = <ReadContent title = {_content.title} name = {_content.name} date = {_content.date} desc = {_content.desc}></ReadContent>        
      }
      // create
      else if (this.state.mode === 'create'){
        _article = <CreateContent onSubmit={function(_title, _name, _date, _desc){
          // add content to this.state.content
          this.max_content_id++;
          // this.state.contents.push(
          //   {id:this.max_content_id, title:_title, name: _name, date: _date, desc:_desc}
          // );
          // var _contents = this.state.contents.concat(
          //   {id:this.max_content_id, title:_title, name: _name, date: _date, desc:_desc});

          var _contents = Array.from(this.state.contents);
          _contents.push({id:this.max_content_id, title:_title, name: _name, date: _date, desc:_desc});
          this.setState({
            contents: _contents,
            mode: 'read',
            selected_content_id: this.max_content_id
          })        
        }.bind(this)}>        
        </CreateContent>     
      } 
      // update
      else if (this.state.mode === 'update'){
        var _content = this.getReadContent();
        _article = <UpdateContent data = {_content} onSubmit={
          function(_id, _title, _name, _date, _desc){
            var _contents = Array.from(this.state.contents);
            var i = 0;
            while(i<_contents.length){
              if(_contents[i].id === _id){
                _contents[i] = {id:_id, title:_title, name:_name, date:_date, desc:_desc}
                break;
              }
              i++;
            }
            this.setState({
            contents: _contents,
            mode:'read'
          })        
          }.bind(this)}>        
        </UpdateContent>     
      }
      return _article;
  }
  
  

  render(){        
  
    return (
      <div className="App">        

        <Subject 
          title = {this.state.subject.title} 
          onChangePage = {function(){
            this.setState({
              mode:'welcome'
            })
          }.bind(this)}>
        </Subject>
      
        <TOC 
        onChangePage={
          function(id){
            this.setState({
              mode:'read',
              selected_content_id:Number(id)
            })
          }.bind(this)}
        data = {this.state.contents}></TOC>        
  
        <Control onChangeMode = {function(_mode){
          if(_mode === 'delete'){
            if(window.confirm('Do you really want to delete it?')){
              var _contents = Array.from(this.state.contents);
              var i = 0;
              while(i< _contents.length){
                if(_contents[i].id === this.state.selected_content_id){
                  _contents.splice(i,1);
                  break;
                }
                i++;
              }
              this.setState({
                mode:'welcome',
                contents:_contents
              });
              alert('deleted!');
            }
          }else{            
            this.setState({
              mode: _mode 
            });
          }
        }.bind(this)}></Control>

        {this.getContent()}
      
      </div>
    );
  }
}

export default App;
