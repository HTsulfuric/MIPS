int hoge(int A[], int B[], int f, int g) {
  int *t0 = &A[f];
  int *t1 = &B[g];
  f = t0[0];
  int *t2 = t0 + 4;
  int t0_reg = t2[0];
  t0_reg = t0_reg + f;
  t1[0] = t0_reg;
}

int hoge2(int A[], int B[], int f, int g) { B[g] = A[f] + A[f + 1]; }
