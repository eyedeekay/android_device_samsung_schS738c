# inherit from the proprietary version
#-include vendor/samsung/schS738c/BoardConfigVendor.mk

DEVICE_PACKAGE_OVERLAYS += device/samsung/schS738c/overlay

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
PRODUCT_PROPERTY_OVERRIDES += \
	com.qc.hardware=true \
	dev.pm.dyn_sample_period=700000 \
	dev.pm.dyn_samplingrate=1 \
	ro.vendor.extension_library=/system/lib/libqc-opt.so
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
#QCOM_TARGET_PRODUCT := msm7627a
#TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
#TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

## Video
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_MMPARSER
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libmm-omxcore \
	libOmxCore
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/schS738c/etc/media_codecs.xml:system/etc/media_codecs.xml
PRODUCT_PROPERTY_OVERRIDES += \
	debug.gr.numframebuffers=3 \
	debug.egl.recordable.rgba8888=1 \
	debug.composition.type=dyn \
	debug.hwc.dynThreshold=1.9 \
	ro.bq.gpu_to_cpu_unsupported=1 \
	ro.max.fling_velocity=4000 \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=160

## Graphics
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_DOESNT_USE_FENCE_SYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_CFG := device/samsung/schS738c/graphics/lib/egl/egl.cfg
PRODUCT_PACKAGES += \
	copybit.msm7x27a \
	gralloc.msm7x27a \
	hwcomposer.msm7x27a \
	libtilerenderer

## FM radio
PRODUCT_PACKAGES += \
	qcom.fmradio \
	libqcomfm_jni \
	FM2
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/fm/etc/init.qcom.fm.sh:/system/
PRODUCT_PROPERTY_OVERRIDES += \
	ro.fm.analogpath.supported=true \
	ro.fm.transmitter=false \
	ro.fm.mulinst.recording.support=false

## Charger
BOARD_LPM_BOOT_ARGUMENT_NAME := androidboot.boot_pause
BOARD_LPM_BOOT_ARGUMENT_VALUE := batt
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

## Network / Wi-Fi
BOARD_WLAN_DEVICE := ath6kl
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_DRIVER_MODULE_AP_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/samsung/schS738c/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
 	device/samsung/schS738c/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	device/samsung/schS738c/bin/get_macaddrs:system/bin/get_macaddrs
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=60

## Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DNO_TUNNELED_SOURCE
PRODUCT_PACKAGES += \
	audio.primary.msm7x27a \
	audio_policy.msm7x27a \
	audio.a2dp.default \
	audio.usb.default \
	audio_policy.conf \
	libaudioutils
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/etc/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/schS738c/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	device/samsung/schS738c/etc/AudioFilter.csv:system/etc/AudioFilter.csv
TARGET_PROVIDES_LIBAUDIO := true

## Camera
USE_CAMERA_STUB := true
#TARGET_DISABLE_ARM_PIE := true
#COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DNEEDS_VECTORIMPL_SYMBOLS
#COMMON_GLOBAL_CFLAGS += -DCAMERA_NO_UNWANTED_MSG -DSAMSUNG_CAMERA_LEGACY
#PRODUCT_COPY_FILES += \
#	device/samsung/msm7x27a-common/camera/camera.msm7x27a.so:system/lib/hw/camera.msm7x27a.so

## RIL
BOARD_USES_LEGACY_RIL := true
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_RIL_CLASS := ../../../device/samsung/msm7x27a-common/ril/
PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libsec-ril.so \
	rild.libargs=-d/dev/smd0 \
	ro.telephony.ril_class=SamsungRIL \
	ro.telephony.ril.v3=datacall,icccardstatus,facilitylock \
	ro.telephony.call_ring.multiple=false


## Bluetooth
BOARD_HAVE_BLUETOOTH := true
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bluetooth.remote.autoconnect=true \
	ro.bluetooth.request.master=true \
	ro.bt.bdaddr_path=/data/misc/bluedroid/bdaddr \
	ro.qualcomm.bluetooth.dun=true \
	ro.qualcomm.bluetooth.ftp=true

## Misc
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs \
	com.android.future.usb.accessory
TARGET_PROVIDES_LIBLIGHTS := true
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

## Other HALs
PRODUCT_PACKAGES += \
	camera.msm7x27a \
	lights.msm7x27a \
	gps.msm7x27a \
	power.msm7x27a \
	libhealthd.msm7x27a


## Memory
TARGET_USES_ION := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_MHEAP_SCREENSHOT := true
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1 \
	dalvik.vm.jit.codecachesize=1 \
	ro.config.low_ram=true

## Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24
	PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb \
	ro.vold.umsdirtyratio=50 \
	persist.sys.vold.switchablepair=sdcard0,sdcard1


## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

## Workaround Samsung Framebuffer
TARGET_NO_INITLOGO := true

## Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

## Keychar
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/usr/keychars/7x27a_kp.kcm.bin:system/usr/keychars/7x27a_kp.kcm.bin \
	device/samsung/schS738c/usr/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin

## Keylayout
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
	device/samsung/schS738c/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/schS738c/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/schS738c/usr/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
	device/samsung/schS738c/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
	device/samsung/schS738c/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

## Sensor calibration files
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/etc/calib.dat:system/etc/calib.dat \
	device/samsung/schS738c/etc/param.dat:system/etc/param.dat \
	device/samsung/schS738c/etc/sensors.dat:system/etc/sensors.dat

## Touchscreen configuration
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## Recovery
TARGET_RECOVERY_INITRC := device/samsung/schS738c/recovery/init.recovery.qcom.rc
TARGET_RECOVERY_FSTAB := device/samsung/schS738c/schS738c.fstab
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
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
	device/samsung/schS738c/recovery/rmt_storage_recovery:recovery/root/sbin/rmt_storage_recovery \
	device/samsung/schS738c/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	device/samsung/schS738c/recovery/postrecoveryboot.sh:recovery/system/bin/postrecoveryboot.sh
PRODUCT_PROPERTY_OVERRIDES += \
	ro.cwm.enable_key_repeat=true

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

##System Root
PRODUCT_COPY_FILES += \
	device/samsung/schS738c/init/init.qcom.rc:root/init.qcom.rc \
	device/samsung/schS738c/init/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/samsung/schS738c/init/ueventd.qcom.rc:root/ueventd.qcom.rc \
	device/samsung/schS738c/init/lpm.rc:root/lpm.rc \
	device/samsung/schS738c/schS738c.fstab:root/schS738c.fstab

PRODUCT_PROPERTY_OVERRIDES += \
	lpa.decode=true