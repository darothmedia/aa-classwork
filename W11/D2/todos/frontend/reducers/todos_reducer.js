import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO} from '../actions/todo_actions.js'

export const todosReducer = (state={}, action) => {
  Object.freeze(state)
  let newState = {}
  switch (action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((todo) => {
        newState[todo.id] = todo
      });
      return newState;
    case RECEIVE_TODO:
      newState = Object.assign({}, state);
      newState[action.todo.id] = action.todo;
      return newState;
    case REMOVE_TODO:
      newState = Object.assign({}, state);
      delete newState[action.todo.id];
      return newState;
    default: 
      return state;
  }
}

