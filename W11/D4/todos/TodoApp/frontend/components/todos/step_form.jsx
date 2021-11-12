import React from "react";

class StepForm extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      id: this.uniqueId(),
      todo_id: this.props.todo_id,
      title: "",
      done: false
    }


    this.updateTitle = this.updateTitle.bind(this)
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

  handleSubmit(e){
    e.preventDefault();
    let step = this.state;
    console.log(step)
    this.props.receiveStep(step);
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
        <input type="submit" value="Submit!" />
      </form>
    ) 
  }
}

export default StepForm;