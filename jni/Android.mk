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

MY_NDK_HOME := /home/cw/android_dev/android-ndk-r10c

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hello-jni
LOCAL_SRC_FILES := hello-jni.c

include $(BUILD_SHARED_LIBRARY)


# libspdylay
include $(CLEAR_VARS)
LOCAL_MODULE    := libspdylay
LOCAL_SRC_FILES := spdylay_pq.h spdylay_int.h spdylay_map.h spdylay_queue.h \
	spdylay_buffer.h spdylay_frame.h spdylay_zlib.h \
	spdylay_session.h spdylay_helper.h spdylay_stream.h spdylay_int.h \
	spdylay_npn.h spdylay_gzip.h \
	spdylay_submit.h spdylay_outbound_item.h \
	spdylay_client_cert_vector.h \
	spdylay_net.h \
	spdylay_pq.c spdylay_map.c spdylay_queue.c \
	spdylay_buffer.c spdylay_frame.c spdylay_zlib.c \
	spdylay_session.c spdylay_helper.c spdylay_stream.c spdylay_npn.c \
	spdylay_submit.c spdylay_outbound_item.c \
	spdylay_client_cert_vector.c spdylay_gzip.c
#LOCAL_LDLIBS += -lz
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
#LOCAL_LDLIBS += -lstdc++ -lz -lc 
#LOCAL_CPP_FEATURES := rtti
LOCAL_EXPORT_LDLIBS := -lc -lz 
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_STATIC_LIBRARY)


## libspdylay
#include $(CLEAR_VARS)
#LOCAL_MODULE    := libspdylay
#LOCAL_SRC_FILES := $(MY_NDK_HOME)/usr/local/lib/libcrypto.a
#LOCAL_EXPORT_C_INCLUDES := $(MY_NDK_HOME)/usr/local/include $(MY_NDK_HOME)/usr/local/include/openssl
#include $(PREBUILT_STATIC_LIBRARY)

# crypto
include $(CLEAR_VARS)
LOCAL_MODULE    := crypto
LOCAL_SRC_FILES := $(MY_NDK_HOME)/usr/local/lib/libcrypto.a
LOCAL_EXPORT_C_INCLUDES := $(MY_NDK_HOME)/usr/local/include $(MY_NDK_HOME)/usr/local/include/openssl
include $(PREBUILT_STATIC_LIBRARY)

# ssl
include $(CLEAR_VARS)
LOCAL_MODULE    := ssl
LOCAL_SRC_FILES := $(MY_NDK_HOME)/usr/local/lib/libssl.a
LOCAL_EXPORT_C_INCLUDES := $(MY_NDK_HOME)/usr/local/include $(MY_NDK_HOME)/usr/local/include/openssl
include $(PREBUILT_STATIC_LIBRARY)

# event
include $(CLEAR_VARS)
LOCAL_MODULE    := event
LOCAL_SRC_FILES := $(MY_NDK_HOME)/usr/local/lib/libevent.a
LOCAL_EXPORT_C_INCLUDES := $(MY_NDK_HOME)/usr/local/include $(MY_NDK_HOME)/usr/local/include/event2
include $(PREBUILT_STATIC_LIBRARY)

# event_openssl
include $(CLEAR_VARS)
LOCAL_MODULE    := event_openssl
LOCAL_SRC_FILES := $(MY_NDK_HOME)/usr/local/lib/libevent_openssl.a
LOCAL_EXPORT_C_INCLUDES := $(MY_NDK_HOME)/usr/local/include $(MY_NDK_HOME)/usr/local/include/openssl
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := shrpx

#MY_SWIG_PACKAGE := com.apress.swig
#MY_SWIG_INTERFACES := Unix.i
#MY_SWIG_TYPE := c
#include ${LOCAL_PATH}/my-swig-generate.mk

LOCAL_SRC_FILES += util.cc util.h timegm.c timegm.h base64.h \
	shrpx_config.cc shrpx_config.h \
	shrpx_error.h \
	shrpx_listen_handler.cc shrpx_listen_handler.h \
	shrpx_client_handler.cc shrpx_client_handler.h \
	shrpx_upstream.h \
	shrpx_spdy_upstream.cc shrpx_spdy_upstream.h \
	shrpx_https_upstream.cc shrpx_https_upstream.h \
	shrpx_downstream_queue.cc shrpx_downstream_queue.h \
	shrpx_downstream.cc shrpx_downstream.h \
	shrpx_downstream_connection.cc shrpx_downstream_connection.h \
	shrpx_http_downstream_connection.cc shrpx_http_downstream_connection.h \
	shrpx_spdy_downstream_connection.cc shrpx_spdy_downstream_connection.h \
	shrpx_spdy_session.cc shrpx_spdy_session.h \
	shrpx_log.cc shrpx_log.h \
	shrpx_http.cc shrpx_http.h \
	shrpx_io_control.cc shrpx_io_control.h \
	shrpx_ssl.cc shrpx_ssl.h \
	shrpx_thread_event_receiver.cc shrpx_thread_event_receiver.h \
	shrpx_worker.cc shrpx_worker.h \
	shrpx_accesslog.cc shrpx_accesslog.h \
	http-parser/http_parser.c http-parser/http_parser.h \
	shrpx.cc shrpx.h com_example_hellojni_HelloJni.h
LOCAL_WHOLE_STATIC_LIBRARIES := event_openssl event ssl crypto libspdylay
#LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
#include $(BUILD_EXECUTABLE)
include $(BUILD_SHARED_LIBRARY)