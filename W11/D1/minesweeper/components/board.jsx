import React from 'react'

export default class Board extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    return (
      <div className="board-div">
        {this.props.board.grid.map((row, i) => {
          return <div className={i} key={i}>board div</div>
        })}
      </div>
    );
  }
}