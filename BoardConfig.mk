# Copyright (C) 2009 The Android Open Source Project
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

# inherit from tegra3-common
-include device/htc/tegra3-common/BoardConfigCommon.mk

TARGET_NO_RADIOIMAGE := true
TARGET_TEGRA_VERSION := T33

# Kernel
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_PREBUILT_KERNEL := device/htc/evitareul/prebuilt/kernel
TARGET_KERNEL_SOURCE := kernel/htc/evitareul
TARGET_KERNEL_CONFIG := evitareul_defconfig

# WPA Supplicant
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/firmware/fw_bcm4334_p2p.bin"

# NFC
BOARD_HAVE_NFC := true

# RIL
TARGET_PROVIDES_LIBRIL := true

# HTCLOG
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# Audio
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLO

# Partition Info
#dev:        size     erasesize name
#mmcblk0p5: 00800000 00001000 "recovery"
#mmcblk0p4: 00800000 00001000 "boot"
#mmcblk0p16: 60000000 00001000 "system"
#mmcblk0p17: 10000000 00001000 "cache"
#mmcblk0p20: 00200000 00001000 "misc"
#mmcblk0p1: 00600000 00001000 "wlan"
#mmcblk0p2: 00200000 00001000 "WDM"
#mmcblk0p25: 00200000 00001000 "pdata"
#mmcblk0p3: 00600000 00001000 "radiocab"
#mmcblk0p18: e00000000 00001000 "userdata"
#mmcblk0p24: 01a00000 00001000 "devlog"
#mmcblk0p19: 00200000 00001000 "extra"
#mmcblk0p14: 03400000 00001000 "mdm9k"
#mmcblk0p15: 00800000 00001000 "mdm9k_config"
#mmcblk0p21: 00800000 00001000 "modem_st1"
#mmcblk0p22: 00800000 00001000 "modem_st2"

# Memory
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 22
BOARD_HAS_SDCARD_INTERNAL := true
