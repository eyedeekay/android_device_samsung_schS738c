# Release name
PRODUCT_RELEASE_NAME := schS738c
LOCAL_PATH := $(call my-dir)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit some common omni stuff.
$(call inherit-product, vendor/omni/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/schS738c/device_schS738c.mk)

## Setup device makefiles
SAMSUNG_TARGETS := schS738c
ifneq ($(filter $(SAMSUNG_TARGETS),$(TARGET_DEVICE)),)
	LOCAL_PATH := $(call my-dir)
	include $(all-subdir-makefiles)
endif

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := schS738c
PRODUCT_NAME := omni_schS738c
PRODUCT_BRAND := samsung
PRODUCT_MODEL := schS738c
PRODUCT_MANUFACTURER := samsung

## Boot Animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320
