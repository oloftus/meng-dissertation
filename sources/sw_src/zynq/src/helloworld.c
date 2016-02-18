#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include <xil_io.h>

#define DATA_IN_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR+0x0
#define DATA_IN_VALID_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR+0x4
#define DATA_OUT_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR+0x8
#define DONE_IN_REG XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR+0xC

int main()
{
    init_platform();

    Xil_Out32(DATA_IN_REG, 0x2040); // 0000000000 000000001-0;000001.000000
    Xil_Out32(DATA_IN_VALID_REG, 0x1);
	Xil_Out32(DATA_IN_VALID_REG, 0x0);
    Xil_Out32(DATA_IN_REG, 0x4040); // 0000000000 000000010-0;000001.000000
	Xil_Out32(DATA_IN_VALID_REG, 0x1);

    // Reset all
//    Xil_Out32(DATA_IN_REG, 0x0);
//    Xil_Out32(DATA_IN_VALID_REG, 0x0);
//    Xil_Out32(DATA_OUT_REG, 0x0);
//    Xil_Out32(DONE_IN_REG, 0x0);

//    u32 cnt = 0;

//    while (Xil_In32(DONE_IN_REG) != 0x1) {}
    xil_printf("Ret1 is: %0X\r\n", Xil_In32(DONE_IN_REG));
    Xil_Out32(DONE_IN_REG, 0x0); // Reset the DONE register once it's read

//    	cnt++;
//    	if (cnt == 1000) break;
//    }

    u32 ret = Xil_In32(DATA_OUT_REG);
    xil_printf("Ret2 is: %0X\r\n", ret);

    return 0;
}
