import React from 'react'

class TodoListItem extends React.Component {
  constructor(props) {
    super (props);
    this.state = {
      detailView: false
    }
  }


  render(){
    let {todo, removeTodo, receiveTodo} = this.props
    return (
      <li>
        <span onClick={() => this.setState({detailView: !this.detailView})}
        >{todo.title}  </span>
        <button onClick={() => {
          (todo.done) ? todo.done = false : todo.done = true
          receiveTodo(todo)
        }}>{(todo.done) ? <> &#10003; </> : <> &#x2610; </>}</button>
        <button onClick={() => removeTodo(todo.id)}>Delete</button>
      </li>
    )
  }
}

export default TodoListItem