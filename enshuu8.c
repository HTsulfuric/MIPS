int hoge(int A[], int f) {
  A[1] = (int)&A[0];
  f = &A[0] + A[1];
  return f;
}
