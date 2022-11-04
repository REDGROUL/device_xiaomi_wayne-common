#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-derp

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080

# Cgroup and task_profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    $(LOCAL_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Consumerir
BOARD_HAVE_IR := true

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# Init
PRODUCT_PACKAGES += \
    init.device.rc

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl:64 \
    android.hardware.vibrator@1.0-service

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/wayne-common/wayne-common-vendor.mk)

PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.xiaomi_sdm660.qti
