#
# Copyright (C) 2012 The Android Open-Source Project
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

$(call inherit-product, vendor/htc/evitareul/evitareul-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/sbin/power_test:recovery/root/sbin/power_test \
    $(LOCAL_PATH)/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Files needed for boot image
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/ramdisk/init.evitareul.rc:root/init.evitareul.rc \
    $(LOCAL_PATH)/ramdisk/init.ril.rc:root/init.ril.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.evitareul.rc:root/ueventd.evitareul.rc \
    $(LOCAL_PATH)/ramdisk/fstab.evitareul:root/fstab.evitareul

#Audio packages
PRODUCT_PACKAGES += \
    libinvensense_mpl

# Filesystem management tools
PRODUCT_PACKAGES += \
    sdcard \
    libmtp

# Hostapd   
PRODUCT_PACKAGES += \
    hostapd_cli \
    calibrator
        
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1 \
    tf.enable=y

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_LOCALES += en_GB xhdpi

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common tegra3-HOX+ configs
$(call inherit-product, device/htc/tegra3-common/tegra3.mk)

$(call inherit-product, vendor/htc/evitareul/evitareul-vendor.mk)