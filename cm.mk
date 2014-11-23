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

# Inherit device configuration
$(call inherit-product, device/htc/evitareul/full_evitareul.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := evitareul 
PRODUCT_NAME := cm_evitareul
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := One X+
PRODUCT_MANUFACTURER := HTC

#Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=evitareul BUILD_FINGERPRINT="htc_europe/evitareul/evitareul:4.3/JRO03C/125529.22:user/release-keys" PRIVATE_BUILD_DESC="3.14.401.22 CL125529 release-keys"
