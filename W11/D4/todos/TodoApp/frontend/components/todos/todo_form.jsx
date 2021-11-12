import React from 'react'


class TodoForm extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      id: this.uniqueId(),
      title: "",
      body: "",
      done: false
    }


    this.updateTitle = this.updateTitle.bind(this)
    this.updateBody = this.updateBody.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.uniqueId = this.uniqueId.bind(this)
  }

  uniqueId(){
    return new Date().getTime()
  }

  updateTitle(e){
    this.setState({
      title: e.target.value
    })
  }

  updateBody(e){
    this.setState({
      body: e.target.value
    })
  }

  handleSubmit(e){
    e.preventDefault();
    let todo = this.state;
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: "",
      id: this.uniqueId(),
    })
  }


  render() {
    return(

      <form onSubmit={this.handleSubmit} >
        <label htmlFor="title">Title: </label>
        <input type="text" id="title" onChange={this.updateTitle} value={this.state.title}/>
        <br />
        <label htmlFor="body">Body: </label>
        <input type="text" id="body" onChange={this.updateBody} value={this.state.body}/>
        <br />
        <input type="submit" value="Submit!" />
      </form>
    ) 
  }
}

export default TodoForm