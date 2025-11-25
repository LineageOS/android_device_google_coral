#
# SPDX-FileCopyrightText: 2018 The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifdef AUTOMOTIVE_PRODUCT_PATH
  #RBC# include_top device/google/auto_tcu
  #RBC# include_top device/google/pixel_tcu
  #RBC# include_top device/google_car
  include device/$(AUTOMOTIVE_PRODUCT_PATH)/BoardConfig.mk
else
  TARGET_BOOTLOADER_BOARD_NAME := flame
  TARGET_SCREEN_DENSITY := 440
  TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165

  include device/google/coral/BoardConfig-common.mk
endif

include vendor/google/flame/BoardConfigVendor.mk
