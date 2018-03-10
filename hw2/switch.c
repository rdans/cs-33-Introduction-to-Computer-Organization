//Problem 3.63 3rd edition
//Reinaldo Daniswara - 604840665
long switch_prob(long x, long n){
  long result = x;
  switch(n) {
  case 60:
  case 62:
    result = x * 8;
    break;
  case 63:
    result = x;
    result = result >> 3;
    break;
  case 64:
    result = x;
    result = result << 4;
    result = result - x;
    x = result;
  case 65:
    x = x * x;
  default:
    result = x + 75;
    break;
 }
  return result;
}
