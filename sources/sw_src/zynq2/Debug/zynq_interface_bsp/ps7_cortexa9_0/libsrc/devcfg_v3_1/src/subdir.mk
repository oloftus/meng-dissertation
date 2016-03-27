################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_g.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_hw.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_intr.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_selftest.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_sinit.c 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_g.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_hw.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_intr.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_selftest.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_sinit.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_g.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_hw.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_intr.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_selftest.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/xdevcfg_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/devcfg_v3_1/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


