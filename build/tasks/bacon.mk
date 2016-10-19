# Copyright (C) 2017 Unlegacy-Android
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

# -----------------------------------------------------------------
# Bacon update package

#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)
ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/extras/build/core/colors.mk
endif

ifeq ($(TARGET_BACON_NAME),)
    INTERNAL_BACON_NAME := $(TARGET_PRODUCT)-$(PLATFORM_VERSION)-$(shell date -u +%Y%m%d)
else
    INTERNAL_BACON_NAME := $(TARGET_BACON_NAME)
endif

INTERNAL_BACON_TARGET := $(PRODUCT_OUT)/$(INTERNAL_BACON_NAME).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(INTERNAL_BACON_TARGET)
	$(hide) $(MD5SUM) $(INTERNAL_BACON_TARGET) | sed "s|$(PRODUCT_OUT)/||" > $(INTERNAL_BACON_TARGET).md5sum
	#@echo "Package Complete: $(INTERNAL_BACON_TARGET)" >&2

	@echo  ${CL_RED}""${CL_RED}
	@echo " "
	@echo "THE   db       7MMmmmYp,   .g8mmmd· "
	@echo "     ;MM:       MM    Yb .dP·      · "
	@echo "    ,V^MM.      MM    dP dM·        "
	@echo "   ,M  ·MM      MM···bg  MM"
	@echo "   AbmmmqMA     MM    ·Y MM.           ____ ____ _  _  "
	@echo "  A·     VML    MM    ,9 ·Mb.     ,·   |__/ |  | |\/| "
	@echo ".AMA.   .AMMA  JMMmmmd9    ··bmmmd·    |  \ |__| |  |"
	@echo " "
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}"                    You are officially a karnt (Aussie's TM) now                 "${CL_RST}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RED}"======================================================================================="${CL_RED}
	@echo -e ${CL_RST}""Package Complete: "$(INTERNAL_BACON_TARGET)"${CL_RST}
	@echo -e ${CL_RED}"======================================================================================="${CL_RED}
	@echo -e ${CL_RST}"We pity the fool who thinks not to be a cunt!"${CL_RST}

