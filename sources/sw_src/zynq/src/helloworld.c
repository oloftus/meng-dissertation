#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include <xil_io.h>

int main()
{
    init_platform();

    Xil_Out32(XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x0, 0xff00ff); // 00000000111111110000000011111111
    int i; for (i = 0; i < 100000; i++){};
    u32 a = Xil_In32(XPAR_AXI_HARNESS_0_S00_AXI_BASEADDR + 0x4);

    xil_printf("Val is: %0X\r\n", a);

//    print("Hello World\n\r");

    return 0;
}
