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

# Build necessary packages for system_ext
PRODUCT_PACKAGES += \
    com.qualcomm.qti.bluetooth_audio@1.0 \
    vendor.display.config@1.8 \
    vendor.qti.hardware.cryptfshw@1.0

# Build necessary packages for vendor
PRODUCT_PACKAGES += \
    android.hardware.identity-support-lib.vendor:64 \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    chre \
    ese_spi_st \
    libavservices_minijail_vendor:32 \
    libcamera2ndk_vendor \
    libcodec2_hidl@1.0.vendor:32 \
    libcodec2_vndk.vendor \
    libcppbor.vendor:64 \
    libdisplayconfig.qti.vendor \
    libhidltransport.product:32 \
    libhwbinder.vendor \
    libjson \
    libkeymaster_messages.vendor:64 \
    libmedia_ecoservice.vendor \
    libnos:64 \
    libnos_client_citadel:64 \
    libnos_datagram:64 \
    libnos_datagram_citadel:64 \
    libnosprotos:64 \
    libnos_transport:64 \
    libprotobuf-cpp-full-vendorcompat \
    libpuresoftkeymasterdevice.vendor:64 \
    libqti_vndfwk_detect.vendor \
    libsensorndkbridge \
    libsoft_attestation_cert.vendor:64 \
    libstagefright_bufferpool@2.0.1 \
    libteeui_hal_support.vendor:64 \
    libtextclassifier_hash.vendor:64 \
    libtinycompress \
    libtinyxml \
    libvndfwk_detect_jni.qti.vendor \
    libwifi-hal:64 \
    libwifi-hal-qcom \
    nos_app_avb:64 \
    nos_app_identity:64 \
    nos_app_keymaster:64 \
    nos_app_weaver:64 \
    sound_trigger.primary.msmnile \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.cryptfshw@1.0.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.perf@1.0.vendor \
    vendor.qti.hardware.perf@2.0.vendor

# Camera
PRODUCT_PACKAGES += \
    Snap

# Elmyra
PRODUCT_PACKAGES += \
    ElmyraService

# Enable missing vendor props
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true  \
    media.mediadrmservice.enable=true \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += ro.opa.eligible_device=true

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.1-service-sdm

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display \

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.pixel

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service
