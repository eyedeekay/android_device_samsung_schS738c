# inherit from the proprietary version
#-include vendor/samsung/schS738c/BoardConfigVendor.mk

## Kernel, Bootloader
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom loglevel=1
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/samsung/schS738c
#TARGET_PREBUILT_KERNEL := device/samsung/schS738c/kernel
TARGET_KERNEL_CONFIG := cm_schS738c_defconfig
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

## Platform Configuration
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_LOWMEM := true
TARGET_BOARD_PLATFORM := msm7627a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_NO_KERNEL := false
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp

## Qcom hardwae
BOARD_USES_QCOM_HARDWARE := true

## FM Radio?
#QCOM_TARGET_PRODUCT := msm7627a
#TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
#TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

## Camera
USE_CAMERA_STUB := true

## Memory
TARGET_USES_ION := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_MHEAP_SCREENSHOT := true

## Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24

## UMS
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
#BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

## Workaround Samsung Framebuffer
TARGET_NO_INITLOGO := true

## Recovery
TARGET_RECOVERY_INITRC := init.recovery.qcom.rc
TARGET_RECOVERY_FSTAB := device/samsung/schS738c/schS738c.fstab
#TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TARGET_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/recovery/sbin/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery \
	device/samsung/schS738c/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	device/samsung/schS738c/recovery/postrecoveryboot.sh:recovery/system/bin/postrecoveryboot.sh

## Filesystem
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p16
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p17
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

## Partition Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 487136952
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2920577761
BOARD_FLASH_BLOCK_SIZE := 131072
