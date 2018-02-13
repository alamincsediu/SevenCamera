LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
    frameworks/support/design/res \
    frameworks/support/v7/appcompat/res \
    frameworks/support/v7/cardview/res \
    frameworks/support/v7/recyclerview/res

LOCAL_SRC_FILES := \
    $(call all-java-files-under, java)

LOCAL_AAPT_FLAGS := \
	--auto-add-overlay \
	--extra-packages android.support.design \
	--extra-packages android.support.v7.appcompat \
	--extra-packages android.support.v7.cardview \
	--extra-packages android.support.v7.recyclerview

LOCAL_STATIC_JAVA_LIBRARIES += \
    android-support-design \
	android-support-v4 \
	android-support-v7-appcompat \
	android-support-v7-cardview \
	android-support-v7-palette \
	android-support-v7-recyclerview \
	android-support-annotations

LOCAL_PACKAGE_NAME := SevenCamera
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := platform

LOCAL_PROGUARD_FLAG_FILES := ../../proguard-rules.pro

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
include $(BUILD_MULTI_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
