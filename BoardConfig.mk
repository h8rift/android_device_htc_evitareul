#
# Copyright (C) 2012 The CyanogenMod Project
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

# inherit from tegra3-common
-include device/htc/tegra3-common/BoardConfigCommon.mk

# BT
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/evitareul/bluetooth/vnd_evitareul.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/htc/evitareul/bluetooth

# HTC ril compatability
TARGET_PROVIDES_LIBRIL := device/htc/evitareul/proprietary/lib/libhtc-ril.so

# Kernel / Ramdisk
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896 
BOARD_FLASH_BLOCK_SIZE := 131072

# Boot/Recovery image settings
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/htc/evitareul
TARGET_KERNEL_CONFIG := cyanogenmod_evitareul_defconfig

BOARD_EGL_NEEDS_LEGACY_FB := true

BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/htc/evitareul/ramdisk/fstab.evitareul
RECOVERY_FSTAB_VERSION := 2 

# SE Linux policies
BOARD_SEPOLICY_DIRS := \
    device/htc/tegra3-common/sepolicy

BOARD_SEPOLICY_UNION += \
	bridge.te \
	device.te \
	dhcp.te \
	domain.te \
	file.te \
	file_contexts \
	init.te \
	kickstart.te \
	netmgrd.te \
	property.te \
	property_contexts \
	qmux.te \
	restorecon.te \
	rild.te \
	system.te \
	te_macros \
	ueventd.te \
	wpa_supplicant.te
	
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# WiFi related defines
BOARD_WLAN_DEVICE                  := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER        := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER               := NL80211
BOARD_HOSTAPD_PRIVATE_LIB          := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM          := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA            := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP             := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P            := "/system/etc/firmware/fw_bcm4334_p2p.bin"
WPA_SUPPLICANT_VERSION             := VER_0_8_X
