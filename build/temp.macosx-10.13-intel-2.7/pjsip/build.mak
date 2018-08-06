export PJDIR := /Users/altanaibisht/python-sipsimple/build/temp.macosx-10.13-intel-2.7/pjsip
include $(PJDIR)/version.mak
export PJ_DIR := $(PJDIR)

# build.mak.  Generated from build.mak.in by configure.
export MACHINE_NAME := auto
export OS_NAME := auto
export HOST_NAME := unix
export CC_NAME := gcc
export TARGET_NAME := x86_64-apple-darwin17.5.0
export CROSS_COMPILE := 
export LINUX_POLL := select 
export SHLIB_SUFFIX := dylib

export ac_prefix := /usr/local

LIB_SUFFIX := $(TARGET_NAME).a

# Determine which party libraries to use
export APP_THIRD_PARTY_LIBS := -lsrtp-$(TARGET_NAME)
export APP_THIRD_PARTY_EXT :=
export APP_THIRD_PARTY_LIB_FILES := $(PJ_DIR)/third_party/lib/libsrtp-$(LIB_SUFFIX)

ifeq (,1)
export PJ_RESAMPLE_DLL := 1
export APP_THIRD_PARTY_LIBS := -lresample $(APP_THIRD_PARTY_LIBS)
export APP_THIRD_PARTY_LIB_FILES := $(PJ_DIR)/third_party/lib/libresample.$(SHLIB_SUFFIX).$(PJ_VERSION_MAJOR) $(PJ_DIR)/third_party/lib/libresample.$(SHLIB_SUFFIX) $(APP_THIRD_PARTY_LIB_FILES)
else
export APP_THIRD_PARTY_LIBS := -lresample-$(TARGET_NAME) $(APP_THIRD_PARTY_LIBS)
export APP_THIRD_PARTY_LIB_FILES := $(PJ_DIR)/third_party/lib/libresample-$(LIB_SUFFIX) $(APP_THIRD_PARTY_LIB_FILES)
endif

# WebRTC
APP_THIRD_PARTY_LIBS += -lwebrtcaec-$(TARGET_NAME)
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libwebrtcaec-$(LIB_SUFFIX)

# Opus
ifneq (@ac_no_opus_codec@,1)
APP_THIRD_PARTY_LIBS += -lopuscodec-$(TARGET_NAME)
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libopuscodec-$(LIB_SUFFIX)
endif

# ZRTP
APP_THIRD_PARTY_LIBS += -lzsrtp-$(TARGET_NAME) -lsqlite3 -lstdc++
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libzsrtp-$(LIB_SUFFIX)

ifneq (@ac_no_gsm_codec@,1)
ifeq (@ac_external_gsm@,1)
# External GSM library
APP_THIRD_PARTY_EXT += -lgsm
else
APP_THIRD_PARTY_LIBS += -lgsmcodec-$(TARGET_NAME)
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libgsmcodec-$(LIB_SUFFIX)
endif
endif

ifneq (@ac_no_speex_codec@,1)
ifeq (@ac_external_speex@,1)
APP_THIRD_PARTY_EXT += -lspeex -lspeexdsp
else
APP_THIRD_PARTY_LIBS += -lspeex-$(TARGET_NAME)
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libspeex-$(LIB_SUFFIX)
endif
endif

ifneq (@ac_no_ilbc_codec@,1)
APP_THIRD_PARTY_LIBS += -lilbccodec-$(TARGET_NAME)
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libilbccodec-$(LIB_SUFFIX)
endif

ifneq (1,1)
APP_THIRD_PARTY_LIBS += -lg7221codec-$(TARGET_NAME)
APP_THIRD_PARTY_LIB_FILES += $(PJ_DIR)/third_party/lib/libg7221codec-$(LIB_SUFFIX)
endif

# Additional flags


#
# Video
# Note: there are duplicated macros in pjmedia/os-auto.mak.in (and that's not
#       good!

# FFMPEG flags
FFMPEG_CFLAGS =  -DPJMEDIA_HAS_LIBAVFORMAT=1 -DPJMEDIA_HAS_LIBAVCODEC=1 -DPJMEDIA_HAS_LIBSWSCALE=1 -DPJMEDIA_HAS_LIBAVUTIL=1 -I/usr/local/Cellar/ffmpeg/4.0.2/include 
FFMPEG_LDFLAGS =   -L/usr/local/Cellar/ffmpeg/4.0.2/lib -lavformat -lavcodec -lswscale -lavutil

# VPX flags
VPX_CFLAGS = -I/usr/local/Cellar/libvpx/1.7.0/include -DPJMEDIA_HAS_LIBVPX=1
VPX_LDFLAGS =  -L/usr/local/Cellar/libvpx/1.7.0/lib -lvpx -lm

# Video4Linux2
V4L2_CFLAGS = 
V4L2_LDFLAGS = 

# OPENH264 flags
OPENH264_CFLAGS =  
OPENH264_LDFLAGS =  

# AVF
AC_PJMEDIA_VIDEO_HAS_AVF = yes
AVF_CFLAGS = 

# iOS
IOS_CFLAGS = 

# Dshow
AC_PJMEDIA_VIDEO_HAS_DSHOW = 
DSHOW_CFLAGS = 
DSHOW_LDFLAGS = 

# Android
ANDROID_CFLAGS = @ac_android_cflags@

# libyuv
LIBYUV_CFLAGS =  
LIBYUV_LDFLAGS =  

# PJMEDIA features exclusion
PJ_VIDEO_CFLAGS += $(FFMPEG_CFLAGS) $(V4L2_CFLAGS) $(AVF_CFLAGS) \
		   $(OPENH264_CFLAGS) $(IOS_CFLAGS) $(DSHOW_CFLAGS) $(LIBYUV_CFLAGS) \
		   $(VPX_CFLAGS)
PJ_VIDEO_LDFLAGS += $(FFMPEG_LDFLAGS) $(V4L2_LDFLAGS) \
                   $(OPENH264_LDFLAGS) $(DSHOW_LDFLAGS) $(LIBYUV_LDFLAGS) \
                   $(VPX_LDFLAGS)


# CFLAGS, LDFLAGS, and LIBS to be used by applications
export APP_CC := gcc
export APP_CXX := g++
export APP_CFLAGS := -DPJ_AUTOCONF=1\
	-DNDEBUG -g -fPIC -fno-omit-frame-pointer -fno-strict-aliasing -Wno-unused-label -O2  -arch x86_64 -I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -mmacosx-version-min=10.13 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk -DPJ_IS_BIG_ENDIAN=0 -DPJ_IS_LITTLE_ENDIAN=1\
	$(PJ_VIDEO_CFLAGS) \
	-I$(PJDIR)/pjlib/include\
	-I$(PJDIR)/pjlib-util/include\
	-I$(PJDIR)/pjnath/include\
	-I$(PJDIR)/pjmedia/include\
	-I$(PJDIR)/pjsip/include
export APP_CXXFLAGS := $(APP_CFLAGS)
export APP_LDFLAGS := -L$(PJDIR)/pjlib/lib\
	-L$(PJDIR)/pjlib-util/lib\
	-L$(PJDIR)/pjnath/lib\
	-L$(PJDIR)/pjmedia/lib\
	-L$(PJDIR)/pjsip/lib\
	-L$(PJDIR)/third_party/lib\
	$(PJ_VIDEO_LDFLAGS) \
	 -arch x86_64 -L/usr/local/opt/openssl/lib -L/usr/local/opt/sqlite/lib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk
export APP_LDXXFLAGS := $(APP_LDFLAGS)
export APP_LDLIBS := \
	-lpjsip-ua-$(TARGET_NAME)\
	-lpjsip-simple-$(TARGET_NAME)\
	-lpjsip-$(TARGET_NAME)\
	-lpjmedia-codec-$(TARGET_NAME)\
	-lpjmedia-videodev-$(TARGET_NAME)\
	-lpjmedia-$(TARGET_NAME)\
	-lpjmedia-audiodev-$(TARGET_NAME)\
	-lpjnath-$(TARGET_NAME)\
	-lpjlib-util-$(TARGET_NAME)\
	$(APP_THIRD_PARTY_LIBS)\
	$(APP_THIRD_PARTY_EXT)\
	-lpj-$(TARGET_NAME)\
	-lssl -lcrypto -lm -lpthread  -framework CoreAudio -framework CoreServices -framework AudioUnit -framework AudioToolbox -framework Foundation -framework AppKit -framework AVFoundation -framework QuartzCore  -L/usr/local/Cellar/ffmpeg/4.0.2/lib -lavformat -lavcodec -lswscale -lavutil -L/usr/local/Cellar/libvpx/1.7.0/lib -lvpx -lm
export APP_LIB_FILES := \
	$(PJ_DIR)/pjsip/lib/libpjsip-ua-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjsip/lib/libpjsip-simple-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjsip/lib/libpjsip-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjmedia/lib/libpjmedia-codec-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjmedia/lib/libpjmedia-videodev-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjmedia/lib/libpjmedia-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjmedia/lib/libpjmedia-audiodev-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjmedia/lib/libpjsdp-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjnath/lib/libpjnath-$(LIB_SUFFIX) \
	$(PJ_DIR)/pjlib-util/lib/libpjlib-util-$(LIB_SUFFIX) \
	$(APP_THIRD_PARTY_LIB_FILES) \
	$(PJ_DIR)/pjlib/lib/libpj-$(LIB_SUFFIX)

# Here are the variabels to use if application is using the library
# from within the source distribution
export PJ_CC := $(APP_CC)
export PJ_CXX := $(APP_CXX)
export PJ_CFLAGS := $(APP_CFLAGS)
export PJ_CXXFLAGS := $(APP_CXXFLAGS)
export PJ_LDFLAGS := $(APP_LDFLAGS)
export PJ_LDLIBS := $(APP_LDLIBS)
export PJ_LIB_FILES := $(APP_LIB_FILES)

# And here are the variables to use if application is using the
# library from the install location (i.e. --prefix)
export PJ_INSTALL_DIR := /usr/local
export PJ_INSTALL_INC_DIR := $(PJ_INSTALL_DIR)/include
export PJ_INSTALL_LIB_DIR := $(PJ_INSTALL_DIR)/lib
export PJ_INSTALL_CFLAGS := -I$(PJ_INSTALL_INC_DIR) -DPJ_AUTOCONF=1	-DNDEBUG -g -fPIC -fno-omit-frame-pointer -fno-strict-aliasing -Wno-unused-label -O2  -arch x86_64 -I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -mmacosx-version-min=10.13 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk -DPJ_IS_BIG_ENDIAN=0 -DPJ_IS_LITTLE_ENDIAN=1
export PJ_INSTALL_CXXFLAGS := $(PJ_INSTALL_CFLAGS)
export PJ_INSTALL_LDFLAGS := -L$(PJ_INSTALL_LIB_DIR) $(APP_LDLIBS)
