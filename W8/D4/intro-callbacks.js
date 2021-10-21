class Clock {
  constructor() {
    // 1. Create a Date object.
    let dateobj = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = dateobj.getHours();
    this.minutes = dateobj.getMinutes();
    this.seconds = dateobj.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval({
      _tick()
    }, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();