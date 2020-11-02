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

console.log(decode("4A3B2C1D2A") === "AAAABBBCCDAA");
