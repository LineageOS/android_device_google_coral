#
# SPDX-FileCopyrightText: 2018 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/coral/sepolicy/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/coral/sepolicy/private

# vendors
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/google
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/qcom/common
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/qcom/sm8150
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/knowles/common
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/tracking_denials
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/st
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/verizon

# Pixel-wide
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/confirmationui_hal
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/powerstats
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/ramdump/common

# system_ext
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/coral/sepolicy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/coral/sepolicy/system_ext/private

# Lineage-specific
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/dynamic/lineage
BOARD_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/lineage
