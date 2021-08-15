/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_msm8937.h>

void vendor_load_properties() {
    set_dalvik_heap_size();
}