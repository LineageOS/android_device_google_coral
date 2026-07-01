#
# SPDX-FileCopyrightText: 2018 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_PUBLIC_SEPOLICY_DIRS += device/google/coral/sepolicy/public
PRODUCT_PRIVATE_SEPOLICY_DIRS += device/google/coral/sepolicy/private

# vendors
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/google
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/qcom/common
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/qcom/sm8150
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/knowles/common
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/tracking_denials
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/st
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/verizon

# Pixel-wide
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/confirmationui_hal
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/powerstats
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/ramdump/common

# system_ext
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/coral/sepolicy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/coral/sepolicy/system_ext/private

# misc_writer
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/google/misc_writer

# thermal
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/google/thermal

# Lineage-specific
include device/lineage/sepolicy/libion/sepolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/dynamic/lineage
BOARD_VENDOR_SEPOLICY_DIRS += device/google/coral/sepolicy/vendor/lineage
