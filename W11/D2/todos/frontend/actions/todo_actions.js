export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO"

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

