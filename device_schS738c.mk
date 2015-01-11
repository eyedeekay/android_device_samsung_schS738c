$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/schS738c/schS738c-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/schS738c/overlay

LOCAL_PATH := device/samsung/schS738c
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)
#$(call inherit-product, vendor/samsung/msm7x27a-common/blobs.mk)
#$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_schS738c
PRODUCT_DEVICE := schS738c

#PRODUCT_PACKAGES += \
#	schS738c.fstab \
#	init.qcom.rc \
#	init.qcom.usb.rc \
