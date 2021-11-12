import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view'

import { removeTodo } from '../../actions/todo_actions';
import { receiveStep } from '../../actions/step_actions';
import { allSteps } from '../../reducers/selectors'

const mapStateToProps = (state) => {
  
  return {steps: allSteps(state)}
}

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  removeTodo: todo_id => dispatch(removeTodo(todo_id))
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoDetailView)
