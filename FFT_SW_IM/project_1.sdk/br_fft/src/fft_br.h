#include <stdio.h>
#include <math.h>
#include <stdlib.h>


typedef struct cn
{
    float real;
    float imag;
} cmplx;

cmplx cadd(cmplx a , cmplx b);
cmplx csub(cmplx a , cmplx b);
cmplx cmul(cmplx a , cmplx b);

void cooley_tukey(cmplx *arr, cmplx *oparr, int len);
void FFT(cmplx *array, cmplx *oparray, int len);
