# Release name
PRODUCT_RELEASE_NAME := schS738c
LOCAL_PATH := $(call my-dir)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/cdma.mk)

#conditional determines if it's a CM tree
	# Inherit some common CM stuff.
	#$(call inherit-product, vendor/cm/config/common_full_phone.mk)
	# Set ROM prefix to cm
	#MY_ROM_PREFIX=cm
#else conditional determines if it's an Omni tree
	# Inherit some common omni stuff.
	$(call inherit-product, vendor/omni/config/common.mk)
	# Set ROM prefix to omni
	MY_ROM_PREFIX=omni
#else conditional determines if it's an AOKP tree
#else conditional determines if it's an AOSP tree
#else conditional determines if it's a Guardian ROM tree
#else conditional determines if it's a Replicant tree


# Inherit device configuration
$(call inherit-product, device/samsung/schS738c/full_schS738c.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := schS738c
PRODUCT_NAME := $(MY_ROM_PREFIX)_schS738c
PRODUCT_BRAND := samsung
PRODUCT_MODEL := schS738c
PRODUCT_MANUFACTURER := samsung

## Boot Animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

echo $PRODUCT_NAME
