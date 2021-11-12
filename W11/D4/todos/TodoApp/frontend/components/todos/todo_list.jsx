import React from "react";
import TodoListItem from './todo_list_item.jsx'
import TodoForm from "./todo_form.jsx";

const TodoList = ({todos, receiveTodo}) => (
  <>
    <ul>
      {todos.map((todo)=> <TodoListItem todo={todo} key={todo.id} receiveTodo={receiveTodo}/>)}
    </ul>
    <TodoForm receiveTodo={receiveTodo}/>
  </>
)

export default TodoList;