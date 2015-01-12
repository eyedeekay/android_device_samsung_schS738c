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
LOCAL_PATH := device/samsung/schS738c
#LOCAL_PATH := $(call my-dir)

SAMSUNG_TARGETS := schS738c cm_schS738c

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

ifneq ($(filter $(SAMSUNG_TARGETS),$(TARGET_DEVICE)),)
	include $(all-subdir-makefiles)
endif

# include the non-open-source counterpart to this file
#-include vendor/samsung/schS738c/AndroidBoardVendor.mk
