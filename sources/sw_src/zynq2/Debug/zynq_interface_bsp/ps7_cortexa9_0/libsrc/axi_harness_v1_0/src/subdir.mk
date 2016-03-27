################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/axi_harness.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/axi_harness_selftest.c 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/axi_harness.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/axi_harness_selftest.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/axi_harness.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/axi_harness_selftest.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/axi_harness_v1_0/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


