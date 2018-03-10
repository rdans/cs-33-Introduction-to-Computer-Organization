//Reinaldo Daniswara
//604840665

static float u2f(unsigned u)
{
  int frac = u & 8388607;
  int exp = u >> 23;

  if (exp !=0)
    {
      frac = frac | 8388608; // to get decimal of this 100000000000000000000000
    }

  float fp = frac;

  if (exp == 255 && frac == 0)
    fp = __FLT_HAS_INFINITY__;
  else if (exp == 0)
    {
    for (int i=0; i < 149; i++)
      fp = fp / 2;
    }
  else if (exp <= 149)
    {
      for (int i = 0; i < 150 - exp; i++)
	fp = fp / 2;
    }
  else
    {
      for (int i = 0; i < exp - 150; i++)
	fp = fp * 2;
    }

  if (frac == 0 && exp == 0)
    return 0;

  return fp;
  
}


float fpwr4(int x)
{
  /* Result exponent and fraction */
  unsigned exp, frac;
  unsigned u;
  
  if (x < -74) {
    /* Too small. Return 0.0 */
    exp = 0;
    frac = 0;
  } else if (x < -63) {
    /* Denormalized result */
    exp = 0;
    frac = 1 << (2*x + 148);
  } else if (x < 64 ) {
    /* Normalized result. */
    exp = 2*x + 127;
    frac = 0;
  } else {
    /* Too big. Return +oo */
    exp = 255;
    frac = 0;
  }
  
  /*Pack e~p an~ frac into,32 bits */
  u = exp << 23 | frac;
  /*Return as float */
  return u2f(u);
}


