import React, {Component} from 'react'
import TodoDetailViewContainer from './todo_detail_view_container';


class TodoListItem extends Component{

  constructor(props){
    super(props)
    this.state = {
      detailView: false
    }

    this.handleDetailViewClick = this.handleDetailViewClick.bind(this)
  }

  handleDetailViewClick(){
    console.log(this.state)
    this.setState({detailView: !this.state.detailView})
  }

  render(){
    let {todo, receiveTodo} = this.props;
    return(
      <li>
        <span onClick={this.handleDetailViewClick}> {todo.title} </span>
        <button onClick={ () => {
          todo.done = !todo.done;
          receiveTodo(todo);
        }}>
          {(todo.done) ? <> &#10003; </> : <> &#x2610; </>}
        </button>
        
        {this.state.detailView ? <><br/><TodoDetailViewContainer todo={todo} /></>: <></>}
      </li>
    )
  }
}

export default TodoListItem