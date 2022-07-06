float[] array1 = {1000, 1000};

void setup() {
  println(myBestPalindrome(array1));
}

public boolean myBestPalindrome(float[] a) {
  boolean palindromity = true;
  if (a.length == 1) {
    return true;
  } else {
    for (int i = 0; i < a.length/2; i++) {
      if (a[i] == a[a.length-i-1]) {
        palindromity = true;
      } else {
        palindromity = false;
      }
    }
    if (palindromity) {
      return true;
    } else {
      return false;
    }
  }
}
