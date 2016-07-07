# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for ovation hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
PRODUCT_PROPERTY_OVERRIDES := \
        net.dns1=8.8.8.8 \
        net.dns2=8.8.4.4


# This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/sd/x7/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_x7
PRODUCT_DEVICE := x7
PRODUCT_BRAND := Android
PRODUCT_MODEL := x7
PRODUCT_MANUFACTURER := SD
