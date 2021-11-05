import React from "react";

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date(),
    }
    this.tik = this.tik.bind(this)
    this.seconds = this.state.time.getSeconds()
    this.minutes = this.state.time.getMinutes()
    this.hours = this.state.time.getHours()
  }

  componentDidMount(){
    console.log('componentDidMount() lifecycle')
    this.tik()
  }
  

  render(){
    console.log('render() lifecycle')
    let clockTikIds = setInterval(() => {
    }, 1000)
  
    
    
    return (
      <div>
        <h1>
          TikTok
        </h1>
        <h2>{this.hours}:{this.minutes}:{this.seconds}</h2>
      </div>
    )
  }

  tik(){
    let newSeconds = this.seconds + 1
    this.setState({})
  }
}