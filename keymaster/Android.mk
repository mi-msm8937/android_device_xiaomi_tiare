LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE := android.hardware.keymaster@3.0-service.xiaomi_tiare
LOCAL_INIT_RC := android.hardware.keymaster@3.0-service.xiaomi_tiare.rc
LOCAL_SRC_FILES := \
    service.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libutils \
    libhardware \
    libhidlbase \
    libhidltransport \
    android.hardware.keymaster@3.0

LOCAL_32_BIT_ONLY := true

include $(BUILD_EXECUTABLE)
