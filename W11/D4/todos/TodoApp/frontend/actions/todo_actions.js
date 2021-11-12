export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO"
import * as APIutil from '../../util/todo_api_util.js'

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});
//array of todos

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo: todo
});
//single todo

export const removeTodo = (todo_id) => ({
  type: REMOVE_TODO,
  todo_id
})

export const fetchTodos = () => ({
  // return (dispatch) => {
  //   return (api.util.fetchTodos) => {

  //   }

  // }
})

