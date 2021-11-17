import { combineReducers } from 'redux';
import entitiesReducer from './entities';
import sessionReducer from './sessions'

export default combineReducers({
  entities: entitiesReducer,
  session: sessionReducer,
});
