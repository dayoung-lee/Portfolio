import React, {Component} from 'react';
import { Route } from 'react-router-dom';
import { Home, About, Menu, Review } from 'pages';

class App extends Component {
  render(){
    return (
      <div>
        <Route exact path = "/" component={Home}/>
        <Route path = "/about" component={About}/>
        <Route path = "/menu" component={Menu}/>
        {/* <Route path = "/order" component={Order}/> */}
        <Route path = "/review" component={Review}/>
      </div>
    );
  }  
}


export default App;
