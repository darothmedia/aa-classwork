import React from "react";

const StepListItem = ({step, receiveStep}) => (
  <li>
    <span>{step.title}</span>
    <button onClick={ () => {
      step.done = !step.done;
      receiveStep(step);
    }}>
      {(step.done) ? <> &#10003; </> : <> &#x2610; </>}
    </button>

  </li>
)

export default StepListItem;