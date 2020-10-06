#include "fft_br.h"

//Begin Complex Operations

cmplx cadd(cmplx a , cmplx b){
    cmplx c;
    c.real = a.real + b.real;
    c.imag = a.imag + b.imag;

    return c;
}

cmplx csub(cmplx a , cmplx b){
    cmplx c;
    c.real = a.real - b.real;
    c.imag = a.imag - b.imag;

    return c;
}

cmplx cmul(cmplx a , cmplx b){
    cmplx c;

    c.real = a.real * b.real - a.imag * b.imag;
    c.imag = a.real * b.imag + b.real * a.imag;

    return c;
}

//End Complex Operations

/*void cooley_tukey(cmplx arr[N], cmplx oparr[N]){
    cmplx tmparr[N], tmp[N];
    int n=log2(N);
    int bin[10];

    for (int i = 0; i < N; i++)
    {

        int a = i, val = 0, base = 1;

        for(int j = 0; j < n; j++){
            bin[j] = a & 0x01 ? 1 : 0;
            a>>=1;
        }

        
       for (int k = n-1; k > -1; k--){
            val = val + bin[k] * base;
            base = base * 2;
        }

        tmparr[val].real = arr[i].real;
        tmparr[val].imag = arr[i].imag;
    }

    for (int p = 0; p < N; p++)
    {
        tmp[p].real = tmparr[p].real;
        tmp[p].imag = tmparr[p].imag;
    }
    //Finished Bit reversal.


    for (int s = 1; s <= n; ++s)
    {
        int m = 1 << s;
        int m2 = m >> 1;

        cmplx w; 
        w.real = 1;
        w.imag = 0;

        cmplx wm;
        wm.real = cosf((float)M_PI/m2);
        wm.imag = sinf((float)-M_PI/m2);

        for (int j = 0; j < m2; ++j) {
            cooley_tukey_label0:for (int k = j; k < N; k += m){

                cmplx t, u;                
                t = cmul(w,tmp[k + m2]);
                u = tmp[k];

		        tmp[k] = cadd(u, t);
		        tmp[k + m2] = csub(u, t);
            }
            w = cmul(w,wm);
        }
    }

    for(int h = 0; h < N; h++)
    {
    	oparr[h] = tmp[h];
    	//oparr[h].last = arr[h].last;
    }

}*/

void FFT(cmplx array[N], cmplx oparray[N], int control)
{
	#pragma HLS DATA_PACK variable=oparray
	#pragma HLS DATA_PACK variable=array
	#pragma HLS INTERFACE axis register both port=oparray
	#pragma HLS INTERFACE axis register both port=array

	#pragma HLS INTERFACE s_axilite port = return bundle = CONTROL_BUS
	#pragma HLS INTERFACE s_axilite port = control bundle = CONTROL_BUS
	//printf("value: %d", control);
	if(control > 0)
	{
		//cooley_tukey(array, oparray);
		cmplx tmparr[N], tmp[N];
		    int n=log2(N);
		    int bin[10];

		    for (int i = 0; i < N; i++)
		    {

		        int a = i, val = 0, base = 1;

		        for(int j = 0; j < n; j++){
		            bin[j] = a & 0x01 ? 1 : 0;
		            a>>=1;
		        }


		       for (int k = n-1; k > -1; k--){
		            val = val + bin[k] * base;
		            base = base * 2;
		        }

		        tmparr[val].real = array[i].real;
		        tmparr[val].imag = array[i].imag;
		    }

		    for (int p = 0; p < N; p++)
		    {
		        tmp[p].real = tmparr[p].real;
		        tmp[p].imag = tmparr[p].imag;
		    }
		    //Finished Bit reversal.


		    for (int s = 1; s <= n; ++s)
		    {
		        int m = 1 << s;
		        int m2 = m >> 1;

		        cmplx w;
		        w.real = 1;
		        w.imag = 0;

		        cmplx wm;
		        wm.real = cosf((float)M_PI/m2);
		        wm.imag = sinf((float)-M_PI/m2);

		        for (int j = 0; j < m2; ++j) {
		            cooley_tukey_label0:for (int k = j; k < N; k += m){

		                cmplx t, u;
		                t = cmul(w,tmp[k + m2]);
		                u = tmp[k];

				        tmp[k] = cadd(u, t);
				        tmp[k + m2] = csub(u, t);
		            }
		            w = cmul(w,wm);
		        }
		    }

		    for(int h = 0; h < N; h++)
		    {
		    	oparray[h] = tmp[h];
		    	//oparr[h].last = arr[h].last;
		    }

		}

}

