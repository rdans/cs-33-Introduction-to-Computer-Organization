#include <stdio.h>
#include <limits.h>

int saturating_add(int x, int y)
{
  int add;
  int w = (sizeof(int)<<3)-1;
  int overflow = __builtin_add_overflow(x, y, &add);
  int overflow_mask = ((overflow << w) >> w);
  //if x is negative, then we create a mask with all 1
  int neg_mask_x = (x >> w);
  //if y is negative, then we create a mask with all 1
  int neg_mask_y = (y >> w);
  //same concept applies to the add 
  int neg_mask_add = (add >> w);
  int neg_overflow = neg_mask_x & neg_mask_y & ~neg_mask_add;
  int pos_overflow = ~neg_mask_x & ~neg_mask_y & neg_mask_add;
  int result = (~overflow_mask & add) | (pos_overflow & INT_MAX) |
    (neg_overflow & INT_MIN);
  return result;
}
