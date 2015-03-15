$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/kyletdcmcc/kyletdcmcc-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/kyletdcmcc/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

LOCAL_PATH := device/samsung/kyletdcmcc

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8
PRODUCT_NAME := cm_kyletdcmcc
PRODUCT_DEVICE := kyletdcmcc
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1 persist.fuse_sdcard=false ro.sf.lcd_density=240
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Product specific Packages
#PRODUCT_PACKAGES += \
#    libsecril-client \
#    SamsungServiceMode

# Graphics
#PRODUCT_PACKAGES += \
#	libblt_hw

#PRODUCT_PACKAGES += \
#    libomxil-bellagio

PRODUCT_PACKAGES += \
    libnetcmdiface

PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Misc Packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
#    SamsungServiceMode \
#    CMAccount \
    Torch

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Live Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    librs_jni

#$(call inherit-product, device/samsung/kyletdcmcc/opensource/libasound/alsa-lib-products.mk)


## Rootdir
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/boot/init.sp8810.rc:root/init.sp8810.rc \
    device/samsung/kyletdcmcc/boot/init.sp8810.usb.rc:root/init.sp8810.usb.rc \
    device/samsung/kyletdcmcc/boot/ueventd.sp8810.rc:root/ueventd.sp8810.rc \
    device/samsung/kyletdcmcc/boot/lpm.rc:root/lpm.rc

# prebuilt kernel modules
MOD_TGT := /system/lib/modules
MOD_SRC := $(LOCAL_PATH)/prebuilts/lib/modules
PRODUCT_COPY_FILES += \
	$(MOD_SRC)/dhd.ko:$(MOD_TGT)/dhd.ko \
	$(MOD_SRC)/j4fs.ko:$(MOD_TGT)/j4fs.ko \
	$(MOD_SRC)/mali.ko:$(MOD_TGT)/mali.ko \
	$(MOD_SRC)/modules.dep.bb:$(MOD_TGT)/modules.dep.bb \
	$(MOD_SRC)/ump.ko:$(MOD_TGT)/ump.ko

# Prebuild OMX (Why? Maybe I need.)
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libomx_m4venc_sharedlibrary.so:system/lib/libomx_m4venc_sharedlibrary.so \
$(LOCAL_PATH)/prebuilts/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so



# Egl
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/libMali.so:system/lib/libMali.so \
    device/samsung/kyletdcmcc/prebuilts/lib/libUMP.so:system/lib/libUMP.so

## Keylayouts, Keymaps
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
    device/samsung/kyletdcmcc/prebuilts/usr/keylayout/sprd-keypad.kl:system/usr/keylayout/sprd-keypad.kl

## Vold
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/vold.fstab:system/etc/vold.fstab

#########################################
## Other stuff
#########################################
# Rest of /system/etc
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/etc/dbus.conf:system/etc/dbus.conf 

# Audio libraries
#PRODUCT_COPY_FILES += \
#$(LOCAL_PATH)/prebuilts/lib/libaudiopolicy_sec.so:system/lib/libaudiopolicy_sec.so \
#$(LOCAL_PATH)/prebuilts/lib/libsamsungSoundbooster.so:system/lib/libsamsungSoundbooster.so \
#$(LOCAL_PATH)/prebuilts/lib/lib_SamsungRec_V01005.so:system/lib/lib_SamsungRec_V01005.so \
#$(LOCAL_PATH)/prebuilts/lib/lib_Samsung_SB_AM_for_ICS_v03005.so:system/lib/lib_Samsung_SB_AM_for_ICS_v03005.so \
#$(LOCAL_PATH)/prebuilts/lib/libsamsungRecord.so:system/lib/libsamsungRecord.so \
#$(LOCAL_PATH)/prebuilts/lib/hw/audio_policy.sc8810.so:system/lib/hw/audio_policy.sc8810.so \
#$(LOCAL_PATH)/prebuilts/lib/hw/audio.primary.sc8810.so:system/lib/hw/audio.primary.sc8810.so \
#$(LOCAL_PATH)/prebuilts/lib/libcontrolcsc.so:system/lib/libcontrolcsc.so \
#$(LOCAL_PATH)/prebuilts/lib/libvolumemanager.so:system/lib/libvolumemanager.so \
#$(LOCAL_PATH)/prebuilts/lib/libvolumemanager_jni.so:system/lib/libvolumemanager_jni.so \
#$(LOCAL_PATH)/prebuilts/lib/libvolumeprofilesystem.so:system/lib/libvolumeprofilesystem.so


# Audio configs
#PRODUCT_COPY_FILES += \
#$(LOCAL_PATH)/prebuilts/etc/asound.conf:system/etc/asound.conf \
#$(LOCAL_PATH)/prebuilts/etc/audio_effects.conf:system/etc/audio_effects.conf

## PreBuild Hal (Only Test)
HW_TGT := /system/lib/hw
HW_SRC := $(LOCAL_PATH)/prebuilts/lib/hw

PRODUCT_COPY_FILES += \
$(HW_SRC)/sensors.sc8810.so:$(HW_TGT)/sensors.sc8810.so \
$(HW_SRC)/lights.sc8810.so:$(HW_TGT)/lights.sc8810.so \
$(HW_SRC)/camera.sc8810.so:$(HW_TGT)/camera.sc8810.so \
$(HW_SRC)/hwcomposer.sc8810.so:$(HW_TGT)/hwcomposer.sc8810.so \
$(HW_SRC)/gralloc.sc8810.so:$(HW_TGT)/gralloc.sc8810.so \
$(HW_SRC)/gps.sc8810.so:$(HW_TGT)/gps.sc8810.so \
$(HW_SRC)/gralloc.default.so:$(HW_TGT)/gralloc.default.so \
#$(HW_SRC)/audio.primary.default.so:$(HW_TGT)/audio.primary.default.so \
#$(HW_SRC)/audio.primary.sc8810.so:$(HW_TGT)/audio.primary.sc8810.so \
#$(HW_SRC)/audio_policy.default.so:$(HW_TGT)/audio_policy.default.so \

# Power-OFF Charging animations
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/prebuilts/media/battery_batteryerror.qmg:system/media/battery_batteryerror.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_5.qmg:system/media/battery_charging_5.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_10.qmg:system/media/battery_charging_10.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_15.qmg:system/media/battery_charging_15.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_25.qmg:system/media/battery_charging_25.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_30.qmg:system/media/battery_charging_30.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_35.qmg:system/media/battery_charging_35.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_45.qmg:system/media/battery_charging_45.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_50.qmg:system/media/battery_charging_50.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_55.qmg:system/media/battery_charging_55.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_65.qmg:system/media/battery_charging_65.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_70.qmg:system/media/battery_charging_70.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_75.qmg:system/media/battery_charging_75.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_85.qmg:system/media/battery_charging_85.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_90.qmg:system/media/battery_charging_90.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_95.qmg:system/media/battery_charging_95.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \
$(LOCAL_PATH)/prebuilts/media/battery_error.qmg:system/media/battery_error.qmg \
$(LOCAL_PATH)/prebuilts/media/chargingwarning.qmg:system/media/chargingwarning.qmg \
$(LOCAL_PATH)/prebuilts/media/Disconnected.qmg:system/media/Disconnected.qmg

# Hardware features available on this device
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/lib/libsec-ril.so:system/lib/libsec-ril.so \
    $(LOCAL_PATH)/prebuilts/lib/libsecril-client.so:system/lib/libsecril-client.so \
    $(LOCAL_PATH)/prebuilts/bin/rild:system/bin/rild
#    $(LOCAL_PATH)/prebuilts/lib/libril.so:system/lib/libril.so \


# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_apsta.bin:system/etc/wifi/bcmdhd_apsta.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_mfg.bin:system/etc/wifi/bcmdhd_mfg.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_p2p.bin:system/etc/wifi/bcmdhd_p2p.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/bcmdhd_sta.bin:etc/wifi/bcmdhd_sta.bin \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    device/samsung/kyletdcmcc/prebuilts/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/kyletdcmcc/prebuilts/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    device/samsung/kyletdcmcc/prebuilts/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    device/samsung/kyletdcmcc/prebuilts/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    device/samsung/kyletdcmcc/prebuilts/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    device/samsung/kyletdcmcc/prebuilts/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
    device/samsung/kyletdcmcc/prebuilts/etc/bluetooth/network.conf:system/etc/bluetooth/network.conf \
    device/samsung/kyletdcmcc/prebuilts/bin/BCM4330B1_002.001.003.0693.0000_Samsung_Cori-vol25-TEST-ONLY.hcd:system/bin/BCM4330B1_002.001.003.0693.0000_Samsung_Cori-vol25-TEST-ONLY.hcd \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf


$(call inherit-product, device/samsung/kyletdcmcc/phone-hdpi-768-dalvik-heap.mk)
$(call inherit-product, build/target/product/full.mk)
