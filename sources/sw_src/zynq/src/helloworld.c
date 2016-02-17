#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include <xil_io.h>

int main()
{
    init_platform();

//        data_in 0x0
//        data_in_valid 0x4
//        data_out 0x8
//        done_out 0xC


    Xil_Out32(XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x0, 0x40); // 0 000001 000000
    Xil_Out32(XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x4, 0x1);
    u32 cnt = 0;
    while (Xil_In32(XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0xC) != 0x1) {
    	cnt++;
    	if (cnt == 1000) break;
    }
    u32 ret = Xil_In32(XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x8);

    xil_printf("Ret is: %0X\r\n", ret);

//    print("Hello World\n\r");

    return 0;
}
