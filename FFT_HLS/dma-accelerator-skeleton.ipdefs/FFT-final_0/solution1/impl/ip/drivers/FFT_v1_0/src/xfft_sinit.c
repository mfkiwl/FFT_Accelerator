// ==============================================================
// File generated on Thu Jun 11 21:23:53 +0200 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfft.h"

extern XFft_Config XFft_ConfigTable[];

XFft_Config *XFft_LookupConfig(u16 DeviceId) {
	XFft_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFFT_NUM_INSTANCES; Index++) {
		if (XFft_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFft_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFft_Initialize(XFft *InstancePtr, u16 DeviceId) {
	XFft_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFft_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFft_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

