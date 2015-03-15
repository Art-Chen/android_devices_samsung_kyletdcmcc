## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/kyletdcmcc/kyletdcmcc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_kyletdcmcc
PRODUCT_DEVICE := kyletdcmcc
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S7568
PRODUCT_MANUFACTURER := samsung
PRODUCT_RELEASE_NAME := GT-S7568

## Bootanimation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
