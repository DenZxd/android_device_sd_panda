#
# Copyright (C) 2011 Texas Instruments Inc.
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

# These two variables are set first, so they can be overridden
# by BoardConfigVendor.mk
DEVICE_FOLDER := device/sd/panda
TARGET_BOARD_OMAP_CPU := 4470

# inherit from common
-include device/sd/common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/sd/sd-common/BoardConfigVendor.mk


# Kernel/Boot
BOARD_USES_UBOOT := true

# Default values, possibly overridden by BoardConfigVendor.mk
TARGET_BOARD_INFO_FILE := device/sd/panda/board-info.txt

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/sd/panda/recovery/recovery_ui.c
TARGET_RECOVERY_INITRC := device/sd/panda/recovery/init.rc

# Use the non-open-source parts, if they're present
-include vendor/sd/panda/BoardConfigVendor.mk

TARGET_KERNEL_CONFIG := panda_X7_defconfig
TARGET_KERNEL_SOURCE := kernel/sd/panda
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-linux-androideabi-4.6

SGX_MODULES:
	make clean -C $(COMMON_FOLDER)/pvr-source/eurasiacon/build/linux2/omap4430_android
	cp $(TARGET_KERNEL_SOURCE)/drivers/video/omap2/omapfb/omapfb.h $(KERNEL_OUT)/drivers/video/omap2/omapfb/omapfb.h
	make -j8 -C $(COMMON_FOLDER)/pvr-source/eurasiacon/build/linux2/omap4430_android ARCH=arm KERNEL_CROSS_COMPILE=arm-eabi- CROSS_COMPILE=arm-eabi- KERNELDIR=$(KERNEL_OUT) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=544sc PLATFORM_VERSION=4.0
	mv $(KERNEL_OUT)/../../target/kbuild/pvrsrvkm_sgx544_112.ko $(KERNEL_MODULES_OUT)
	$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip --strip-unneeded $(KERNEL_MODULES_OUT)/pvrsrvkm_sgx544_112.ko

WIFI_MODULES:
	make -C hardware/ti/wlan/mac80211/compat_wl12xx KERNELDIR=$(KERNEL_OUT) KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) ARCH=arm CROSS_COMPILE=arm-eabi-
	mv $(KERNEL_OUT)/lib/crc7.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/compat/compat.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/net/mac80211/mac80211.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/net/wireless/cfg80211.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/drivers/net/wireless/wl12xx/wl12xx.ko $(KERNEL_MODULES_OUT)
	mv hardware/ti/wlan/mac80211/compat_wl12xx/drivers/net/wireless/wl12xx/wl12xx_sdio.ko $(KERNEL_MODULES_OUT)

TARGET_KERNEL_MODULES := SGX_MODULES WIFI_MODULES

# Recovery/TWRP Config
DEVICE_RESOLUTION := 1280x800
TW_BRIGHTNESS_PATH := /sys/class/backlight/pwm-backlight.0/brightness
#TW_NO_SCREEN_BLANK := true

RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true

DISABLE_DEXPREOPT := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"

TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_ALWAYS_RMRF := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TWRP_EVENT_LOGGING := true

BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#TW_NO_SCREEN_TIMEOUT := true
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true
