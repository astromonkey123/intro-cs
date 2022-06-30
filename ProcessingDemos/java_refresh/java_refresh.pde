import java.util.Scanner;

public static void main(String[] args) {
  System.out.println("Hello world");
  int[] arr1 = new int[3];
  arr1[1] = 1;
  int[] arr2 = new int[5];
  arr2[4] = 2;
  int[][] arr3 = {{1, 3, 2, 4}, {6, 4, 3, 7}, {8, 3, 3, 10}, {31, 76, 23, 75}};
  printArray(arr3);
  printArray(arrayAddition(arr1, arr2));
}

public static int[][] arrayAddition(int[] arrayA, int[] arrayB) {
  int[][] addedArray = {arrayA, arrayB};
  return addedArray;
}

public static void printArray(int[][] printingArray) {
  for (int i = 0; i < printingArray.length; i++) {
    for (int j = 0; j < printingArray[i].length; j++) {
      System.out.print(printingArray[i][j] + " ");
    }
    System.out.print("\n");
  }
}
