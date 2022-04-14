#!/bin/bash
#
# Copyright (C) 2021 The CyanogenMod Project
# Copyright (C) 2017-18 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export DEVICE=tiare
export DEVICE_BRINGUP_YEAR=2021

DEVICE_COMMON=msm8937-common
VENDOR=xiaomi

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh $@

# Blob Fixup
BLOBS_DIR="./../../../vendor/$VENDOR/$DEVICE/proprietary"

BLOB="vendor/lib/libmmcamera2_iface_modules.so"
if [ -f "$BLOBS_DIR/$BLOB" ]; then
    # Always set 0 (Off) as CDS mode in iface_util_set_cds_mode
    sed -i -e 's|\xfd\xb1\x20\x68|\xfd\xb1\x00\x20|g' "$BLOBS_DIR/$BLOB"
    PATTERN_FOUND=$(hexdump -ve '1/1 "%.2x"' "$BLOBS_DIR/$BLOB" | grep -E -o "fdb10020" | wc -l)
    if [ $PATTERN_FOUND != "1" ]; then
        echo "Critical blob modification weren't applied on $BLOBS_DIR/$BLOB !"
        exit;
    fi
else
    echo "$BLOB is missing, Cannot fixup"
fi

BLOB="vendor/etc/init/android.hardware.keymaster@3.0-service-qti.rc"
if [ -f "$BLOBS_DIR/$BLOB" ]; then
    sed -i 's|4|3|g' "$BLOBS_DIR/$BLOB"
else
    echo "$BLOB is missing, Cannot fixup"
fi