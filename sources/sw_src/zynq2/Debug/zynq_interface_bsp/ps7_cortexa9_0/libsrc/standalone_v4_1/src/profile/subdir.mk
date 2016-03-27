################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_clean.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_init.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_timer_hw.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_cg.c \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_hist.c 

S_UPPER_SRCS += \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/dummy.S \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_arm.S \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_mb.S \
../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_ppc.S 

OBJS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_clean.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_init.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_timer_hw.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/dummy.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_cg.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_hist.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_arm.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_mb.o \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_ppc.o 

C_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_clean.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_init.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/_profile_timer_hw.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_cg.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_hist.d 

S_UPPER_DEPS += \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/dummy.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_arm.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_mb.d \
./zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/profile_mcount_ppc.d 


# Each subdirectory must supply rules for building sources it contributes
zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/%.o: ../zynq_interface_bsp/ps7_cortexa9_0/libsrc/standalone_v4_1/src/profile/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -IC:/Users/Administrator/Xilinx/sources/sw_src/zynq2/zynq_interface_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


