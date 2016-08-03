#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/sd/x7
TARGET_BOOTLOADER_BOARD_NAME := panda

TARGET_OTA_ASSERT_DEVICE := panda,x7,X7,SmartQ

$(call inherit-product, device/sd/sd-common/common.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay/aosp

PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/root/fstab.omap4pandaboard:root/fstab.omap4pandaboard \
	$(DEVICE_FOLDER)/root/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc \
	$(DEVICE_FOLDER)/root/init.omap4pandaboard.usb.rc:root/init.omap4pandaboard.usb.rc \
	$(DEVICE_FOLDER)/recovery/init.recovery.omap4pandaboard.rc:/root/init.recovery.omap4pandaboard.rc \
	$(DEVICE_FOLDER)/root/ueventd.omap4pandaboard.rc:root/ueventd.omap4pandaboard.rc \

# Device settings
PRODUCT_PROPERTY_OVERRIDES += \
    usb.vendor=0451 \
    usb.product.adb=D109 \
    usb.product.mtpadb=D109 \


PRODUCT_AAPT_CONFIG := mdpi ldpi  hdpi xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=48m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m

# $(call inherit-product, hardware/ti/wpan/ti-wpan-products.mk)
$(call inherit-product-if-exists, vendor/sd/sqbin-common/sqbin-common-vendor.mk)
