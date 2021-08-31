#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_tiare.mk

COMMON_LUNCH_CHOICES := \
    lineage_tiare-user \
    lineage_tiare-userdebug \
    lineage_tiare-eng

PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/revengeos_tiare.mk

COMMON_LUNCH_CHOICES += \
    revengeos_tiare-user \
    revengeos_tiare-userdebug \
    revengeos_tiare-eng
