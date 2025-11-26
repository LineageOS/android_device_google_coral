#
# SPDX-FileCopyrightText: 2016 The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_HARDWARE := coral

include device/google/coral/device-common.mk

DEVICE_PACKAGE_OVERLAYS += device/google/coral/coral/overlay

# Audio XMLs for coral
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_volumes_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Bluetooth Tx power caps for coral
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bluetooth_power_limits_coral.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv

# CHRE
$(call soong_config_set,chre,chre_daemon_dsp_library,//vendor/google/coral:libsdsprpc)

# Display config
PRODUCT_COPY_FILES += \
    device/google/coral/configs/displayconfig/display_19260504575090817.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_19260504575090817.xml

# Settings overlay packages for regulatory_info
PRODUCT_PACKAGES += \
    SettingsOverlayG020J \
    SettingsOverlayG020P \
    SettingsOverlayG020Q \

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/coral/overlay-lineage
