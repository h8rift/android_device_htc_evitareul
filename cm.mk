## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := evitareul

# Resolution values for bootanimation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/evitareul/device_evitareul.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := evitareul
PRODUCT_NAME := cm_evitareul
PRODUCT_BRAND := htc
PRODUCT_MODEL := evitareul
PRODUCT_MANUFACTURER := htc

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=evitareul BUILD_FINGERPRINT=cingular_us/evitareul/evitareul:4.1.2/JRO03C/122548.9:user/release-keys PRIVATE_BUILD_DESC="1.15.502.9 CL122548 release-keys" BUILD_NUMBER=122548

# Torch
PRODUCT_PACKAGES += \
    torch
