#
# Copyright (C) 2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# AERA currently keeps the twrp_ product prefix for the recovery backend.
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/xiaomi/blossom/device.mk)

PRODUCT_DEVICE := blossom
PRODUCT_NAME := twrp_blossom
PRODUCT_BRAND := xiaomi
PRODUCT_MODEL := Xiaomi Blossom
PRODUCT_MANUFACTURER := xiaomi
