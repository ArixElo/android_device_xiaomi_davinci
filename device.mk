#
# Copyright (C) 2023 The PixysOS
#
# SPDX-License-Identifier: Apache-2.0
#

# API level, the device has been commercially launched on
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from sm6150-common
$(call inherit-product, device/xiaomi/sm6150-common/sm6150.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.primary.sm6150 \
    audio_amplifier.sm6150

PRODUCT_PACKAGES += \
    liba2dpoffload \
    libhdmiedid \
    libhfp \
    libsndmonitor \
    libspkrprot

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim

# MIUICamera
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera/config.mk)

# Camera motor
PRODUCT_PACKAGES += \
    vendor.xiaomi.hardware.motor@1.0.vendor \
    XiaomiPopupCamera

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/vendor.xiaomi.hardware.motor@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.xiaomi.hardware.motor@1.0-service.rc

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/qdcm_calib_data_ss_ea_fhd_cmd_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_ss_ea_fhd_cmd_dsi_panel.xml \
    $(LOCAL_PATH)/configs/display/qdcm_calib_data_ss_eb_fhd_cmd_dsi_panel.xml:$(TARGET_COPY_OUT_VENDOR)/etc/qdcm_calib_data_ss_eb_fhd_cmd_dsi_panel.xml

# Fingerprint
PRODUCT_PACKAGES += \
    libudfpshandler \
    vendor.goodix.hardware.biometrics.fingerprint@2.1.vendor

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.davinci.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.davinci.rc \
    $(LOCAL_PATH)/rootdir/etc/init.nfc.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.nfc.rc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_sm6150

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-pixys

PRODUCT_PACKAGES += \
    DavinciCNSettingsProviderOverlay \
    DavinciCNWifiOverlay \
    DavinciINSettingsProviderOverlay \
    DavinciINWifiOverlay

# Partitions
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

PRODUCT_PACKAGES += \
    sensors.udfps

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# WiFi
PRODUCT_PACKAGES += \
    DavinciWifiOverlay

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/davinci/davinci-vendor.mk)
