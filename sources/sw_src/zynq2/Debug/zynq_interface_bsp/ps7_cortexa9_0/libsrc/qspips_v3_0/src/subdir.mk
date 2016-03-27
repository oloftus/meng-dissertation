################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_g.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_hw.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_options.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_selftest.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_sinit.c 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_g.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_hw.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_options.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_selftest.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_sinit.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_g.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_hw.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_options.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_selftest.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/xqspips_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/qspips_v3_0/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


