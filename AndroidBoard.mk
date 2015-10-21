#
# Not sure who this file belongs to. Don't really care. Pretty sure it's 
# Apache licensed. I wanted to make it easier to compare two versions side-by-
# side.
#
#
#
#
#
#
#
#
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
#-include vendor/samsung/schS738c/AndroidBoardVendor.mk
include vendor/samsung/schS738c/AndroidBoardVendor.mk
$(call inherit-product-if-exists, vendor/samsung/schS738c/AndroidBoardVendor.mk)
