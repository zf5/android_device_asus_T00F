#
# Copyright 2016 The Android Open-Source Project
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

# Boot animation
TARGET_SCREEN_WIDTH  := 720
TARGET_SCREEN_HEIGHT := 1280

# Inherit some common CM stuff.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, vendor/aokp/configs/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/T00F/device.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/T00F/overlay

PRODUCT_RUNTIMES := runtime_libart_default

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aokp_T00F
PRODUCT_BRAND := ASUS
PRODUCT_MODEL := ASUS_T00F
PRODUCT_MANUFACTURER := ASUS
PRODUCT_DEVICE := T00F
