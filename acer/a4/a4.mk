#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# Speed up scrolling
PRODUCT_PROPERTY_OVERRIDES += \
    windowsmgr.max_events_per_sec=60

# Default network type.
# 0 => WCDMA preferred, 3 => GSM/AUTO (PRL) preferred
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# The gps config appropriate for this device
#PRODUCT_COPY_FILES += \
#    device/acer/a4/prebuilt/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/acer/a4/init.paso.rc:root/init.paso.rc \
    device/acer/a4/init.paso.sh:root/init.paso.sh \
    device/acer/a4/init.paso.post_boot.sh:root/init.paso.post_boot.sh \
    device/acer/a4/ueventd.paso.rc:root/ueventd.paso.rc

include $(subdir_makefiles)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r5 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/acer/a4/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml


# media config xml file
PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/media_profiles.xml:system/etc/media_profiles.xml
# wifi & tethering custom configs
PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/wlan_tool:/system/bin/wlan_tool \
    device/acer/a4/prebuilt/hostapd.conf:/system/etc/wifi/hostapd.conf \
    device/acer/a4/prebuilt/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \

PRODUCT_PACKAGES += \
    librs_jni \
    lights.paso \
    overlay.default \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libcamera \
    camera.msm7x30 \
    gps.paso \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory \
    libreference-cdma-sms \
    libreference-ril \
    libloc_api-rpc

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    libQcomUI \
    libtilerenderer \
    liboverlay

#usb masstorage enabler package
#PRODUCT_COPY_FILES += \
#    device/acer/a4/prebuilt/UsbMassStorageToggle.apk:system/app/UsbMassStorageToggle.apk \

#Touchscreen and keyboard-related ICS stuff
PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/cypress-ts.idc:system/usr/idc/cypress-ts.idc \
    device/acer/a4/prebuilt/qwerty.idc:system/usr/keylayout/qwerty.idc

#Desire Z EGL
PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/egl/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/acer/a4/prebuilt/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/acer/a4/prebuilt/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/acer/a4/prebuilt/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/acer/a4/prebuilt/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/acer/a4/prebuilt/egl/libsc-a2xx.so:/system/lib/libsc-a2xx.so \
    device/acer/a4/prebuilt/egl/libgsl.so:/system/lib/libgsl.so 

#libs needed for camera
$(call inherit-product, device/acer/a4/prebuilt/camera/camera.mk)
#patch will add a new camera.mk at camera-htc folder
#it will replace original camera.mk at runtime so build could use desire z libs instead of stock
$(call inherit-product-if-exists, device/acer/a4/prebuilt/camera-htc/camera.mk)

#Wifi Firmware
PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/modules/ar6000.ko:system/wifi/ar6000.ko \
    device/acer/a4/prebuilt/firmware/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/acer/a4/prebuilt/firmware/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin  \
    device/acer/a4/prebuilt/firmware/bdata.SD31_1.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31_1.bin  \
    device/acer/a4/prebuilt/firmware/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin  \
    device/acer/a4/prebuilt/firmware/bdata.SD31_2.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31_2.bin  \
    device/acer/a4/prebuilt/firmware/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/acer/a4/prebuilt/firmware/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/acer/a4/prebuilt/firmware/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77
#Firmware
PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/acer/a4/prebuilt/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/acer/a4/prebuilt/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/acer/a4/prebuilt/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/acer/a4/prebuilt/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/acer/a4/prebuilt/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/acer/a4/prebuilt/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/acer/a4/prebuilt/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/acer/a4/prebuilt/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# a4 uses high-density artwork where available
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_COPY_FILES += \
    device/acer/a4/prebuilt/vold.fstab:system/etc/vold.fstab
