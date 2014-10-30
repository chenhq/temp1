# Copyright (C) 2009 The Android Open Source Project
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
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hello-jni
LOCAL_SRC_FILES := hello-jni.c

include $(BUILD_SHARED_LIBRARY)

# get zlib
#include $(CLEAR_VARS)
#LOCAL_MODULE     := zlib
#LOCAL_SRC_FILES  := /home/think/android-ndk-r10c/prebuilt/linux-x86_64/lib/python2.7/lib-dynload/zlib.so
#include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

OBJECTS = spdylay_pq.c spdylay_map.c spdylay_queue.c \
	spdylay_buffer.c spdylay_frame.c spdylay_zlib.c \
	spdylay_session.c spdylay_helper.c spdylay_stream.c spdylay_npn.c \
	spdylay_submit.c spdylay_outbound_item.c \
	spdylay_client_cert_vector.c spdylay_gzip.c

HFILES = spdylay_pq.h spdylay_int.h spdylay_map.h spdylay_queue.h \
	spdylay_buffer.h spdylay_frame.h spdylay_zlib.h \
	spdylay_session.h spdylay_helper.h spdylay_stream.h spdylay_int.h \
	spdylay_npn.h spdylay_gzip.h \
	spdylay_submit.h spdylay_outbound_item.h \
	spdylay_client_cert_vector.h \
	spdylay_net.h
	
LOCAL_MODULE    := libspdylay
LOCAL_SRC_FILES := $(HFILES) $(OBJECTS)
LOCAL_C_INCLUDES += ./
LOCAL_C_INCLUDES += /home/think/android-ndk-r10c/platforms/android-21/arch-arm/usr/
#LOCAL_LDLIBS += /home/think/android-ndk-r10c/prebuilt/linux-x86_64/lib/python2.7/lib-dynload/zlib.so
LOCAL_LDLIBS += -lz
include $(BUILD_SHARED_LIBRARY)
