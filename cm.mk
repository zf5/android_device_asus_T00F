# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/asus/Z00D/device.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/Z00D/overlay

PRODUCT_RUNTIMES := runtime_libart_default

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_Z00D
PRODUCT_BRAND := asus
PRODUCT_MODEL := Z00D
PRODUCT_MANUFACTURER := asus
PRODUCT_DEVICE := Z00D

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=WW_Phone \
    BUILD_FINGERPRINT=asus/WW_Phone/ASUS_Z00D:5.0.1/LRX22C/WW_Phone-12.16.5.118-20151204:user/release-keys \
    PRIVATE_BUILD_DESC="WW_Phone-user 5.0.1 LRX22C WW_Phone-12.16.5.118-20151204 release-keys" \
    TARGET_DEVICE=ASUS_Z00D
