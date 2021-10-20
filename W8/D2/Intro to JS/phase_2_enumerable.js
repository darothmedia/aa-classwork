Array.prototype.myEach = function(cb) {
  for (let i = 0; i <= this.length -1; i++) {
    cb(this[i]);
  }
}

// let arr = [1, 3, 5, 7, 9, 11];
// let cb = function (num) {
//   return num + 1;
// }

// console.log(arr.myEach(cb));


Array.prototype.myMap = function (cb) {
  let newArr = [];

  this.myEach( function(num) {
      newArr.push(cb(num));
    }
  )

  return newArr;
}



// let cb = function (num) {
//   return num += 1;
// }

// console.log(arr);
// console.log(arr.myEach(cb));
// console.log(arr);

// console.log(arr.myMap(cb))


Array.prototype.myReduce = function(acc, iv=this[0]) {
  let sum = 0
  if (iv !== this[0]) {
    sum = iv;
  } else if (iv === this[0]) {
    sum = 0;
  }

  this.myEach(function (acc, iv=this[0]) {
    sum += acc
  }
  )

  return sum;
}

let arr = [1, 3, 5, 7, 9, 11];

console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}));

console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}, 25));

