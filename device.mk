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

BOARD_TOUCHSCREEN_DRIVER := synaptics_dsx

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/T00F/overlay

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Asus properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.asus.sku=WW

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    libshim_audio \
    libtinycompress \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    device/asus/T00F/audio/asound.conf:system/etc/asound.conf \
    device/asus/T00F/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/T00F/audio/route_criteria.conf:system/etc/route_criteria.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/asus/T00F/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Bluetooth HAL
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl

PRODUCT_PROPERTY_OVERRIDES += \
    bt.hfp.WideBandSpeechEnabled=true

# Camera
PRODUCT_PACKAGES += \
    bspcapability \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl \
    libshim_camera \
    camera.redhookbay \
    Snap

# Camera props
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    camera.disable_treble=1

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    dalvik.vm.implicit_checks=none

# Display
PRODUCT_PACKAGES += \
    pvr_drv_video \
    libgbf

# Flip Cover App
PRODUCT_PACKAGES += \
    FlipFlap

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl

# Default OMX service to non-Treble
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false


# GPS
PRODUCT_PACKAGES += \
    libshim_gps

PRODUCT_COPY_FILES += \
    device/asus/T00F/configs/gps.conf:system/etc/gps.conf \
    device/asus/T00F/configs/gps.xml:system/etc/gps.xml \
    device/asus/T00F/configs/gps_logcat.xml:system/etc/gps_logcat.xml \
    device/asus/T00F/configs/gps_rs.xml:system/etc/gps_rs.xml \
    device/asus/T00F/configs/gps_spirent.xml:system/etc/gps_spirent.xml \
    device/asus/T00F/configs/gps_spirent_areaid.xml:system/etc/gps_spirent_areaid.xml \
    device/asus/T00F/configs/gps_spirent_hslp.xml:system/etc/gps_spirent_hslp.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.spid.gps.pmm=disabled \
    ro.spid.gps.tty=ttyMFD3 \
    ro.spid.gps.FrqPlan=FRQ_PLAN_26MHZ_2PPM \
    ro.spid.gps.RfType=GL_RF_4752_BRCM_EXT_LNA

# Houdini (arm native bridge)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.enable.native.bridge.exec=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.dalvik.vm.native.bridge=libhoudini.so

# Key layout files
PRODUCT_COPY_FILES += \
    device/asus/T00F/keylayout/synaptics_dsx.idc:system/usr/idc/$(BOARD_TOUCHSCREEN_DRIVER).idc \
    device/asus/T00F/keylayout/synaptics_dsx.kcm:system/usr/keychars/$(BOARD_TOUCHSCREEN_DRIVER).kcm \
    device/asus/T00F/keylayout/synaptics_dsx.kl:system/usr/keylayout/$(BOARD_TOUCHSCREEN_DRIVER).kl \
    device/asus/T00F/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl \
    device/asus/T00F/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/T00F/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/T00F/keylayout/Vendor_0b05_Product_17fc.kl:system/usr/keylayout/Vendor_0b05_Product_17fc.kl \
    device/asus/T00F/keylayout/Vendor_0b05_Product_1803.kl:system/usr/keylayout/Vendor_0b05_Product_1803.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.clovertrail

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.clovertrail

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

PRODUCT_COPY_FILES += \
    device/asus/T00F/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/T00F/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/T00F/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    device/asus/T00F/media/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml


# Media: SDK and OMX IL components
PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

# Media: libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

# Media: libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# libmix
PRODUCT_PACKAGES += \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libva_videodecoder \
    libva_videoencoder

PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoEncoderAVC \
    libOMXVideoDecoderWMV \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4

# Radio
PRODUCT_PACKAGES += \
    libshim_mmgr \
    libshim_tcs

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.status.polling.enable=0 \
    rild.libpath=/system/lib/librapid-ril-core.so \
    ro.telephony.default_network=9 \
    ro.ril.telephony.mqanelements=5

# Ramdisk
PRODUCT_PACKAGES += \
    config_init.sh \
    fstab.redhookbay \
    init.avc.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.class_main.sh \
    init.common.rc \
    init.config_init.rc \
    init.debug.rc \
    init.diag.rc \
    init.firmware.rc \
    init.gps.rc \
    init.logtool.rc \
    init.modem.rc \
    init.redhookbay.rc \
    init.platform.usb.rc \
    init.power.redhookbay.rc \
    init.recovery.redhookbay.rc \
    init.watchdog.rc \
    init.wifi.rc \
    init.wifi.vendor.rc \
    init.zram.rc \
    intel_prop \
    intel_prop.cfg \
    thermald \
    ueventd.redhookbay.rc \
    gps_daemon.sh \
    gps_lto.sh \
    init.compass.rc \
    init.wireless.rc

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    libshim_sensors \
    sensors.redhookbay

PRODUCT_COPY_FILES += \
    device/asus/T00F/configs/sensors/_hals.conf:system/vendor/etc/sensors/_hals.conf

PRODUCT_COPY_FILES += \
    device/asus/T00F/configs/sensor_hal_config_default.xml:system/etc/sensor_hal_config_default.xml \
    device/asus/T00F/configs/sensor_hal_config_general_default.xml:system/etc/sensor_hal_config_general_default.xml \
    device/asus/T00F/configs/sensor_hal_config_general_scale-pr1.xml:system/etc/sensor_hal_config_general_scale-pr1.xml \
    device/asus/T00F/configs/sensor_hal_config_scale-pr1.xml:system/etc/sensor_hal_config_scale-pr1.xml 

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# libdrm
PRODUCT_PACKAGES += \
    libdrm \
    dristat \
    drmstat

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/asus/T00F/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

$(call inherit-product-if-exists, vendor/asus/T00F/T00F-vendor.mk)

# Intel_updater
PRODUCT_PACKAGES += \
    liboempartitioning_static \
    libcgpt_static \
    libintel_updater

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Ramdisk config of governors
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.sys.perf.device.powersave=800000 \
    ro.sys.perf.device.full=1633000 \
    ro.sys.perf.device.touchboost=1330000

# Alsa
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix

PRODUCT_COPY_FILES += \
    device/asus/T00F/audio/silence.wav:system/etc/silence.wav

# Add WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)

# Vendor Interface Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# hardware optimizations
#PRODUCT_PROPERTY_OVERRIDES += \
#    dalvik.vm.isa.x86.features=sse4_2,aes_in,popcnt,movbe

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.opengles.version = 131072

# Oreo Compatibility Library
PRODUCT_PACKAGES += \
	libocompat

# PowerHAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.redhookbay

# Launcher3
PRODUCT_PACKAGES += \
    Launcher3

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl
