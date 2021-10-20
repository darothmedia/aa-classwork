Array.prototype.uniq = function () {
  let uniques = []

  for (let i = 0; i < this.length - 1 ; i++) {
    if (!uniques.includes(this[i])) {
      uniques.push(this[i]);
    }
  }

  return uniques;
}

// let arr = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
// console.log(arr.uniq());

// ([1, 2, 2, 3, 3, 3].uniq() => [1, 2, 3])

Array.prototype.twoSum = function () {
  let sums = []

  for (let i = 0; i <= this.length - 2; i++) {
    for (let j = i + 1; j <= this.length - 1; j++) {
      if (this[i] + this[j] === 0) {
        sums.push([i, j]);
      }
    }
  }

  return sums
} 

// let arr = [1, -1, 4, 8, 6, -4, 2, -8]

// console.log(arr.twoSum());

Array.prototype.transpose = function () {
  let transposed = []

  for (let i = 0; i <= this.length - 1; i++) {
    let newArr = []
    for (let j = 0; j <= this.length - 1; j++) {
      newArr.push(this[j][i])
    }
    transposed.push(newArr)
  }
  return transposed
}


let arr = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

console.log(arr.transpose())






