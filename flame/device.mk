#
# SPDX-FileCopyrightText: 2016 The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_HARDWARE := flame

include device/google/coral/device-common.mk

DEVICE_PACKAGE_OVERLAYS += device/google/coral/flame/overlay

# Audio XMLs for flame
PRODUCT_COPY_FILES += \
    device/google/coral/audio/audio_policy_volumes_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Bluetooth Tx power caps for flame
PRODUCT_COPY_FILES += \
    device/google/coral/bluetooth_power_limits_flame.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv

# CHRE
$(call soong_config_set,chre,chre_daemon_dsp_library,//vendor/google/flame:libsdsprpc)

# Display config
PRODUCT_COPY_FILES += \
    device/google/coral/displayconfig/display_19261132550654593.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_19261132550654593.xml

PRODUCT_PRODUCT_PROPERTIES += ro.com.google.ime.height_ratio=1.2

# Settings overlay packages for regulatory_info
PRODUCT_PACKAGES += \
    SettingsOverlayG020I \
    SettingsOverlayG020I_VN \
    SettingsOverlayG020M \
    SettingsOverlayG020N \

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/flame/overlay-lineage
