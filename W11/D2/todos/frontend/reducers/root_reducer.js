import { combineReducers } from "redux";
import { todosReducer} from "./todos_reducer";
import { stepsReducer} from "./steps_reducer";
import { allTodos } from "./selectors"

export const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer,
  // allTodos: allTodos
})