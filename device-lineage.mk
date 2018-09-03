#
# Copyright (C) 2020 The LineageOS Project
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

# Build necessary packages for vendor
PRODUCT_PACKAGES += \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    ese_spi_st \
    libcamera2ndk_vendor \
    libcodec2_hidl@1.0.vendor:32 \
    libcodec2_vndk.vendor \
    libdisplayconfig \
    libjson \
    libmedia_ecoservice.vendor \
    libnos:64 \
    libnosprotos:64 \
    libnos_client_citadel:64 \
    libnos_datagram:64 \
    libnos_datagram_citadel:64 \
    libnos_transport:64 \
    libqti_vndfwk_detect.vendor \
    libsensorndkbridge \
    libstagefright_bufferpool@2.0.1.vendor \
    libtextclassifier_hash.vendor:64 \
    nos_app_avb:64 \
    nos_app_keymaster:64 \
    nos_app_weaver:64 \
    libtinycompress \
    libtinyxml \
    libwifi-hal:64 \
    libwifi-hal-qcom \
    sound_trigger.primary.msmnile \

# Camera
PRODUCT_PACKAGES += \
    Snap \

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# GMS
WITH_GMS_FI := true

# Lights
PRODUCT_PACKAGES += \
    hardware.google.light@1.0.vendor \

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm \

# Enable missing props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk \
    $(LOCAL_PATH)/overlay-lineage/packages/apps/Snap \

# Partitions
AB_OTA_PARTITIONS += \
    vendor \

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service \

# Vendor Security Patch Level
VENDOR_SECURITY_PATCH := "2020-08-05"
