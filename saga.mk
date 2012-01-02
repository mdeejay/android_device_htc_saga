#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/htc/saga/init:root/init \
    device/htc/saga/init.saga.rc:root/init.saga.rc \
    device/htc/saga/init.rc:root/init.rc \
    device/htc/saga/ueventd.saga.rc:root/ueventd.saga.rc


#Toushcreen config files
PRODUCT_COPY_FILES += \
    device/htc/saga/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \

#Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/saga/saga-vendor.mk)

#Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    keyguard.no_require_sim=true \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.sys.usb.config=adb,mass_storage \
    sys.media.vdec.sw=1

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

DEVICE_PACKAGE_OVERLAYS += device/htc/saga/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# GSM voicemail config xml file
PRODUCT_COPY_FILES += \
    device/htc/saga/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Misc
PRODUCT_PACKAGES += \
    lights.saga \
    sensors.saga \
    gps.saga \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa \
    com.android.future.usb.accessory

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


# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni


# missing packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    com.android.future.usb.accessory \
    Superuser \
    su

# Nexus Prime bootanimation
PRODUCT_COPY_FILES += \
    device/htc/saga/media/bootanimation.zip:system/media/bootanimation.zip

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/saga/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/saga/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/saga/keychars/saga-keypad.kcm.bin:system/usr/keychars/saga-keypad.kcm.bin \
    device/htc/saga/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/saga/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/saga/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/saga/keylayout/saga-keypad.kl:system/usr/keylayout/saga-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/saga/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/saga/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/saga/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/saga/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/saga/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/saga/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/saga/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/saga/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/saga/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/saga/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/saga/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/saga/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/saga/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/saga/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/saga/gps.conf:system/etc/gps.conf

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/saga/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/saga/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/saga/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/saga/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/saga/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/saga/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/saga/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/saga/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/saga/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/saga/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/saga/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/saga/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/saga/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/saga/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/saga/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/saga/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/saga/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/saga/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/saga/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/saga/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/saga/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/saga/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/saga/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/saga/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/saga/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/saga/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/saga/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/saga/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/saga/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/saga/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/saga/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/saga/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/saga/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt

# Additional NAM Audio DSP Profiles to NAM Package
PRODUCT_COPY_FILES += \
    device/htc/saga/nam/default.acdb:system/etc/nam/default.acdb \
    device/htc/saga/nam/default_org.acdb:system/etc/nam/default_org.acdb \
    device/htc/saga/nam/AdieHWCodec.csv:system/etc/nam/AdieHWCodec.csv \
    device/htc/saga/nam/AIC3254_REG_DualMic_MCLK.csv:system/etc/nam/AIC3254_REG_DualMic_MCLK.csv \
    device/htc/saga/nam/CodecDSPID_MCLK.txt:system/etc/nam/CodecDSPID_MCLK.txt \
    device/htc/saga/nam/Sound_Treble_Booster_MCLK.txt:system/etc/nam/Sound_Treble_Booster_MCLK.txt \
    device/htc/saga/nam/Sound_Vocal_Booster_MCLK.txt:system/etc/nam/Sound_Vocal_Booster_MCLK.txt \
    device/htc/saga/nam/Sound_SRS_A_SPK_MCLK.txt:system/etc/nam/Sound_SRS_A_SPK_MCLK.txt \
    device/htc/saga/nam/Sound_SRS_V_HP_MCLK.txt:system/etc/nam/Sound_SRS_V_HP_MCLK.txt \
    device/htc/saga/nam/Sound_SRS_V_SPK_MCLK.txt:system/etc/nam/Sound_SRS_V_SPK_MCLK.txt \
    device/htc/saga/nam/Sound_Jazz_MCLK.txt:system/etc/nam/Sound_Jazz_MCLK.txt \
    device/htc/saga/nam/Sound_Latin_MCLK.txt:system/etc/nam/Sound_Latin_MCLK.txt \
    device/htc/saga/nam/Sound_New_Age_MCLK.txt:system/etc/nam/Sound_New_Age_MCLK.txt \
    device/htc/saga/nam/Sound_Original_MCLK.txt:system/etc/nam/Sound_Original_MCLK.txt \
    device/htc/saga/nam/Sound_Piano_MCLK.txt:system/etc/nam/Sound_Piano_MCLK.txt \
    device/htc/saga/nam/Sound_Pop_MCLK.txt:system/etc/nam/Sound_Pop_MCLK.txt \
    device/htc/saga/nam/Sound_R_B_MCLK.txt:system/etc/nam/Sound_R_B_MCLK.txt \
    device/htc/saga/nam/Sound_Rock_MCLK.txt:system/etc/nam/Sound_Rock_MCLK.txt \
    device/htc/saga/nam/Sound_SRS_A_HP_MCLK.txt:system/etc/nam/Sound_SRS_A_HP_MCLK.txt \
    device/htc/saga/nam/Sound_Dualmic_SPK_MCLK.txt:system/etc/nam/Sound_Dualmic_SPK_MCLK.txt \
    device/htc/saga/nam/Sound_Dualmic_EP_MCLK.txt:system/etc/nam/Sound_Dualmic_EP_MCLK.txt \
    device/htc/saga/nam/Sound_Dualmic_MCLK.txt:system/etc/nam/Sound_Dualmic_MCLK.txt \
    device/htc/saga/nam/Sound_Dolby_A_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_A_SPK_MCLK.txt \
    device/htc/saga/nam/Sound_Dolby_HP_MCLK.txt:system/etc/nam/Sound_Dolby_HP_MCLK.txt \
    device/htc/saga/nam/Sound_Dolby_Spk_MCLK.txt:system/etc/nam/Sound_Dolby_Spk_MCLK.txt \
    device/htc/saga/nam/Sound_Dolby_V_HP_MCLK.txt:system/etc/nam/Sound_Dolby_V_HP_MCLK.txt \
    device/htc/saga/nam/Sound_Dolby_V_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_V_SPK_MCLK.txt \
    device/htc/saga/nam/Sound_Dolby_A_HP_MCLK.txt:system/etc/nam/Sound_Dolby_A_HP_MCLK.txt \
    device/htc/saga/nam/Sound_Bass_Booster_MCLK.txt:system/etc/nam/Sound_Bass_Booster_MCLK.txt \
    device/htc/saga/nam/Sound_Blues_MCLK.txt:system/etc/nam/Sound_Blues_MCLK.txt \
    device/htc/saga/nam/Sound_Classical_MCLK.txt:system/etc/nam/Sound_Classical_MCLK.txt \
    device/htc/saga/nam/Sound_Country_MCLK.txt:system/etc/nam/Sound_Country_MCLK.txt

PRODUCT_COPY_FILES += \
    device/htc/saga/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/saga/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

LOCAL_KERNEL := device/htc/saga/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# we have enough storage spsaga to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# use high-density artwork where available
PRODUCT_LOCALES += hdpi

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
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# htc audio settings
$(call inherit-product, device/htc/saga/media_htcaudio.mk)

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/saga/proprietary/libaudioalsa.so:obj/lib/libaudioalsa.so

# All the blobs necessary for saga
PRODUCT_COPY_FILES += \
    device/htc/saga/proprietary/akmd:/system/bin/akmd \
    device/htc/saga/proprietary/bma150_usr:/system/bin/bma150_usr \
    device/htc/saga/proprietary/bootcomplete:/system/bin/bootcomplete \
    device/htc/saga/proprietary/htc_ebdlogd:/system/bin/htc_ebdlogd \
    device/htc/saga/proprietary/logcat2:/system/bin/logcat2 \
    device/htc/saga/proprietary/rmt_storage:/system/bin/rmt_storage \
    device/htc/saga/proprietary/snd3254:/system/bin/snd3254 \
    device/htc/saga/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \
    device/htc/saga/proprietary/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/htc/saga/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/saga/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/saga/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/saga/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/saga/proprietary/libgsl.so:/system/lib/libgsl.so \
    device/htc/saga/proprietary/libsc-a2xx.so:/system/lib/libsc-a2xx.so \
    device/htc/saga/proprietary/libC2D2.so:/system/lib/libC2D2.so \
    device/htc/saga/proprietary/libOpenVG.so:/system/lib/libOpenVG.so \
    device/htc/saga/proprietary/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/saga/proprietary/libgemini.so:/system/lib/libgemini.so \
    device/htc/saga/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    device/htc/saga/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    device/htc/saga/proprietary/libmmipl.so:/system/lib/libmmipl.so \
    device/htc/saga/proprietary/libmmjpeg.so:/system/lib/libmmjpeg.so

PRODUCT_BUILD_PROP_OVERRIDES += \
BUILD_FINGERPRINT="htc_europe/htc_saga/saga:2.3.5/GRJ90/156318.4:user/release-keys" \
BUILD_TYPE="userdebug" \
PRODUCT_BRAND="htc_europe"

PRODUCT_NAME := htc_saga
PRODUCT_DEVICE := saga
PRODUCT_MODEL := HTC Desire S
PRODUCT_MANUFACTURER := HTC
