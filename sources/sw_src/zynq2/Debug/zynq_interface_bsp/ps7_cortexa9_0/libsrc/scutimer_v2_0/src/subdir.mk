################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_g.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_selftest.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_sinit.c 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_g.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_selftest.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_sinit.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_g.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_selftest.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/xscutimer_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/scutimer_v2_0/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

