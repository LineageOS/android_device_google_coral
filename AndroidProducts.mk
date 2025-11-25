#
# SPDX-FileCopyrightText: 2018 The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

#
# In memory of David L. Gerg, a Googler from Munich, Germany, and a passionate
# Android and Pixel fan who suddenly and unexpectedly passed way too early in
# February 2020. We miss you David, R.I.P.
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_coral.mk \
    $(LOCAL_DIR)/aosp_flame.mk \
    $(LOCAL_DIR)/aosp_coral_hwasan.mk \
    $(LOCAL_DIR)/aosp_flame_hwasan.mk \
    $(LOCAL_DIR)/lineage_coral.mk \
    $(LOCAL_DIR)/lineage_flame.mk

COMMON_LUNCH_CHOICES := \
    aosp_coral-trunk_staging-userdebug \
    aosp_flame-trunk_staging-userdebug \
    lineage_coral-trunk_staging-userdebug \
    lineage_flame-trunk_staging-userdebug
