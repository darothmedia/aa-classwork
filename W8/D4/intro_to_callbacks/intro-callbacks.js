class Clock {
  constructor() {
    // 1. Create a Date object.
    let dateobj = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = dateobj.getHours();
    this.minutes = dateobj.getMinutes();
    this.seconds = dateobj.getSeconds();
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    setInterval( () => {
      this._tick();
    }, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.

    let h = `${this.hours}`;
    if (h.length === 1) {h= '0'+ h;}
    let m = `${this.minutes}`;
    if (m.length === 1) { m = '0' + m; }
    let s = `${this.seconds}`;
    if (s.length === 1) { s = '0' + s; }


    console.log(`${h}:${m}:${s}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds += 1;
    if (this.seconds === 60){
      this.seconds = 0;
      this.minutes += 1;
      if (this.minutes === 60) {
        this.minutes = 0;
        this.hours += 1;
        if (this.hours === 24) {
          this.hours = 0;
        }
      }
    }
    // 2. Call printTime.
    this.printTime();
  }
}

const clock = new Clock();