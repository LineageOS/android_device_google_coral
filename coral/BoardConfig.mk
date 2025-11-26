#
# SPDX-FileCopyrightText: 2018 The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := coral

# Display
TARGET_SCREEN_DENSITY := 560

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165

# Includes
include device/google/coral/BoardConfig-common.mk
include vendor/google/coral/BoardConfigVendor.mk
