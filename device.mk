#
# Copyright (C) 2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

# Android 10 / vendor API baseline retained from the supplied device tree.
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Encryption and vendor TEE properties from the original Blossom tree.
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.hardware.gatekeeper=beanpod \
    ro.hardware.kmsetkey=beanpod \
    ro.vendor.mtk_microtrust_tee_support=1

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Gatekeeper service and implementation
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service-recovery \
    android.hardware.gatekeeper@1.0-impl-recovery

# Beanpod Keymaster libraries and shim. These vendor-specific pieces are
# preserved from the original tree; AERA_INCLUDE_CRYPTO does not replace them.
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

PRODUCT_PACKAGES += \
    libshim_beanpod

# USB property kept in system properties as in the original tree.
PRODUCT_SYSTEM_PROPERTIES += \
    ro.sys.usb.storage.type=mtp

PRODUCT_TARGET_VNDK_VERSION := 30

# AERA product configuration (UI, supported build options and packaging).
$(call inherit-product, $(DEVICE_PATH)/aera_blossom.mk)
