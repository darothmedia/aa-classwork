import React from 'react'
import StepListItem from './step_list_item'
import StepForm from './step_form'

const TodoDetailView = ({todo: {body: todo_body, id: todo_id}, steps, removeTodo, receiveStep}) =>(
  <>
    <button onClick={() => removeTodo(todo_id)}>Delete</button>
    <p>{todo_body}</p>
    <ul>
      {steps.filter(step => step.todo_id === todo_id).map(step => (
        <StepListItem step={step} key={step.id} receiveStep={receiveStep}/>
      ))}
    </ul>
    <StepForm  receiveStep={receiveStep} todo_id={todo_id}/>
  </>
)

export default TodoDetailView