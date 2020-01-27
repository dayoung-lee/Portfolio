import React, {Component} from 'react';
import moment from 'moment';

class CreateContent extends Component{
    render(){
        return(
            <article>
                <h2>Create</h2>
                <form action="/create_process" method="post"
                    onSubmit={function(e){
                        var currentDate = moment().format("YYYY/MM/DD");
                        e.preventDefault();
                        this.props.onSubmit(
                            e.target.title.value,
                            e.target.name.value,
                            currentDate,
                            e.target.desc.value
                        )                     
                    }.bind(this)}>
                    <p><input type="text" name = "title" placeholder = "title" size = "10"></input></p>
                    <p><input type="text" name = "name" placeholder = "name" size = "10"></input></p>
                    <p><textarea name ="desc" placeholder = "type here..." rows="4" cols="50"></textarea></p>
                    <p><input type = "submit"></input></p>
                </form>
            </article>
        );
    }
}

export default CreateContent;