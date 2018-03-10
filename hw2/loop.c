//Reinaldo Daniswara 604840665
//Problem 3.60 3rd edition

long loop (long x, int n)
{
  long result = 0;
  long mask;
  for (mask = 1; mask != 0; mask = mask << (n & 0xFF))
    {
      result |= (mask & x);
    }
  return result;
}

//Answer for the problem 3.60
/*
A. x = %rdi 
   n = %ecx
   result = %rax
   mask = %rdx

B. Initially, result is 0 and mask is 1
C. Test condition for mask is mask != 0; mask = mask << (n & 0xFF)
D. Mask is updated when it ws shifted by the lower 8 bits of n
E. Result get updated by |= (mask & x)    
 */


