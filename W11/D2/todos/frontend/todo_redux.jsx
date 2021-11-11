import React from "react"
import ReactDOM from "react-dom"
import Root from "./components/root.jsx"
import {configureStore} from "./store/store.js"
import * as ToDoActions from './actions/todo_actions.js'
import * as StepActions from './actions/step_actions.js'
import { allTodos } from "./reducers/selectors.js"


const preloadedState = {
  todos: {
    1: {
      id: 1,
      title: 'take a shower',
      body: 'and be clean',
      done: false
    },
    2: {
      id: 2,
      title: 'take a bath',
      body: 'and be clean',
      done: false
    }
  },
  steps: {
    1: { // this is the step with id = 1
      id: 1,
      title: 'walk to store',
      done: false,
      todo_id: 1
    },
    2: { // this is the step with id = 2
      id: 2,
      title: 'buy soap',
      done: false,
      todo_id: 1
    }
  }
}

document.addEventListener("DOMContentLoaded", function(){
  const store = configureStore(preloadedState);
  ReactDOM.render(<Root store={store}/>, document.getElementById("root"));


  window.store = store;
  window.receiveTodos = ToDoActions.receiveTodos;
  window.receiveTodo = ToDoActions.receiveTodo;
  window.removeTodo = ToDoActions.removeTodo

  window.receiveSteps = StepActions.receiveSteps;
  window.receiveStep = StepActions.receiveStep;
  window.removeStep = StepActions.removeStep

  window.allTodos = allTodos
})