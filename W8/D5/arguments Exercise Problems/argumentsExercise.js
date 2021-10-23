function sum(...args) {
  let sum = 0;
  for (let i = 0; i < args.length; i++){
    sum += args[i];
  }
  return sum;
};

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function(context, ...arguments) {
  return (...arg) => {
    this.call(context, ...arguments, ...arg);
  }
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true


function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      for (let i = 0; i < numArgs; i++) {
        sum += numbers[i];
      }
      console.log(sum);
      return sum;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
  
}

// const newSum = curriedSum(4);
// newSum(5)(30)(20)(1); // => 56


Function.prototype.curry = function(numArgs) {
  // console.log("test");
  let numbers = [];
  let f = this;
  function _curry(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return f(...numbers);
    } else {
      return _curry;
    }
  }

  return _curry;
}

const newF = function(...args) {
  let sum = 0;
  for (let i = 0; i < args.length; i++){
    sum += args[i];
  }
  console.log(sum);
  return sum;
}

const newFCurried = newF.curry(4);
newFCurried(5)(30)(20)(1);

