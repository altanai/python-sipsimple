# build/os-auto.mak.  Generated from os-auto.mak.in by configure.

export OS_CFLAGS   := $(CC_DEF)PJ_AUTOCONF=1 -DNDEBUG -g -fPIC -fno-omit-frame-pointer -fno-strict-aliasing -Wno-unused-label -O2  -arch x86_64 -I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -mmacosx-version-min=10.13 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk -DPJ_IS_BIG_ENDIAN=0 -DPJ_IS_LITTLE_ENDIAN=1

export OS_CXXFLAGS := $(CC_DEF)PJ_AUTOCONF=1 -DNDEBUG -g -fPIC -fno-omit-frame-pointer -fno-strict-aliasing -Wno-unused-label -O2  -arch x86_64 -I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -mmacosx-version-min=10.13 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk 

export OS_LDFLAGS  :=  -arch x86_64 -L/usr/local/opt/openssl/lib -L/usr/local/opt/sqlite/lib -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk -lssl -lcrypto -lm -lpthread  -framework CoreAudio -framework CoreServices -framework AudioUnit -framework AudioToolbox -framework Foundation -framework AppKit -framework AVFoundation -framework QuartzCore  -L/usr/local/Cellar/ffmpeg/4.0.2/lib -lavformat -lavcodec -lswscale -lavutil -L/usr/local/Cellar/libvpx/1.7.0/lib -lvpx -lm

export OS_SOURCES  := 


