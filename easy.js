// Run - length encoding is a fast and simple method of encoding strings.
// The basic idea is to represent repeated successive characters as a single count
// and character. For example, the string "AAAABBBCCDAA" would be encoded as "4A3B2C1D2A".

// Implement run - length encoding and decoding. You can assume the string to be
// encoded have no digits and consists solely of alphabetic characters.
// You can assume the string to be decoded is valid.

function encode(str) {
  let newStr = "";
  let counter = 0;

  for (let i = 0; i < str.length; i++) {
    if (str[i] === str[i + 1]) {
      counter++;
    } else {
      newStr += `${counter + 1}${str[i]}`;
      counter = 0;
    }
  }

  return newStr;
}

function decode(str) {
  let newStr = "";

  for (let i = 0; i < str.length; i++) {
    if (!isNaN(str[i])) {
      counter = +str[i];
      while (counter > 0) {
        newStr += str[i + 1];
        counter--;
      }
    }
  }

  return newStr;
}

// console.log(decode("4A3B2C1D2A") === "AAAABBBCCDAA");

// The edit distance between two strings refers to the minimum number of
// character insertions, deletions, and substitutions required to change one string
// to the other.For example, the edit distance between “kitten” and “sitting” is
// three: substitute the “k” for “s”, substitute the “e” for “i”, and append a “g”.

// Given two strings, compute the edit distance between them.

function editDistance(str1, str2) {
  let changes = 0;
  while (str1 && str2) {
    let char1 = str1.slice(0, 1);
    let char2 = str2.slice(0, 1);
    str1 = str1.slice(1);
    str2 = str2.slice(1);

    if (char1 !== char2) {
      changes++;
    }
  }

  return changes + Math.abs(str1.length - str2.length);
}

// console.log(editDistance("abc", "abc"));

// Compute the running median of a sequence of numbers.That is, given a stream of
// numbers, print out the median of the list so far on each new element.

// Recall that the median of an even - numbered list is the average of the two middle numbers.

// For example, given the sequence[2, 1, 5, 7, 2, 0, 5], your algorithm should print out:

// 2
// 1.5
// 2
// 3.5
// 2
// 2
// 2

function runningMedian(array) {
  array = array.sort((a, b) => a - b);
  for (let i = 0; i < array.length; i++) {
    if (i % 2 === 0) {
      let medianIdx = Math.floor(i / 2);
      console.log(array[medianIdx]);
    } else {
      let first = Math.floor(i / 2);
      let second = Math.floor(i / 2) + 1;
      console.log((array[first] + array[second]) / 2);
    }
  }
}

// console.log(runningMedian([2, 1, 5, 7, 2, 0, 5]));

// The power set of a set is the set of all its subsets.
// Write a function that, given a set, generates its power set.

// For example, given the set { 1, 2, 3 }, it should return
// {{ }, { 1 }, { 2 }, { 3 }, { 1, 2 }, { 1, 3 }, { 2, 3 }, { 1, 2, 3 }}.

// You may also use a list or array to represent a set.

// var subsets = function (nums) {
//   nums = Array.from(nums);
//   const res = [];
//   subsetsImpl(nums, res);
//   return res;
// };

// function subsetsImpl(nums, res, i = 0, curr = []) {
//   res.push(curr);

//   for (; i < nums.length; i += 1) {
//     subsetsImpl(nums, res, i + 1, curr.concat(nums[i]));
//   }
// }

function subSets(set) {
  let given_array = Array.from(set);
  const answer = [];
  buildSubsets(given_array, answer);
  return answer;
}

function buildSubsets(nums, answer, i = 0, currentSubset = []) {
  answer.push(currentSubset);

  for (; i < nums.length; i += 1) {
    buildSubsets(nums, answer, i + 1, currentSubset.concat(nums[i]));
  }
}

// function powerSet(set) {
//   let given_array = Array.from(set);
//   let subset = new Array(given_array.length).fill(null);

//   buildTree(given_array, subset, 0);
// }

// function buildTree(given_array, subset, i) {
//   if (i >= given_array.length) printSubset(subset);

//   subset[i] = null;
//   buildTree(given_array, subset, i + 1);
//   subset[i] = given_array[i];
//   buildTree(given_array, subset, i + 1);
// }

// function printSubset(subset) {
//   let newSubset = [];

//   subset.forEach((sub) => {
//     if (sub !== null) newSubset.push(sub);
//   });

//   return newSubset;
// }

let mySet = new Set();
mySet.add(1);
mySet.add(2);
mySet.add(3);

console.log(subSets(mySet));

[1, 2, 3].sort(a);
