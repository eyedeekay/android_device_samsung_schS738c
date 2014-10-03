## Specify phone tech before including full_phone
$(call inherit-product, vendor/replicant/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := sch-S738c

# Inherit some common CM stuff.
$(call inherit-product, vendor/replicant/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/sch-S738c/device_sch-S738c.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := sch-S738c
PRODUCT_NAME := cm_sch-S738c
PRODUCT_BRAND := samsung
PRODUCT_MODEL := sch-S738c
PRODUCT_MANUFACTURER := samsung
