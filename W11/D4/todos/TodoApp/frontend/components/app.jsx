import React, {Component} from "react"
import TodoListContainer from "./todos/todo_list_container";

export default function App(){
  return(
    <div>
      <h1>ToDos App</h1>
      <TodoListContainer />
    </div>
  );
}