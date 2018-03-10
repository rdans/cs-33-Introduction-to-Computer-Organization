/* Return 1 when any odd bit of x equals 1; 0 otherwise.
   , Assume .w=32 */

int any_odd_one(unsigned x){
  //binary of hexadecimal 0x55555555 is 0101 0101 ... 0101
  return (x & 0x55555555) && 1;
}

