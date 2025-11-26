#
# Copyright (C) 2018 The Android Open-Source Project
# Copyright (C) The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := flame

# Display
TARGET_SCREEN_DENSITY := 440

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165

include device/google/coral/BoardConfig-common.mk
include vendor/google/flame/BoardConfigVendor.mk
