import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP} from '../actions/step_actions.js'

export const stepsReducer = (state={}, action) => {
  Object.freeze(state)
  const newState = {}
  //made newState into a constant
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach((step) => {
        newState[step.id] = step
      });
      return newState;
    case RECEIVE_STEP:
      Object.assign(newState, state);
      //assign state to newState rather than an empty array
      newState[action.step.id] = action.step;
      return newState;
    case REMOVE_STEP:
      Object.assign(newState, state);
      delete newState[action.step.id];
      return newState;
    default: 
      return state;
  }
}

