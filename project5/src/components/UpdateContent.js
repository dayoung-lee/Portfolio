import React, {Component} from 'react';
import moment from 'moment';

class UpdateContent extends Component{
    constructor(props){
        super(props);
        this.state = {
            id: this.props.data.id,
            title: this.props.data.title,
            name: this.props.data.name,
            date: this.props.data.date,
            desc: this.props.data.desc
        }
        this.inputFormHandler = this.inputFormHandler.bind(this);
    }
    inputFormHandler(e){
        this.setState({[e.target.name]: e.target.value});
    }
    render(){
        return(            
            <article>
                <h2>Update</h2>
                <form action="/update_process" method="post"
                    onSubmit={function(e){
                        var currentDate = moment().format("YYYY/MM/DD");
                        e.preventDefault();
                        this.props.onSubmit(
                            this.state.id,
                            this.state.title,
                            this.state.name,
                            currentDate,
                            this.state.desc
                        )}.bind(this)}>
                    
                    <input type = "hidden" name="id" value={this.state.id}></input>

                    <p><input 
                        type="text" 
                        name = "title" 
                        placeholder = "title"
                        size = "10"
                        value = {this.state.title}
                        onChange = {this.inputFormHandler}></input></p>
                    {/* read only name */}
                    <p><input type="text" name = "name"  size = "10" placeholder = "name" value={this.props.data.name}></input></p>
                    <p><textarea name ="desc" placeholder = "type here..." rows="4" cols="50" value={this.state.desc} 
                    onChange = {this.inputFormHandler}></textarea></p>
                    <p><input id = "submitBtn" type = "submit"></input></p>
                </form>
            </article>
        );
    }
}

export default UpdateContent;