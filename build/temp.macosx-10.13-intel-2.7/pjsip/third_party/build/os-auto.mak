
ifneq (@ac_no_gsm_codec@,1)
ifeq (@ac_external_gsm@,1)
# External
else
DIRS += gsm
endif
endif

ifneq (@ac_no_ilbc_codec@,1)
DIRS += ilbc
endif

ifneq (@ac_no_speex_codec@,1)
ifeq (@ac_external_speex@,1)
# External speex
else
DIRS += speex
endif
endif

ifneq (1,1)
DIRS += g7221
endif

ifneq ($(findstring webrtc,webrtc_darwinos),)
DIRS += webrtc
endif

DIRS += opus

DIRS += zsrtp

