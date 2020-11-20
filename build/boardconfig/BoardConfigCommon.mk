# Safetynet
TARGET_FORCE_BUILD_FINGERPRINT := google/redfin/redfin:11/RD1A.201105.003.C1/6886399:user/release-keys

include vendor/extras/build/boardconfig/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/extras/build/boardconfig/BoardConfigQcom.mk
endif

include vendor/extras/build/boardconfig/BoardConfigSoong.mk
