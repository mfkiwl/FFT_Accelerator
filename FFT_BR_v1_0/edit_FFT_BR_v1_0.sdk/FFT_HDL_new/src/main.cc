#include <stdio.h>
#include <xparameters.h>
//#include "FFTBRC.h"
#include "xaxidma.h"
#include "inReal.h"
#include "xtime_l.h"

//XDogain doGain;
//XDogain_Config *doGain_cfg;
XAxiDma axiDMA;
XAxiDma_Config *axiDMA_cfg;

#define MEM_BASE_ADDR 0x01000000
#define TX_BUFFER_BASE (MEM_BASE_ADDR+0x00100000)
#define RX_BUFFER_BASE (MEM_BASE_ADDR+0x00300000)

#define SIZE_ARR 1024
int inStreamData[SIZE_ARR];


XTime tStart[4], tEnd[4];
void tick(int n) {
	printf("[%d] Timer started...\n",n);
	XTime_GetTime(&tStart[n]);
}

/* Stops timer n and prints its value in microseconds. */
void tock(int n) {
	XTime_GetTime(&tEnd[n]);
	printf("[%d] Timer stopped...\n",n);
	printf("[%d] Elapsed time : %.2f us.\n", n, 1.0 * (tEnd[n] - tStart[n]) / (COUNTS_PER_SECOND/1000000));
}


void initPeripherals()
{
	/*printf("initializing doGain\n");
	doGain_cfg = XDogain_LookupConfig(XPAR_DOGAIN_0_DEVICE_ID);
	if (doGain_cfg) {
		int status = XDogain_CfgInitialize(&doGain, doGain_cfg);
		if (status != XST_SUCCESS)
			printf("Error initializing doGain core\n");
	}*/

	printf("initializing AxiDMA\n");
	axiDMA_cfg = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	if (axiDMA_cfg) {
		int status = XAxiDma_CfgInitialize(&axiDMA, axiDMA_cfg);
		if (status != XST_SUCCESS)
			printf("Error initializing AxiDMA core\n");
	}

	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&axiDMA, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
}

int main() {
	float *m_dma_buffer_TX = (float*) TX_BUFFER_BASE;
	float *m_dma_buffer_RX = (float*) RX_BUFFER_BASE;

	initPeripherals();



	for (int idx = 0; idx < SIZE_ARR; idx++) {
		inStreamData[idx] = inReal[idx];
	}

	/*for (int idx = SIZE_ARR; idx < 2 * SIZE_ARR; idx++) {
			inStreamData[idx] =(float) 0;
		}*/



		//int gain;
		//printf("Input gain: ");
		//scanf("%d", &gain);
		//XDogain_Set_gain(&doGain, gain);
		//XDogain_Start(&doGain);
		tick(0);
		Xil_DCacheFlushRange((u32) inStreamData,SIZE_ARR * sizeof(float));
		Xil_DCacheFlushRange((u32) m_dma_buffer_RX,SIZE_ARR * sizeof(float));

		printf("Sending data to IP core slave\n");
		XAxiDma_SimpleTransfer(&axiDMA, (u32) inStreamData,SIZE_ARR * sizeof(float), XAXIDMA_DMA_TO_DEVICE);

		printf("Receive data from IP core\n");
		XAxiDma_SimpleTransfer(&axiDMA, (u32) m_dma_buffer_RX,SIZE_ARR * sizeof(float), XAXIDMA_DEVICE_TO_DMA);

		//while (XAxiDma_Busy(&axiDMA, XAXIDMA_DEVICE_TO_DMA));

		Xil_DCacheInvalidateRange((u32) m_dma_buffer_RX,SIZE_ARR * sizeof(float));

		//while (!XDogain_IsDone(&doGain));
		tock(0);
		printf("Calculation complete\n");

		for (int idx = 0; idx < SIZE_ARR; idx++) {
					printf("Recv[%d]=%f\n", idx, m_dma_buffer_RX[idx]);
				}




	return 0;
}
