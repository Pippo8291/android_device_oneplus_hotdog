#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Camera
PRODUCT_PACKAGES += \
    OnePlusCameraHelper

# Device init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom.ramdisk

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    OPlusFrameworksResTarget \
    OPlusSettingsProviderResTarget \
    OPlusSettingsResTarget \
    OPlusSystemUIResTarget

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 29

# Crypto (forces FBE v2 regardless of PRODUCT_SHIPPING_API_LEVEL)
# ensure you remove CONFIG_DM_CRYPT=y from your kernel config or set ro.crypto.allow_encrypt_override=true
# https://source.android.com/docs/security/features/encryption/file-based
# https://source.android.com/docs/security/features/encryption/metadata
PRODUCT_PROPERTY_OVERRIDES += \
	ro.crypto.volume.filenames_mode=aes-256-cts \
	ro.crypto.volume.metadata.method=dm-default-key \
	ro.crypto.dm_default_key.options_format.version=2

# adoptable storage:
# https://source.android.com/docs/security/features/encryption/file-based#enabling-fbe-on-adoptable-storage
PRODUCT_PROPERTY_OVERRIDES += \
	ro.crypto.volume.options=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized \
	ro.crypto.volume.contents_mode=aes-256-xts \
	ro.crypto.volume.filenames_mode=aes-256-cts

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/oneplus/sm8150-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/oneplus/hotdog/hotdog-vendor.mk)
