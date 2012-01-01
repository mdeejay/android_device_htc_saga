# Copyright (C) 2011 The Android Open Source Project
# Copyright (C) 2011 mdj
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

TARGET_SPECIFIC_HEADER_PATH := device/htc/saga/include

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := saga

TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_HOSTAPD_DRIVER             := WEXT
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_RECOVERY_CMDLINE := $(BOARD_KERNEL_CMDLINE) msmsdcc_power_gpio=88
BOARD_KERNEL_BASE := 0x04400000
BOARD_KERNEL_PAGE_SIZE := 4096

BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_ADRENO_200 := true
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_QCOM_HDMI_OUT := false
TARGET_USES_OVERLAY := false
TARGET_GRALLOC_USES_ASHMEM := true

ENABLE_WTF_USE_ACCELERATED_COMPOSITING := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DUSE_GENLOCK

BOARD_OVERLAY_FORMAT_YCbCr_420_SP := false

BOARD_EGL_CFG := device/htc/saga/egl.cfg

BOARD_PREBUILT_LIBAUDIO := false
BOARD_USE_QCOM_PMEM := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true

BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := saga
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 585101312
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1232072704
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
