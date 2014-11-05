# 
# SWIG extension for Android build system. 
# 
# @author Onur Cinar #

# Check if the MY_SWIG_PACKAGE is defined 
ifndef MY_SWIG_PACKAGE
  $(error MY_SWIG_PACKAGE is not defined.) 
endif

# Replace dots with slashes for the Java directory 
MY_SWIG_OUTDIR := $(NDK_PROJECT_PATH)/src/$(subst .,/,$(MY_SWIG_PACKAGE))

# Default SWIG type is C 
ifndef MY_SWIG_TYPE 
  MY_SWIG_TYPE := c 
 endif

# Set SWIG mode 
ifeq ($(MY_SWIG_TYPE),cxx) 
  MY_SWIG_MODE := -c++ 
else 
  MY_SWIG_MODE := 
endif

# Append SWIG wrapper source files
#MY_SWIG_PACKAGE := com.apress.swig
#MY_SWIG_INTERFACES := Unix.i
#MY_SWIG_TYPE := cxx

LOCAL_SRC_FILES += $(foreach MY_SWIG_INTERFACE, $(MY_SWIG_INTERFACES), $(basename $(MY_SWIG_INTERFACE))_wrap.$(MY_SWIG_TYPE))

# Add .cxx for c++ extension
LOCAL_CPP_EXTENSION += .cxx

# generate Swig closure code (indention should be tabs for this block)

%_wrap.$(MY_SWIG_TYPE): %.i
	$(call host-mkdir,$(MY_SWIG_OUTDIR)) 
	swig -java $(MY_SWIG_MODE) -package $(MY_SWIG_PACKAGE) -outdir $(MY_SWIG_OUTDIR) $<