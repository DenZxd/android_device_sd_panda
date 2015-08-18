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

DEVICE_FOLDER := device/sd/panda
TARGET_BOOTLOADER_BOARD_NAME := panda

$(call inherit-product, device/bn/common/common.mk)

# copy all kernel modules under the "modules" directory to system/lib/modules
#PRODUCT_COPY_FILES += $(shell \
#    find $(DEVICE_FOLDER)/modules -name '*.ko' \
#    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
#    | tr '\n' ' ')

PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/root/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc \
	$(DEVICE_FOLDER)/root/init.omap4pandaboard.usb.rc:root/init.omap4pandaboard.usb.rc \
	$(DEVICE_FOLDER)/root/ueventd.omap4pandaboard.rc:root/ueventd.omap4pandaboard.rc \
	$(DEVICE_FOLDER)/root/init.omap4pandaboard.wlan.rc:root/init.omap4pandaboard.wlan.rc \

# Vold
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/vold.panda.fstab:system/etc/vold.fstab


# postrecoveryboot for recovery
# PRODUCT_COPY_FILES += \
#    $(DEVICE_FOLDER)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_AAPT_CONFIG := ldpi mdpi hdpi xhdpi

PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=402m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

$(call inherit-product-if-exists, vendor/sd/hd-common/hd-common-vendor.mk)