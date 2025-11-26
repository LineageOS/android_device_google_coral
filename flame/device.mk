#
# SPDX-FileCopyrightText: 2016 The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_HARDWARE := flame

include device/google/coral/device-common.mk

# Audio
PRODUCT_COPY_FILES += \
    device/google/coral/audio/audio_policy_volumes_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    device/google/coral/configs/bluetooth/bluetooth_power_limits_flame.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv

# Boot Animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# CHRE
$(call soong_config_set,chre,chre_daemon_dsp_library,//vendor/google/flame:libsdsprpc)

# Display
PRODUCT_COPY_FILES += \
    device/google/coral/configs/displayconfig/display_19261132550654593.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_19261132550654593.xml

# Properties
TARGET_PRODUCT_PROP += $(LOCAL_PATH)/flame/product.prop

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/flame/overlay

PRODUCT_PACKAGES += \
    SettingsOverlayG020I \
    SettingsOverlayG020I_VN \
    SettingsOverlayG020M \
    SettingsOverlayG020N
