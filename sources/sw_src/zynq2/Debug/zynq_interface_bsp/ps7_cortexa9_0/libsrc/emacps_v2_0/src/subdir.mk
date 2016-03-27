################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_bdring.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_control.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_g.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_hw.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_intr.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_sinit.c 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_bdring.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_control.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_g.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_hw.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_intr.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_sinit.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_bdring.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_control.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_g.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_hw.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_intr.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/xemacps_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/emacps_v2_0/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


