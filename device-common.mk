#
# SPDX-FileCopyrightText: 2018 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/google/coral

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Inherit common Pixel configuration
include hardware/google/pixel/common/pixel-common-device.mk

# Inherit legacy Pixel configuration
include hardware/google/pixel/mm/device_legacy.mk

# A/B support
PRODUCT_PACKAGES += \
    checkpoint_gc \
    cppreopts.sh \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota_retrofit.mk)

# AiAi Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/allowlist_com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.google.android.as.xml

# Audio
PRODUCT_PACKAGES += \
    adnc_strm.primary.default \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl:32 \
    android.hardware.audio.effect@7.0-impl:32 \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libodsp \
    libqcomvoiceprocessingdescriptors \
    libtunnel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_c2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_c2proto.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_coral.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_f2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_f2proto.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_flame.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_jaws.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_jaws.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/audio/audiozoom.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audiozoom.xml \
    $(LOCAL_PATH)/audio/bluetooth_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_hearing_aid_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_c2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_c2proto.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_coral.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_f2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_f2proto.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_flame.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_jaws.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_jaws.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_c2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_c2proto.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_coral.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_default.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_f2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_f2proto.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_flame.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_jaws.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_jaws.xml \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/adsp_avs_config.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/adsp_avs_config.acdb \
    device/google/coral/audio/data/crus_sp_config_coral_rx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_coral_rx.bin \
    device/google/coral/audio/data/crus_sp_config_coral_tx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_coral_tx.bin \
    device/google/coral/audio/data/crus_sp_config_flame_rx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_flame_rx.bin \
    device/google/coral/audio/data/crus_sp_config_flame_tx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_flame_tx.bin \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

$(call soong_config_set_bool,QTI_GPT_UTILS,USE_BSG_FRAMEWORK,false)

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7-service-google

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# CHRE
PRODUCT_PACKAGES += \
    chre_daemon_msm

# Citadel
include hardware/google/pixel/citadel/citadel.mk

# Component Overrides
PRODUCT_COPY_FILES += \
    device/google/coral/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Context Hub
PRODUCT_PACKAGES += \
    android.hardware.contexthub-service.generic

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Default Permissions
PRODUCT_COPY_FILES += \
    device/google/coral/configs/permissions/default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions.xml

# Display
$(call soong_config_set,qtidisplay,drmpp,true)
$(call soong_config_set,qtidisplay,gralloc4,true)
$(call soong_config_set,qtidisplay,gralloc_handle_has_reserved_size,true)

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service-sm8150 \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    gralloc.qcom \
    hwcomposer.qcom \
    vendor.qti.hardware.display.allocator-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# ECO Service
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/lib/libcodec2_hidl@1.0.so \
    system/lib/libcodec2_hidl_plugin_stub.so \
    system/lib64/libcodec2_hidl@1.0.so \
    system/lib64/libcodec2_hidl_plugin_stub.so

# Elmyra
PRODUCT_PACKAGES += \
    ElmyraService

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_dirs \
    fs_config_files

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE = gms_minimal.mk
endif

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    flp.conf \
    libbatching \
    libgeofencing \
    libgnss \
    libgps.utils \
    libloc_core \
    liblocation_api

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

# Identity Credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Init
PRODUCT_PLATFORM := sm8150
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.hardware:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.$(PRODUCT_PLATFORM) \
    $(LOCAL_PATH)/init/fstab.hardware:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_PLATFORM) \
    $(LOCAL_PATH)/init/fstab.persist:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.persist \
    $(LOCAL_PATH)/init/fstab.postinstall:$(TARGET_COPY_OUT_PRODUCT)/etc/fstab.postinstall \
    $(LOCAL_PATH)/coral/init/init.coral.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.coral.rc \
    $(LOCAL_PATH)/flame/init/init.flame.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.flame.rc \
    $(LOCAL_PATH)/init/init.hardware.diag.rc.user:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).diag.rc \
    $(LOCAL_PATH)/init/init.hardware.mpssrfs.rc.user:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).mpssrfs.rc \
    $(LOCAL_PATH)/init/init.hardware.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).rc \
    $(LOCAL_PATH)/init/init.hardware.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).usb.rc \
    $(LOCAL_PATH)/init/init.insmod.coral.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.coral.cfg \
    $(LOCAL_PATH)/init/init.insmod.flame.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.flame.cfg \
    $(LOCAL_PATH)/init/init.insmod.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.insmod.sh \
    $(LOCAL_PATH)/init/init.logging.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).logging.rc \
    $(LOCAL_PATH)/init/init.power.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).power.rc \
    $(LOCAL_PATH)/init/init.radio.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.radio.sh \
    $(LOCAL_PATH)/init/init.ramoops.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.ramoops.sh \
    $(LOCAL_PATH)/init/init.recovery.device.rc:recovery/root/init.recovery.coral.rc \
    $(LOCAL_PATH)/init/init.recovery.device.rc:recovery/root/init.recovery.flame.rc \
    $(LOCAL_PATH)/init/init.sensors.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.sensors.sh \
    $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

# IPACM
PRODUCT_PACKAGES += \
    IPACM_cfg.xml \
    ipacm

# IPC Router Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/power_supply/charger/charge_disable)
$(call soong_config_set,lineage_health,charging_control_charging_enabled,0)
$(call soong_config_set,lineage_health,charging_control_charging_disabled,1)
$(call soong_config_set,lineage_health,fast_charge_node,/sys/class/qcom-battery/restrict_chg)
$(call soong_config_set,lineage_health,fast_charge_value_none,1)
$(call soong_config_set,lineage_health,fast_charge_value_fast_charge,0)

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-coral \
    android.hardware.health@2.1-service

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay-service.sdm

$(call soong_config_set_bool,livedisplay_sdm,enable_dm,false)

# LMKD
TARGET_LMKD_STATS_LOG := true

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Memtrack
PRODUCT_PACKAGES += \
    vendor.qti.hardware.memtrack-service

# Misc Writer
PRODUCT_PACKAGES += \
    misc_writer

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st \
    android.hardware.secure_element@1.0-service.st \
    NfcOverlayCoral \
    Tag

PRODUCT_COPY_FILES += \
    device/google/coral/configs/nfc/com.google.hardware.pixel.japan.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_G020N/com.google.hardware.pixel.japan.xml \
    device/google/coral/configs/nfc/com.google.hardware.pixel.japan.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_G020Q/com.google.hardware.pixel.japan.xml \
    device/google/coral/configs/nfc/libese-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libese-hal-st.conf \
    device/google/coral/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
    device/google/coral/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Partitions
PRODUCT_PACKAGES += \
    vendor_firmware_mnt_mountpoint

PRODUCT_ENFORCE_PRODUCT_PARTITION_INTERFACE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.context_hub.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.context_hub.xml \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.reboot_escrow.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.reboot_escrow.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.assist.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.assist.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.strongbox_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.strongbox_keystore.xml \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Power
include hardware/google/pixel/power-libperfmgr/aidl/device.mk

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Properties
TARGET_PRODUCT_PROP := $(LOCAL_PATH)/product.prop
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# RCS
PRODUCT_PACKAGES += \
    PresencePolling \
    RcsService

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# Security Patch Levels
BOOT_SECURITY_PATCH = 2022-10-05
VENDOR_SECURITY_PATCH = 2022-10-05

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/google/coral \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/qcom/sm8150/display \
    hardware/qcom/sm8150/gps \
    hardware/qcom/wlan \
    hardware/qcom/wlan/legacy \
    hardware/qcom-caf/bootctrl \
    system/chre/host/hal_generic \
    vendor/qcom/opensource/commonsys-intf/display \
    vendor/qcom/opensource/data-ipa-cfg-mgr-legacy-um \
    vendor/qcom/opensource/display

# Sound Trigger
PRODUCT_PACKAGES += \
    sound_trigger.primary.msmnile

$(call soong_config_set,knowles,use_sound_trigger_hal,iaxxx)

# Storage Health
PRODUCT_PACKAGES += \
    android.hardware.health.storage-service.default

# Task Profiles
PRODUCT_COPY_FILES += \
    device/google/coral/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.pixel \
    thermal_symlinks

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-$(PRODUCT_HARDWARE)-normal_mode.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-$(PRODUCT_HARDWARE)-normal_mode.conf \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-$(PRODUCT_HARDWARE)-retail_mode.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-$(PRODUCT_HARDWARE)-retail_mode.conf \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config_$(PRODUCT_HARDWARE).json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config_$(PRODUCT_HARDWARE)_jaws.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config_jaws.json

# Touch
include hardware/google/pixel/touch/device.mk

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget-service.coral \
    android.hardware.usb-service.coral

# Vibrator
include device/google/coral/vibrator/cs40l25/device.mk

# VNDK
PRODUCT_PRODUCT_VNDK_VERSION := current

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    ConnectivityOverlay \
    hostapd \
    libwifi-hal-ctrl:64 \
    WifiOverlay \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wifi_concurrency_cfg.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wifi_concurrency_cfg.txt \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf
