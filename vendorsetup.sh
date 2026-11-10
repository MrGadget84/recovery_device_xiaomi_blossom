#
# Copyright (C) 2023 The OrangeFox Recovery Project
# Adapted for AERA Recovery
#
# SPDX-License-Identifier: Apache-2.0
#

FDEVICE="blossom"

aera_get_target_device() {
    local script_path
    script_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

    if [[ "$script_path" == */"$FDEVICE" ]]; then
        AERA_BUILD_DEVICE="$FDEVICE"
    elif [[ "$BASH_SOURCE" == *"$FDEVICE"* ]]; then
        AERA_BUILD_DEVICE="$FDEVICE"
    elif [[ "$(set | grep '^BASH_ARGV=' | grep -w "$FDEVICE")" ]]; then
        AERA_BUILD_DEVICE="$FDEVICE"
    fi
}

# AERA_BUILD_DEVICE should normally be exported before envsetup.sh.
# Keep path-based detection as a fallback for a directly selected device tree.
if [[ -z "$1" && -z "$AERA_BUILD_DEVICE" ]]; then
    aera_get_target_device
fi

if [[ "$1" == "$FDEVICE" || "$AERA_BUILD_DEVICE" == "$FDEVICE" ]]; then
    export AERA_DEFAULT_LANGUAGE="en"
    export LC_ALL="C"

    # Build identity
    export AERA_BUILD_STATUS="Unofficial"
    export AERA_PRODUCT_PREFIX="AERA"
    export AERA_MAINTAINER="MrGadget84"

    # Recovery system/vendor logical mapper paths
    export AERA_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export AERA_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

    # Shell and command-line tools
    export AERA_USE_BASH_SHELL=1
    export AERA_ASH_IS_BASH=1
    export AERA_USE_TAR_BINARY=1
    export AERA_USE_SED_BINARY=1
    export AERA_USE_XZ_UTILS=1

    # Partition and filesystem handling
    export AERA_ENABLE_LPTOOLS=1
    export AERA_UNBIND_SDCARD_F2FS=1

    # Compatibility
    export AERA_NO_TREBLE_COMPATIBILITY_CHECK=1

    # Screen settings (same geometry values as the original Blossom tree)
    export AERA_SCREEN_H=2400
    export AERA_STATUS_H=80
    export AERA_STATUS_INDENT_LEFT=48
    export AERA_STATUS_INDENT_RIGHT=48

    # Unified Blossom-family installer/device assertions
    export TARGET_DEVICE_ALT="angelica,angelican,angelicain,cattail,dandelion"
    export AERA_TARGET_DEVICES="blossom,angelica,angelicain,angelican,cattail,dandelion"

    # Root Manager replaces the legacy Magisk/KernelSU-specific packaging flags.
    export AERA_ENABLE_ROOT_MANAGER=1
else
    if [[ -z "$AERA_BUILD_DEVICE" && -z "$BASH_SOURCE" ]]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename "$0")"
    fi
fi
