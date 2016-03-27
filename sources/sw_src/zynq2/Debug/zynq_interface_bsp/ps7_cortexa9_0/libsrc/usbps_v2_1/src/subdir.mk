################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_endpoint.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_g.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_hw.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_intr.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_sinit.c 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_endpoint.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_g.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_hw.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_intr.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_sinit.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_endpoint.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_g.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_hw.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_intr.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/xusbps_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/usbps_v2_1/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


