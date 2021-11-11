import React from 'react'
import { stepsReducer } from '../../reducers/steps_reducer'

const TodoDetailView = ({todo, removeTodo, recieveStep, removeStep}) =>(
  <>
    <p>{todo.body}</p>
    <ul>
      {steps.map(step => (
        <StepListItem step={step} key={step.id} removeStep={removeStep} receiveStep={receiveStep}/>
      ))}
    </ul>
  </>
)