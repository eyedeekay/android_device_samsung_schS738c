## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := schS738c

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/schS738c/device_schS738c.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := schS738c
PRODUCT_NAME := cm_schS738c
PRODUCT_BRAND := samsung
PRODUCT_MODEL := schS738c
PRODUCT_MANUFACTURER := samsung
