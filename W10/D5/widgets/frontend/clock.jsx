import React from "react";

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date(),
    }
    this.tik = this.tik.bind(this)
  }

  componentDidMount(){
    let clockTikId = setInterval(this.tik, 1000);
  }

  componentWillUnmount(){
    clearInterval(clockTikId)
  }
  

  render(){
    return (
      <div>
        <h1 className="bluefish">
          TikTok Clarice
        </h1>
        <div className="timecontainer"> 
          <h2 className="redfish">{this.state.time.toLocaleTimeString()}</h2>
          <h2 className="redfish">{this.state.time.toDateString()}</h2>
        </div>
      </div>
    )
  }

  tik(){
    this.setState({ time: new Date()})
  }
}