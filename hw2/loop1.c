#include "loop1.h"
volatile int x, y, n;
int main()
{
  x = loop (y, n);
  return 0;
}
