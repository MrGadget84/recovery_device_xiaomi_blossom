#
# AERA Recovery device configuration for Xiaomi Blossom family.
# Hardware-specific files and vendor services remain in device.mk / recovery/root.
#

AERA_DEFAULT_LANGUAGE := en
AERA_EXTRA_LANGUAGES := true

# Features supported by the retained device configuration.
AERA_INCLUDE_CRYPTO := true
AERA_INCLUDE_FASTBOOTD := true
AERA_INCLUDE_NTFS_3G := true
AERA_INCLUDE_LOGCAT := true

# Dynamic partitions and partition tools.
AERA_ENABLE_LPTOOLS := 1
AERA_NO_TREBLE_COMPATIBILITY_CHECK := 1
AERA_LOOP_DEVICE_ERRORS_TO_LOG := 1
AERA_UNBIND_SDCARD_F2FS := 1

# The supplied tree ships a prebuilt Image.gz.
AERA_FORCE_PREBUILT_KERNEL := 1
