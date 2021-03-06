# third_party/build/webrtc/os-auto.mak.  Generated from os-auto.mak.in by configure.

AC_WEBRTC_PLATFORM=webrtc_darwinos

ifeq ($(AC_WEBRTC_PLATFORM),webrtc_linux)
export CFLAGS += -DWEBRTC_TARGET_PC -DWEBRTC_LINUX -DWEBRTC_THREAD_RR
export CFLAGS += -pthread

export WEBRTCAEC_OBJS += system_wrappers/source/condition_variable_posix.o \
            		 system_wrappers/source/critical_section_posix.o \
            		 system_wrappers/source/event_posix.o \
            		 system_wrappers/source/rw_lock_posix.o \
            		 system_wrappers/source/thread_posix.o \
            		 system_wrappers/source/trace_posix.o \
            		 system_wrappers/source/cpu_linux.o
endif

ifeq ($(AC_WEBRTC_PLATFORM),webrtc_darwinos)
export CFLAGS += -DWEBRTC_TARGET_MAC_INTEL -DWEBRTC_MAC_INTEL -DWEBRTC_MAC -DWEBRTC_THREAD_RR -DWEBRTC_CLOCK_TYPE_REALTIME
export CFLAGS += -pthread

export WEBRTCAEC_OBJS += system_wrappers/source/condition_variable_posix.o \
            		 system_wrappers/source/critical_section_posix.o \
            		 system_wrappers/source/event_posix.o \
            		 system_wrappers/source/rw_lock_posix.o \
            		 system_wrappers/source/thread_posix.o \
            		 system_wrappers/source/trace_posix.o \
            		 system_wrappers/source/cpu_mac.o
endif

ifeq ($(AC_WEBRTC_PLATFORM),webrtc_win32)
export CFLAGS += -DWEBRTC_TARGET_PC -D_WIN32 -D_CRT_SECURE_NO_DEPRECATE -D_SCL_SECURE_NO_DEPRECATE -D__STD_C

export WEBRTCAEC_OBJS += system_wrappers/source/condition_variable_windows.o \
            		 system_wrappers/source/critical_section_windows.o \
            		 system_wrappers/source/event_windows.o \
            		 system_wrappers/source/rw_lock_windows.o \
            		 system_wrappers/source/thread_windows.o \
            		 system_wrappers/source/trace_windows.o \
            		 system_wrappers/source/cpu_windows.o
endif

