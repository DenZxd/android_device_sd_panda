#
# Copyright (C) 2011 The CyanogenMod Project
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

TARGET_SCREEN_WIDTH := 1280
TARGET_SCREEN_HEIGHT := 800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration for panda
$(call inherit-product, device/sd/panda/full_panda.mk)

DEVICE_PACKAGE_OVERLAYS += device/sd/panda/overlay/aosp

BOARD_USE_CUSTOM_LIBION := true

PRODUCT_NAME := full_panda
PRODUCT_DEVICE := panda
PRODUCT_BRAND := Android
PRODUCT_MODEL := Panda
PRODUCT_MANUFACTURER := SmartDevices
PRODUCT_RELEASE_NAME := X7



