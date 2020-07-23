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

# Camera
PRODUCT_PACKAGES += \
    Snap \

# Lights
PRODUCT_PACKAGES += \
    hardware.google.light@1.0.vendor \

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Partitions
AB_OTA_PARTITIONS += \
    vendor \

# Properties
TARGET_PRODUCT_PROP := $(LOCAL_PATH)/product.prop
