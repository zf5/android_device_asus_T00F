#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := atom
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Specific headers
TARGET_BOARD_KERNEL_HEADERS := device/asus/ctp-common/kernel-headers
TARGET_SPECIFIC_HEADER_PATH := device/asus/ctp-common/include

TARGET_DROIDBOOT_LIBS := libintel_droidboot

TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := ./device/asus/ctp-common/make_recovery_patch

# OTA Packaging / Bootimg creation
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := pack_intel
BOARD_CUSTOM_BOOTIMG_MK := device/asus/ctp-common/mkbootimg.mk
DEVICE_BASE_BOOT_IMAGE := device/asus/$(TARGET_DEVICE)/base_images/boot.img
DEVICE_BASE_RECOVERY_IMAGE := device/asus/$(TARGET_DEVICE)/base_images/recovery.img
NEED_KERNEL_MODULE_ROOT := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/asus/$(TARGET_DEVICE)
TARGET_KERNEL_ARCH := x86
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := cyanogenmod_$(TARGET_DEVICE)_defconfig

BOARD_KERNEL_CMDLINE := init=/init pci=noearly loglevel=0 vmalloc=256M androidboot.hardware=redhookbay androidboot.selinux=permissive watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=012345678901234567890123456789 snd_pcm.maximum_substreams=8 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on debug_locks=0

#TARGET_RECOVERY_UPDATER_LIBS += libintel_updater
#TARGET_RECOVERY_UPDATER_EXTRA_LIBS += liboempartitioning_static

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/ctp-common/bluetooth

# Camera
INTEL_USE_CAMERA_UVC := true
INTEL_VIDEO_XPROC_SHARING := true
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_PROVIDES_CAMERA_HAL := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_HEALTHD_CUSTOM_CHARGER_RES := device/asus/ctp-common/charger/images

# Dex-preoptimization: Speeds up initial boot (if we ever o a user build, which we don't)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Hardware
BOARD_HARDWARE_CLASS := device/asus/ctp-common/cmhw

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.clovertrail

# Houdini: enable ARM codegen for x86
BUILD_ARM_FOR_X86 := true

# IMG graphics
BOARD_GLOBAL_CFLAGS += -DASUS_ZENFONE2_LP_BLOBS
ENABLE_IMG_GRAPHICS := true
HWUI_IMG_FBO_CACHE_OPTIM := true
TARGET_INTEL_HWCOMPOSER_FORCE_ONLY_ONE_RGB_LAYER := true

# IMG Graphics: System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Opengles
BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH -DWORKAROUND_BUG_10194508
BOARD_EGL_CFG := device/asus/ctp-common/configs/egl.cfg

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.opengles.version = 131072

INTEL_VA := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_VIDEO := true

# Disable IMG RS GPU driver
# OVERRIDE_RS_DRIVER := libPVRRS.so

# enabled to carry out all drawing operations performed on a View's canvas with GPU for 2D rendering pipeline.
USE_OPENGL_RENDERER := true

# Disable an optimization that causes rendering issues for us
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_ctp
TARGET_LIBINIT_DEFINES_FILE := device/asus/ctp-common/init/init_ctp.cpp
TARGET_INIT_UMOUNT_AND_FSCK_IS_UNSAFE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_NUPLAYER_CANNOT_SET_SURFACE_WITHOUT_A_FLUSH := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true

# Media: DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

BOARD_GLOBAL_CFLAGS += -DGFX_BUF_EXT

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1677721600

# PowerHAL
TARGET_POWERHAL_VARIANT := redhookbay

# Radio
BOARD_PROVIDES_LIBRIL := true

# Recovery
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/asus/ctp-common/rootdir/etc/fstab.redhookbay

# Security
BUILD_WITH_SECURITY_FRAMEWORK := chaabi_token
BUILD_WITH_CHAABI_SUPPORT := true

# SELinux
BOARD_SEPOLICY_DIRS += device/asus/ctp-common/sepolicy

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/bus/i2c/devices/i2c-0/0-0038/dclick_mode"

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
CONFIG_HS20                 := true
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/asusfw/wifi/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/asusfw/wifi/fw_bcmdhd.bin"

# Use the non-open-source parts, if they're present
-include vendor/asus/ctp-common/BoardConfigVendor.mk
