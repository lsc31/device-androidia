# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/slot-ab/true/BoardConfig.mk
##############################################################
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    system
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_SLOT_AB_ENABLE := true
PRODUCT_STATIC_BOOT_CONTROL_HAL := bootctrl.intel.static
BOARD_KERNEL_CMDLINE += rootfstype=ext4
##############################################################
# Source: device/intel/mixins/groups/disk-bus/auto/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/set_storage
BOARD_DISK_BUS = ff.ff
##############################################################
# Source: device/intel/mixins/groups/avb/true/BoardConfig.mk
##############################################################
BOARD_AVB_ENABLE := true
##############################################################
# Source: device/intel/mixins/groups/firststage-mount/true/BoardConfig.mk
##############################################################
BOARD_FIRSTSTAGE_MOUNT_ENABLE := true
BOARD_KERNEL_CMDLINE += androidboot.android_dt_dir=/sys/bus/platform/devices/ANDR0001:00/properties/android/
FIRSTSTAGE_MOUNT_SSDT = $(PRODUCT_OUT)/firststage-mount.aml
##############################################################
# Source: device/intel/mixins/groups/vendor-partition/true/BoardConfig.mk
##############################################################
# Those 3 lines are required to enable vendor image generation.
# Remove them if vendor partition is not used.
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := $(shell echo 1800*1048576 | bc)
AB_OTA_PARTITIONS += vendor
##############################################################
# Source: device/intel/mixins/groups/config-partition/true/BoardConfig.mk
##############################################################
BOARD_CONFIGIMAGE_PARTITION_SIZE := 8388608
BOARD_SEPOLICY_M4DEFS += module_config_partition=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/config-partition
BOARD_FLASHFILES += $(PRODUCT_OUT)/config.img
##############################################################
# Source: device/intel/mixins/groups/factory-partition/true/BoardConfig.mk
##############################################################
BOARD_FACTORYIMAGE_PARTITION_SIZE := 10485760
BOARD_FLASHFILES += $(PRODUCT_OUT)/factory.img
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/factory-partition
BOARD_SEPOLICY_M4DEFS += module_factory_partition=true
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/BoardConfig.mk.1
##############################################################
#TARGET_NO_RECOVERY ?= false

ifeq (False,true)
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
INTERNAL_USERIMAGES_EXT_VARIANT := f2fs
else
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
INTERNAL_USERIMAGES_EXT_VARIANT := ext4
endif

BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_FLASH_BLOCK_SIZE := 512

ifeq ($(SPARSE_IMG),true)
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
else
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := squashfs
endif

#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384

#BOARD_BOOTLOADER_PARTITION_SIZE ?= 62914560
BOARD_BOOTLOADER_BLOCK_SIZE := 512
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

TARGET_USES_MKE2FS := true

# Avoid Watchdog truggered reboot
BOARD_KERNEL_CMDLINE += iTCO_wdt.force_no_reboot=1

BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/boot-arch/project-celadon/$(TARGET_PRODUCT)

# Show the "OEM unlocking" option in Android "Developer options"
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/android_persistent

# Specify file for creating final flashfiles
# BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(PRODUCT_OUT)/system.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(PRODUCT_OUT)/boot.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/installer.efi
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/kernelflinger.efi
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/startup.nsh
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/unlock_device.nsh
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/efivar_oemlock
BOARD_FLASHFILES += $(PRODUCT_OUT)/bootloader
BOARD_FLASHFILES += $(PRODUCT_OUT)/fastboot-usb.img


# Kernelfligner will assume the BIOS support secure boot. Not check the EFI variable SecureBoot
# It is useful when the BIOS does not support secure boot.
KERNELFLINGER_ASSUME_BIOS_SECURE_BOOT := true
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/BoardConfig.mk.2
##############################################################
#
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/BoardConfig.mk
##############################################################
#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab.recovery

# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= $(INTEL_PATH_BUILD)/test
#TARGET_RELEASETOOLS_EXTENSIONS ?= device/intel/common/recovery
# By default recovery minui expects RGBA framebuffer
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"


#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_BOOTIMAGE_PARTITION_SIZE ?= 31457280
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= $$((3584 * 1024 * 1024))
BOARD_TOSIMAGE_PARTITION_SIZE := 10485760
BOARD_BOOTLOADER_PARTITION_SIZE ?= $$((60 * 1024 * 1024))
BOARD_BOOTLOADER_BLOCK_SIZE := 512
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
DATA_USE_F2FS := False

ifeq ($(DATA_USE_F2FS), true)
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
else
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
INTERNAL_USERIMAGES_EXT_VARIANT := ext4
endif


TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

ifeq ($(BOARD_FLASH_UFS), 1)
BOARD_FLASH_BLOCK_SIZE = 4096
else
BOARD_FLASH_BLOCK_SIZE := 512
endif

# Partition table configuration file
#BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

#
#kernel always use primary gpt without command line option "gpt",
#the label let kernel use the alternate GPT if primary GPT is corrupted.
#
BOARD_KERNEL_CMDLINE += gpt

#
# Trusted Factory Reset - persistent partition
#
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_HARDWARE)/bootctrl/boot/overlay

#can't use := here, as PRODUCT_OUT is not defined yet
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(BOARD_GPT_BIN):gpt.bin
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_BIN)

# We offer the possibility to flash from a USB storage device using
# the "installer" EFI application
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/installer.efi
#BOARD_FLASHFILES += $(INTEL_PATH_HARDWARE)/bootctrl/boot/startup.nsh

ifneq (0x0,static)
BOOTLOADER_POLICY_OEMVARS = $(PRODUCT_OUT)/bootloader_policy-oemvars.txt
BOARD_FLASHFILES += $(BOOTLOADER_POLICY_OEMVARS):bootloader_policy-oemvars.txt
BOARD_OEM_VARS += $(BOOTLOADER_POLICY_OEMVARS)
endif


BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/boot-arch/generic


KERNELFLINGER_USE_RPMB_SIMULATE := true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/update_ifwi_ab \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

BOARD_AVB_ENABLE := true
KERNELFLINGER_AVB_CMDLINE := true
BOARD_VBMETAIMAGE_PARTITION_SIZE := 2097152
BOARD_FLASHFILES += $(PRODUCT_OUT)/vbmeta.img

AB_OTA_PARTITIONS += vbmeta
AB_OTA_PARTITIONS += tos


##############################################################
# Source: device/intel/mixins/groups/sepolicy/enforcing/BoardConfig.mk
##############################################################
# SELinux Policy
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)

##############################################################
# Source: device/intel/mixins/groups/trusty/true/BoardConfig.mk
##############################################################
TARGET_USE_TRUSTY := true

KM_VERSION := 2
ifeq ($(KM_VERSION),1)
BOARD_USES_TRUSTY := true
BOARD_USES_KEYMASTER1 := true
endif

BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/trusty
BOARD_SEPOLICY_M4DEFS += module_trusty=true

LK_PRODUCT := project-celadon_64

LKBUILD_TOOLCHAIN_ROOT = $(PWD)/vendor/intel/external/prebuilts/elf/
LKBUILD_X86_TOOLCHAIN =
LKBUILD_X64_TOOLCHAIN = $(LKBUILD_TOOLCHAIN_ROOT)x86_64-elf-4.9.1-Linux-x86_64/bin
EVMMBUILD_TOOLCHAIN ?= x86_64-linux-android-
TRUSTY_BUILDROOT = $(PWD)/$(PRODUCT_OUT)/obj/trusty/

TRUSTY_ENV_VAR += LK_CORE_NUM=1
TRUSTY_ENV_VAR += TRUSTY_REF_TARGET=celadon_clk

#for trusty lk
TRUSTY_ENV_VAR += BUILDROOT=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += PATH=$$PATH:$(LKBUILD_X86_TOOLCHAIN):$(LKBUILD_X64_TOOLCHAIN)
TRUSTY_ENV_VAR += CLANG_BINDIR=$(PWD)/$(LLVM_PREBUILTS_PATH)
TRUSTY_ENV_VAR += ARCH_x86_64_TOOLCHAIN_PREFIX=${PWD}/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-${TARGET_GCC_VERSION}/bin/x86_64-linux-android-

#for trusty vmm
# use same toolchain as android kernel
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(EVMMBUILD_TOOLCHAIN)

# output build dir to android out folder
TRUSTY_ENV_VAR += BUILD_DIR=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += LKBIN_DIR=$(TRUSTY_BUILDROOT)/build-sand-x86-64/

#Workaround CPU lost issue on SIMICS, will remove this line below after PO.
BOARD_KERNEL_CMDLINE += cpu_init_udelay=500000

BOARD_TOSIMAGE_PARTITION_SIZE := 10485760
##############################################################
# Source: device/intel/mixins/groups/vndk/true/BoardConfig.mk
##############################################################
BOARD_VNDK_VERSION := current
##############################################################
# Source: device/intel/mixins/groups/2ndstage/oemvars/BoardConfig.mk
##############################################################
TARGET_BOOTLOADER_IS_2ND := true
BOARD_OEM_VARS += $(TARGET_DEVICE_DIR)/extra_files/2ndstage/oemvars.txt
##############################################################
# Source: device/intel/mixins/groups/project-celadon/default/BoardConfig.mk
##############################################################
KERNEL_CROSS_COMPILE_WRAPPER := x86_64-linux-android-

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/vendor
BOARD_FLASHFILES += $(PRODUCT_OUT)/LICENSE
##############################################################
# Source: device/intel/mixins/groups/graphics/mesa/BoardConfig.mk
##############################################################
# Use external/drm-bxt
TARGET_USE_PRIVATE_LIBDRM := true
LIBDRM_VER ?= intel

BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.atomic=1 i915.nuclear_pageflip=1 drm.vblankoffdelay=1 i915.fastboot=1
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_INTEL_UFO_DRIVER := false
BOARD_GPU_DRIVERS := i965
BOARD_USE_CUSTOMIZED_MESA := true

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 3000000

BOARD_GPU_DRIVERS ?= i965 swrast
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
TARGET_USES_HWC2 := true
endif


BOARD_USES_DRM_HWCOMPOSER := false
BOARD_USES_IA_HWCOMPOSER := true

BOARD_USES_MINIGBM := true
BOARD_ENABLE_EXPLICIT_SYNC := true
INTEL_MINIGBM := external/minigbm


BOARD_USES_GRALLOC1 := true



BOARD_CURSOR_WA := false

BOARD_THREEDIS_UNDERRUN_WA := true


BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/graphics/mesa

##############################################################
# Source: device/intel/mixins/groups/media/project-celadon/BoardConfig.mk
##############################################################
INTEL_STAGEFRIGHT := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
USE_MEDIASDK := true

BOARD_HAVE_MEDIASDK_OPEN_SOURCE := true

BOARD_HAVE_OMX_SRC := true
##############################################################
# Source: device/intel/mixins/groups/device-type/tablet/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/device-type/overlay-tablet
##############################################################
# Source: device/intel/mixins/groups/debugfs/default/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/debugfs
##############################################################
# Source: device/intel/mixins/groups/usb-gadget/g_ffs/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/usb
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/usb-gadget
##############################################################
# Source: device/intel/mixins/groups/serialport/ttyS0/BoardConfig.mk
##############################################################
SERIAL_PARAMETER ?= console=ttyS0,115200n8
##############################################################
# Source: device/intel/mixins/groups/kernel/project-celadon/BoardConfig.mk
##############################################################
TARGET_USES_64_BIT_BINDER := true
BOARD_USE_64BIT_USERSPACE := true
TARGET_SUPPORTS_64_BIT_APPS := true


TARGET_PRELINK_MODULE := false
TARGET_NO_KERNEL ?= false

KERNEL_LOGLEVEL ?= 3


BOARD_KERNEL_CMDLINE += androidboot.hardware=$(TARGET_PRODUCT) firmware_class.path=/vendor/firmware loglevel=$(KERNEL_LOGLEVEL) loop.max_part=7

ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(SPARSE_IMG),true)
BOARD_KERNEL_CMDLINE += console=tty0 $(SERIAL_PARAMETER)
endif
endif


BOARD_SEPOLICY_M4DEFS += module_kernel=true
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/kernel
##############################################################
# Source: device/intel/mixins/groups/bluetooth/btusb/BoardConfig.mk
##############################################################
BOARD_HAVE_BLUETOOTH_INTEL_ICNV := true
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-bt-pan
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/bluetooth/common


BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/intel/common/bluetooth/intel/tablet/
##############################################################
# Source: device/intel/mixins/groups/audio/project-celadon/BoardConfig.mk
##############################################################
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO ?= false
ifneq ($(BOARD_USES_GENERIC_AUDIO), true)
# Audio HAL selection Flag default setting.
#  INTEL_AUDIO_HAL:= audio     -> baseline HAL
#  INTEL_AUDIO_HAL:= audio_pfw -> PFW-based HAL
INTEL_AUDIO_HAL := audio
else
INTEL_AUDIO_HAL := stub
endif

# Use XML audio policy configuration file
USE_XML_AUDIO_POLICY_CONF ?= 1
# Use configurable audio policy
USE_CONFIGURABLE_AUDIO_POLICY ?= 1

BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/audio/project-celadon
##############################################################
# Source: device/intel/mixins/groups/wlan/iwlwifi/BoardConfig.mk
##############################################################
# This enables the wpa wireless driver
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_2_1_DEVEL
# required for wifi HAL support
BOARD_WLAN_DEVICE := iwlwifi

BOARD_WPA_SUPPLICANT_PRIVATE_LIB ?= lib_driver_cmd_intc
# Enabling iwlwifi
BOARD_USING_INTEL_IWL := true
INTEL_IWL_MODULE_SUB_FOLDER := rel
INTEL_IWL_PNVM_HW := DEFAULT
INTEL_IWL_USE_COMPAT_INSTALL := y
INTEL_IWL_COMPAT_INSTALL_DIR := updates
INTEL_IWL_COMPAT_INSTALL_PATH ?= .
INTEL_IWL_INSTALL_MOD_STRIP := INSTALL_MOD_STRIP=1
CROSS_COMPILE ?= CROSS_COMPILE=$(YOCTO_CROSSCOMPILE)
INSTALLED_KERNEL_TARGET ?= $(PREVIOUS_KERNEL_MODULE)
KERNEL_OUT_DIR ?= $(PRODUCT_OUT)/obj/kernel

COMBO_CHIP_VENDOR := intel
COMBO_CHIP := lnp

# SoftAp FW reload definitions.
# we don't really need this, it's to avoid error when the framework
# will trigger the fwReloadSoftap function, what will lead to an error
# enabling the SoftAp.
# so we set up this for letting the function execute gracefully.
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/iwlwifi-softap-dummy.ucode"
WIFI_DRIVER_FW_PATH_AP  := "/system/vendor/firmware/iwlwifi-softap-dummy.ucode"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/iwlwifi-softap-dummy.ucode"
WIFI_DRIVER_FW_PATH_PARAM := "/dev/null"

# config_wifi_background_scan_support=true:
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-pno

DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-tcp-buffers

# Add SIM , AKA and AKA' methods in EAP entries of WiFi UI
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-eap-methods

ifneq (lhp,$(INTEL_IWL_MODULE_SUB_FOLDER))
    DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-dual-band
endif

# WiDi / Miracast Optimisations
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-miracast-go
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-p2p-connected-stop-scan
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-miracast-force-single-ch
DEVICE_PACKAGE_OVERLAYS += device/intel/common/wlan/overlay-wifi-tethering

BOARD_SEPOLICY_M4DEFS += module_iwlwifi=true
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/wlan/iwlwifi
##############################################################
# Source: device/intel/mixins/groups/cpu-arch/skl/BoardConfig.mk
##############################################################
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
# 64b-specific items:
TARGET_ARCH := x86_64
TARGET_CPU_ABI := x86_64
TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86
TARGET_2ND_CPU_VARIANT := x86
else
# 32b-specific items:
TARGET_ARCH := x86
TARGET_CPU_ABI := x86
endif
##############################################################
# Source: device/intel/mixins/groups/cpuset/autocores/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/config_cpuset
##############################################################
# Source: device/intel/mixins/groups/rfkill/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/rfkill
##############################################################
# Source: device/intel/mixins/groups/dexpreopt/enabled/BoardConfig.mk
##############################################################
# enable dex-preoptimization.
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true
##############################################################
# Source: device/intel/mixins/groups/thermal/thermal-daemon/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/thermal
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/thermal/thermal-daemon
##############################################################
# Source: device/intel/mixins/groups/pstore/ram_dummy/BoardConfig.mk.1
##############################################################
BOARD_KERNEL_CMDLINE += pstore.backend=ramoops
##############################################################
# Source: device/intel/mixins/groups/pstore/ram_dummy/BoardConfig.mk.2
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/pstore
##############################################################
# Source: device/intel/mixins/groups/pstore/ram_dummy/BoardConfig.mk
##############################################################
BOARD_KERNEL_CMDLINE += \
	memmap=0x400000\$$0x50000000 \
	ramoops.mem_address=0x50000000 \
	ramoops.mem_size=0x400000
BOARD_KERNEL_CMDLINE += \
	ramoops.record_size=0x4000

BOARD_KERNEL_CMDLINE += \
	ramoops.console_size=0x200000

BOARD_KERNEL_CMDLINE += \
	ramoops.ftrace_size=0x2000

BOARD_KERNEL_CMDLINE += \
	ramoops.dump_oops=1

##############################################################
# Source: device/intel/mixins/groups/debug-phonedoctor/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_M4DEFS += module_debug_phonedoctor=true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/debug-phonedoctor
##############################################################
# Source: device/intel/mixins/groups/flashfiles/ini/BoardConfig.mk
##############################################################
FLASHFILES_CONFIG ?= $(TARGET_DEVICE_DIR)/flashfiles.ini
USE_INTEL_FLASHFILES := true
VARIANT_SPECIFIC_FLASHFILES ?= false
FAST_FLASHFILES := true
##############################################################
# Source: device/intel/mixins/groups/camera-ext/ext-camera-only/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/camera-ext/ext-camera-only
##############################################################
# Source: device/intel/mixins/groups/memtrack/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/memtrack
##############################################################
# Source: device/intel/mixins/groups/health/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/health_hal

DEVICE_FRAMEWORK_MANIFEST_FILE += \
				system/libhidl/vintfdata/manifest_healthd_exclude.xml
##############################################################
# Source: device/intel/mixins/groups/gptbuild/true/BoardConfig.mk
##############################################################
# can't use := here, as PRODUCT_OUT is not defined yet
GPTIMAGE_BIN = $(PRODUCT_OUT)/$(TARGET_PRODUCT)_gptimage.img
##############################################################
# Source: device/intel/mixins/groups/swap/zram/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/swap
BOARD_SEPOLICY_M4DEFS += module_swap=true
##############################################################
# Source: device/intel/mixins/groups/power/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/power

##############################################################
# Source: device/intel/mixins/groups/default-drm/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/project-celadon/sepolicy/drm-default
# ------------------ END MIX-IN DEFINITIONS ------------------
