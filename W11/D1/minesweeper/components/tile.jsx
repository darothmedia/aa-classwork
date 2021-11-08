import React from 'react'
import Board from 'board.jsx'

export default class Tile extends Board{
  constructor(props){
    super(props);
  }

  render(){
    return(
      <div>
        T
      </div>
    )
  }
}