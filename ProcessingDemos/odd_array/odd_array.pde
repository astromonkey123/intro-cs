float[] array1 = {1, 5, 2, 96, 3, 7};

public float[] filterOdds(float[] a) {
  float[] answer = new float[0];
  for (int i = 0; i < a.length; i++) {
    if (a[i] % 2 == 0) {
      answer = append(answer, a[i]);
    }
  }
  return answer;
}

void setup() {
  println(filterOdds(array1));
}
