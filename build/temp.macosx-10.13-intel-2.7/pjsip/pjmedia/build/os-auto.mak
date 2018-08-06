# pjmedia/build/os-auto.mak.  Generated from os-auto.mak.in by configure.

# Define the desired video device backend
# Valid values are:
#   - mac_os
#   - iphone_os
#   - android_os
AC_PJMEDIA_VIDEO = mac_os

# FFMPEG dlags
FFMPEG_CFLAGS =  -DPJMEDIA_HAS_LIBAVFORMAT=1 -DPJMEDIA_HAS_LIBAVCODEC=1 -DPJMEDIA_HAS_LIBSWSCALE=1 -DPJMEDIA_HAS_LIBAVUTIL=1 -I/usr/local/Cellar/ffmpeg/4.0.2/include 
FFMPEG_LDFLAGS =   -L/usr/local/Cellar/ffmpeg/4.0.2/lib -lavformat -lavcodec -lswscale -lavutil

# VPX flags
VPX_CFLAGS = -I/usr/local/Cellar/libvpx/1.7.0/include -DPJMEDIA_HAS_LIBVPX=1
VPX_LDFLAGS =  -L/usr/local/Cellar/libvpx/1.7.0/lib -lvpx -lm

# Video4Linux2
V4L2_CFLAGS = 
V4L2_LDFLAGS = 

# AVF
AC_PJMEDIA_VIDEO_HAS_AVF = yes
AVF_CFLAGS = 

# iOS
IOS_CFLAGS = 

# Dshow
AC_PJMEDIA_VIDEO_HAS_DSHOW = 
DSHOW_CFLAGS = 
DSHOW_LDFLAGS = 

# libyuv
LIBYUV_CFLAGS = 
LIBYUV_LDFLAGS = 

# openh264
OPENH264_CFLAGS = 
OPENH264_LDFLAGS = 

# PJMEDIA features exclusion
export CFLAGS +=    \
		 $(FFMPEG_CFLAGS) $(V4L2_CFLAGS) $(AVF_CFLAGS) \
		 $(IOS_CFLAGS) $(DSHOW_CFLAGS) $(LIBYUV_CFLAGS) $(OPENH264_CFLAGS) \
		 $(VPX_CFLAGS)
export LDFLAGS += $(FFMPEG_LDFLAGS) $(V4L2_LDFLAGS) $(DSHOW_LDFLAGS) \
    		  $(LIBYUV_LDFLAGS) $(OPENH264_LDFLAGS) $(VPX_LDFLAGS)


#
# Codecs
#
AC_NO_G7221_CODEC=1

export CODEC_OBJS=

export PJMEDIA_AUDIODEV_OBJS += coreaudio_dev.o

export CODEC_OBJS += gsm.o

export CFLAGS += -I$(THIRD_PARTY)/build/speex -I$(THIRD_PARTY)/speex/include
export CODEC_OBJS += speex_codec.o

ifneq (,1)
export PJMEDIA_OBJS += echo_speex.o
endif

export CFLAGS += -I$(THIRD_PARTY)/webrtc/src
export PJMEDIA_OBJS += echo_webrtc_aec.o

export CODEC_OBJS += ilbc.o

export CODEC_OBJS += g722.o g722/g722_enc.o g722/g722_dec.o

ifeq ($(AC_NO_G7221_CODEC),1)
export CFLAGS += -DPJMEDIA_HAS_G7221_CODEC=0
else
export CODEC_OBJS += g7221.o
export G7221_CFLAGS += -I$(THIRD_PARTY)
endif

export CODEC_OBJS += opus.o

#
# Dshow video device
#
ifeq ($(AC_PJMEDIA_VIDEO_HAS_DSHOW),yes)
export PJMEDIA_VIDEODEV_OBJS += dshow_dev.o dshow_filter.o
endif

#
# AVF video device
#
ifeq ($(AC_PJMEDIA_VIDEO_HAS_AVF),yes)
export PJMEDIA_VIDEODEV_OBJS += avf_dev.o
endif

