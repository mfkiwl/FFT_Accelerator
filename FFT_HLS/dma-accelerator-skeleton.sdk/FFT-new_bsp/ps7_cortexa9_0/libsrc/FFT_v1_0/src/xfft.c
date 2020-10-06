// ==============================================================
// File generated on Thu Jun 11 21:23:53 +0200 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xfft.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFft_CfgInitialize(XFft *InstancePtr, XFft_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_bus_BaseAddress = ConfigPtr->Control_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFft_Start(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL) & 0x80;
    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFft_IsDone(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFft_IsIdle(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFft_IsReady(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFft_EnableAutoRestart(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL, 0x80);
}

void XFft_DisableAutoRestart(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_AP_CTRL, 0);
}

void XFft_Set_control(XFft *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_CONTROL_DATA, Data);
}

u32 XFft_Get_control(XFft *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_CONTROL_DATA);
    return Data;
}

void XFft_InterruptGlobalEnable(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_GIE, 1);
}

void XFft_InterruptGlobalDisable(XFft *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_GIE, 0);
}

void XFft_InterruptEnable(XFft *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_IER);
    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_IER, Register | Mask);
}

void XFft_InterruptDisable(XFft *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_IER);
    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_IER, Register & (~Mask));
}

void XFft_InterruptClear(XFft *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_WriteReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_ISR, Mask);
}

u32 XFft_InterruptGetEnabled(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_IER);
}

u32 XFft_InterruptGetStatus(XFft *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_ReadReg(InstancePtr->Control_bus_BaseAddress, XFFT_CONTROL_BUS_ADDR_ISR);
}

