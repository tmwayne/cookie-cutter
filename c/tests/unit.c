/* file minunit_example.c */

#include <stdio.h>
#include "minunit.h"
#include "except.h"
#include "assert.h"
#include "divide.h"

int tests_run = 0;

static char* test_divide8by4is2() {
  mu_assert("error, divide(8, 4) != 2", divide(8, 4) == 2);
  return 0;
}

static char* test_dividebyzero() {
  int pass = 0;
  TRY divide(8, 0);
  EXCEPT (Assert_Failed) pass = 1;
  END_TRY;

  mu_assert("error, divide(8, 0) is not Exception", pass);
  return 0;
}

static char* all_tests() {
  mu_run_test(test_divide8by4is2);
  mu_run_test(test_dividebyzero);
  return 0;
}

int main(int argc, char** argv) {
  char* result = all_tests();
  if (result != 0) printf("%s\n", result);
  else printf("ALL TESTS PASSED\n");

  printf("Tests run: %d\n", tests_run);

  return result != 0;
}
