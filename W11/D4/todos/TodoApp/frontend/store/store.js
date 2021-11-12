import {createStore, applyMiddleware} from 'redux'
import {rootReducer} from '../reducers/root_reducer.js'
import thunk from '../middleware/thunk.js'

export const configureStore = function(preLoadedState = {}){
  return createStore(rootReducer, preLoadedState, applyMiddleware(thunk))
}