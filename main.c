#include <stdint.h>
#include <stdio.h>

extern uint32_t test_external();

int main() {
  printf("hi %d\n", test_external());
  return 0;
}
