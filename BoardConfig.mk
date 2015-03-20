# Copyright (C) 2013 The CyanogenMod Project
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
# BoardConfig.mk
#
-include vendor/samsung/kyletdcmcc/BoardConfigVendor.mk

USE_CAMERA_STUB := false
## Kernel, bootloader etc.
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 mem=239M
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := device/samsung/kyletdcmcc/kernel
#TARGET_KERNEL_SOURCE := kernel/samsung/kyletdcmcc
#TARGET_KERNEL_CONFIG := kyletd-vlx_defconfig
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

## Platform
BOARD_VENDOR := samsung
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_LOWMEM := true
TARGET_BOOTLOADER_BOARD_NAME := kyletdcmcc
TARGET_BOARD_PLATFORM := sc8810
TARGET_BOARD_PLATFORM_GPU := Mali-300
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT_CPU := cortex-a5

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kyletdcmcc/bluetooth

## Camera
BOARD_USES_LEGACY_OVERLAY := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_DISABLE_ARM_PIE := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_LEGACY

## Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

## ION
TARGET_USES_ION := true

## Graphics, media
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_CFG := device/samsung/kyletdcmcc/prebuilts/lib/egl/egl.cfg
COMMON_GLOBAL_CFLAGS += -DEGL_NEEDS_FNW


## Bluetooth
BOARD_HAVE_BLUETOOTH := true
# Bluetooth BCM
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kyletdcmcc/bluetooth

## Wi-Fi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_NO_APSME_ATTR := true

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

## Use device specific modules
TARGET_PROVIDES_LIBLIGHTS := true
TARGET_PROVIDES_LIBAUDIO := true

## Filesystem
BOARD_DATA_DEVICE := /dev/block/mmcblk0p12
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p9
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p8
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

## Partition sizes (maybe ok)
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1946804224

# Off-mode charging
BOARD_CHARGING_MODE_BOOTING_LPM := "/sys/class/power_supply/ac/online"
BOARD_LPM_BOOT_ARGUMENT_NAME := androidboot.boot_pause
BOARD_LPM_BOOT_ARGUMENT_VALUE := batt

## Recovery
TARGET_RECOVERY_INITRC := device/samsung/kyletdcmcc/recovery/init.rc
TARGET_RECOVERY_FSTAB := device/samsung/kyletdcmcc/recovery/recovery.fstab
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/kyletdcmcc/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/kyletdcmcc/recovery/graphics.c
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 131072
RECOVERY_CHARGE_ENABLE := true
DEVICE_RESOLUTION := 480x800
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

## OTA assert
TARGET_OTA_ASSERT_DEVICE := kyletdcmcc,GT-S7568,S7568
