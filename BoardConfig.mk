#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/tiare

# Kernel
TARGET_KERNEL_CONFIG := tiare_defconfig

# Partitions
TARGET_COPY_OUT_VENDOR := vendor
BOARD_BOOTIMAGE_PARTITION_SIZE := 50331648
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1390411776
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1971322880
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 333447168

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.recovery.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2020-05-05

# Inherit from common msm8937-common
include device/xiaomi/msm8937-common/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/xiaomi/tiare/BoardConfigVendor.mk
