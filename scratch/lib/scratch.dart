int reverse(int x) => int.parse(x.toString().split('').reversed.join(''));
bool isPalindrome(int x) => reverse(x) == x;

int timesToPalindrome(int x) {
  var num = x;
  var count = 0;
  while (!isPalindrome(num)) {
    num = reverse(num) + num;
    count = count + 1;
  }
  print('Palindrome is ${num}');
  return count;
}

int rTimesToPalindrome(int x) {
  int loop(int num, {int count = 0}) {
    if (isPalindrome(num)) {
      print('R Palindrome is ${num}');
      return count;
    } else {
      var nextNum = reverse(num) + num;
      return loop(nextNum, count: count + 1);
    }
  }

  return loop(x);
}
