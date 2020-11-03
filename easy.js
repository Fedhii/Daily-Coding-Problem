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

console.log(editDistance("abc", "abc"));
