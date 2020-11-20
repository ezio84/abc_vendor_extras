# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_FLAGS \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

SOONG_CONFIG_NAMESPACES += dirtyVarsPlugin

SOONG_CONFIG_dirtyVarsPlugin :=

define addVar
  SOONG_CONFIG_dirtyVarsPlugin += $(1)
  SOONG_CONFIG_dirtyVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += customGlobalVars

ifneq ($(TARGET_FORCE_BUILD_FINGERPRINT),)
SOONG_CONFIG_customGlobalVars += force_build_fingerprint
endif

ifneq ($(TARGET_FORCE_BUILD_FINGERPRINT),)
SOONG_CONFIG_customGlobalVars_force_build_fingerprint := $(TARGET_FORCE_BUILD_FINGERPRINT)
endif
