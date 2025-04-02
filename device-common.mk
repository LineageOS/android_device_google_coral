#
# SPDX-FileCopyrightText: 2018 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# define hardware platform
PRODUCT_PLATFORM := sm8150

LOCAL_PATH := device/google/coral

PRODUCT_VENDOR_MOVE_ENABLED := true

PRODUCT_SOONG_NAMESPACES += \
    device/google/coral \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/qcom/sm8150/display \
    hardware/qcom/sm8150/gps \
    hardware/qcom/wlan/legacy \
    hardware/qcom-caf/bootctrl \
    system/chre/host/hal_generic \
    vendor/qcom/opensource/data-ipa-cfg-mgr-legacy-um

PRODUCT_COPY_FILES += \
    device/google/coral/configs/permissions/default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions.xml \
    device/google/coral/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

PRODUCT_CHARACTERISTICS := nosdcard
PRODUCT_SHIPPING_API_LEVEL := 29

# Enforce native interfaces of product partition as VNDK
PRODUCT_PRODUCT_VNDK_VERSION := current

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.hardware:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.$(PRODUCT_PLATFORM) \
    $(LOCAL_PATH)/init/fstab.hardware:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_PLATFORM) \
    $(LOCAL_PATH)/init/fstab.persist:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.persist \
    $(LOCAL_PATH)/init/init.hardware.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).rc \
    $(LOCAL_PATH)/init/init.power.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).power.rc \
    $(LOCAL_PATH)/init/init.radio.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.radio.sh \
    $(LOCAL_PATH)/init/init.hardware.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).usb.rc \
    $(LOCAL_PATH)/init/init.insmod.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.insmod.sh \
    $(LOCAL_PATH)/init/init.sensors.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.sensors.sh \
    $(LOCAL_PATH)/init/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LOCAL_PATH)/init/init.ramoops.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.ramoops.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-$(PRODUCT_HARDWARE)-normal_mode.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-$(PRODUCT_HARDWARE)-normal_mode.conf \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-$(PRODUCT_HARDWARE)-retail_mode.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-$(PRODUCT_HARDWARE)-retail_mode.conf \

# Partitions
PRODUCT_PACKAGES += \
    vendor_firmware_mnt_mountpoint

MSM_VIDC_TARGET_LIST := msmnile # Get the color format from kernel headers
MASTER_SIDE_CP_TARGET_LIST := msmnile # ION specific settings

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.hardware.mpssrfs.rc.user:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).mpssrfs.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.hardware.diag.rc.user:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).diag.rc

# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
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

PRODUCT_PACKAGES += \
    update_engine_sideload

# Userdata Checkpointing OTA GC
PRODUCT_PACKAGES += \
    checkpoint_gc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.assist.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.assist.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.context_hub.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.context_hub.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.reboot_escrow.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.reboot_escrow.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml \
    frameworks/native/data/etc/android.hardware.strongbox_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.strongbox_keystore.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \

# Iaxxx streming and factory binary
PRODUCT_PACKAGES += \
    libtunnel \
    libodsp \
    adnc_strm.primary.default

PRODUCT_PACKAGES += \
    hwcomposer.qcom \
    android.hardware.graphics.composer@2.4-service-sm8150 \
    gralloc.qcom \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator-service

# Light HAL
PRODUCT_PACKAGES += \
    lights.qcom \
    hardware.google.light@1.1-service

# Memtrack HAL
PRODUCT_PACKAGES += \
    vendor.qti.hardware.memtrack-service

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# NFC and Secure Element packages
PRODUCT_PACKAGES += \
    Tag \
    android.hardware.nfc-service.st \
    android.hardware.secure_element@1.0-service.st \
    NfcOverlayCoral

PRODUCT_COPY_FILES += \
    device/google/coral/configs/nfc/com.google.hardware.pixel.japan.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_G020N/com.google.hardware.pixel.japan.xml \
    device/google/coral/configs/nfc/com.google.hardware.pixel.japan.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_G020Q/com.google.hardware.pixel.japan.xml

PRODUCT_COPY_FILES += \
    device/google/coral/configs/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
    device/google/coral/configs/nfc/libese-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libese-hal-st.conf \
    device/google/coral/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb-service.coral
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget-service.coral

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-coral \
    android.hardware.health@2.1-service

# Storage health HAL
PRODUCT_PACKAGES += \
    android.hardware.health.storage@1.0-service

# Enable ECO service
QC2_HAVE_ECO_SERVICE := true

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7-service-google

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal

PRODUCT_PACKAGES += \
    fs_config_dirs \
    fs_config_files

# Context hub HAL
PRODUCT_PACKAGES += \
    android.hardware.contexthub-service.generic

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

$(call soong_config_set,QTI_GPT_UTILS,USE_BSG_FRAMEWORK,false)

# Thermal HAL config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config_$(PRODUCT_HARDWARE).json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config_$(PRODUCT_HARDWARE)_jaws.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config_jaws.json

#GNSS HAL
PRODUCT_PACKAGES += \
    libgps.utils \
    libgnss \
    libloc_core \
    liblocation_api \
    libbatching \
    libgeofencing \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti

ENABLE_VENDOR_RIL_SERVICE := true

USE_QCRIL_OEMHOOK := true

HOSTAPD := hostapd
PRODUCT_PACKAGES += $(HOSTAPD)

WPA := wpa_supplicant.conf
WPA += wpa_supplicant
PRODUCT_PACKAGES += $(WPA)

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    wificond \
    WifiOverlay

# Connectivity
PRODUCT_PACKAGES += \
    ConnectivityOverlay

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wifi_concurrency_cfg.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wifi_concurrency_cfg.txt \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini \

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvoiceprocessingdescriptors

PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    audio.bluetooth.default

PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl:32 \
    android.hardware.audio.effect@7.0-impl:32 \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.audio.service

# Audio hal xmls
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_jaws.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_jaws.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_coral.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_c2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_c2proto.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_flame.xml \
    $(LOCAL_PATH)/audio/mixer_paths_iaxxx_f2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_iaxxx_f2proto.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_jaws.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_jaws.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_coral.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_c2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_c2proto.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_flame.xml \
    $(LOCAL_PATH)/audio/audio_platform_info_iaxxx_f2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_iaxxx_f2proto.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_default.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_jaws.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_jaws.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_coral.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_coral.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_c2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_c2proto.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_flame.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_flame.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_f2proto.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_f2proto.xml

# Audio Policy tables
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/audio/bluetooth_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_hearing_aid_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# Audio ACDB data
PRODUCT_COPY_FILES += \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-jaws-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-coral-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-c2proto-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-flame-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Bluetooth_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/General_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Global_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Handset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Hdmi_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Headset_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Speaker_cal.acdb \
    device/google/coral/audio/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Codec_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/OEM/sm8150-iaxxx-f2proto-snd-card/Codec_cal.acdb \
    device/google/coral/audio/acdbdata/adsp_avs_config.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/adsp_avs_config.acdb

# Audio speaker tunning config data
PRODUCT_COPY_FILES += \
    device/google/coral/audio/data/crus_sp_config_coral_rx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_coral_rx.bin \
    device/google/coral/audio/data/crus_sp_config_coral_tx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_coral_tx.bin \
    device/google/coral/audio/data/crus_sp_config_flame_rx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_flame_rx.bin \
    device/google/coral/audio/data/crus_sp_config_flame_tx.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/crus_sp_config_flame_tx.bin

# Audio audiozoom config data
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audiozoom.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audiozoom.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Use the default charger mode images
PRODUCT_PACKAGES += \
    charger_res_images

# Dumpstate HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1-service.coral

PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# Keymaster configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml

# Enable stats logging in LMKD
TARGET_LMKD_STATS_LOG := true

BOARD_USES_QCNE := true

#per device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/coral/init/init.coral.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.coral.rc \
    $(LOCAL_PATH)/flame/init/init.flame.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.flame.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# GPS configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# insmod files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init/init.insmod.coral.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.coral.cfg \
	$(LOCAL_PATH)/init/init.insmod.flame.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.flame.cfg

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.postinstall:$(TARGET_COPY_OUT_PRODUCT)/etc/fstab.postinstall

# powerstats HAL
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service.pixel

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.device.rc:recovery/root/init.recovery.coral.rc \
    $(LOCAL_PATH)/init/init.recovery.device.rc:recovery/root/init.recovery.flame.rc

QTI_TELEPHONY_UTILS := qti-telephony-utils
QTI_TELEPHONY_UTILS += qti_telephony_utils.xml
PRODUCT_PACKAGES += $(QTI_TELEPHONY_UTILS)

HIDL_WRAPPER := qti-telephony-hidl-wrapper
HIDL_WRAPPER += qti_telephony_hidl_wrapper.xml
HIDL_WRAPPER += qti-telephony-hidl-wrapper-prd
HIDL_WRAPPER += qti_telephony_hidl_wrapper_prd.xml
PRODUCT_PACKAGES += $(HIDL_WRAPPER)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Security
-include vendor/qcom/sm8150/proprietary/securemsm/config/keymaster_vendor_proprietary_board.mk
-include vendor/qcom/sm8150/proprietary/securemsm/config/keymaster_vendor_proprietary_product.mk

include hardware/google/pixel/common/pixel-common-device.mk
include device/google/coral/vibrator/cs40l25/device.mk
include hardware/google/pixel/mm/device_legacy.mk
include device/google/gs-common/thermal/thermal_hal/device.mk

# gs-common
include device/google/gs-common/misc_writer/misc_writer.mk

# Citadel
include hardware/google/pixel/citadel/citadel.mk

# power HAL
-include hardware/google/pixel/power-libperfmgr/aidl/device.mk

# Pixel Logger
include hardware/google/pixel/PixelLogger/PixelLogger.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota_retrofit.mk)

# Update soong config namespace
-include vendor/google/build/soong/soong_config_namespace/qcril_oemhook.mk

# Set Vendor SPL to match platform
VENDOR_SECURITY_PATCH = 2022-10-05

# Set boot SPL
BOOT_SECURITY_PATCH = 2022-10-05

# A2DP offload enabled for compilation
AUDIO_FEATURE_ENABLED_A2DP_OFFLOAD := true

# Modem logging file
PRODUCT_COPY_FILES += \
    device/google/coral/init/init.logging.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_PLATFORM).logging.rc

PRODUCT_COPY_FILES += \
    device/google/coral/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Audio low latency feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml

# Pro audio feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml

PRODUCT_ENFORCE_PRODUCT_PARTITION_INTERFACE := true

# Workaround for prebuilt Qualcomm neural network HAL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display \
    vendor/qcom/opensource/display

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# AiAi Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/allowlist_com.google.android.as.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_com.google.android.as.xml

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Elmyra
PRODUCT_PACKAGES += \
    ElmyraService

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

# Lineage Health
include hardware/google/pixel/lineage_health/device.mk

$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/power_supply/charger/charge_disable)
$(call soong_config_set,lineage_health,charging_control_charging_enabled,0)
$(call soong_config_set,lineage_health,charging_control_charging_disabled,1)

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay-service.sdm

$(call soong_config_set,livedisplay_sdm,enable_dm,false)

# Parts
PRODUCT_PACKAGES += \
    GoogleParts

# RCS
PRODUCT_PACKAGES += \
    PresencePolling \
    RcsService

# Touch
include hardware/google/pixel/touch/device.mk

# CHRE
PRODUCT_PACKAGES += \
    chre_daemon_msm

# Configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Display
$(call soong_config_set,qtidisplay,drmpp,true)
$(call soong_config_set,qtidisplay,gralloc4,true)
$(call soong_config_set,qtidisplay,gralloc_handle_has_reserved_size,true)

# GPS
PRODUCT_PACKAGES += \
    flp.conf

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Sound trigger
PRODUCT_PACKAGES += \
    sound_trigger.primary.msmnile

# VNDK FWK detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti.vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    libwifi-hal-ctrl:64

# Properties
TARGET_PRODUCT_PROP := $(LOCAL_PATH)/product.prop
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop

# Keep the VNDK APEX in /system partition
PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
