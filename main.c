#include <stdint.h>
#include <stdio.h>

extern uint32_t test_forward();
extern uint32_t test_forward_data();
extern uint32_t test_internal();
extern uint32_t test_external();
extern uint32_t test_external_data();

int main() {
  printf("forward %d\n", test_forward());
  printf("forward_data %d\n", test_forward_data());
  printf("internal %d\n", test_internal());
  printf("external %d\n", test_external());
  printf("external_data %d\n", test_external_data());
  return 0;
}
