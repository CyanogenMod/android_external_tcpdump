LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	addrtoname.c af.c checksum.c cpack.c gmpls.c oui.c gmt2local.c ipproto.c \
	nlpid.c l2vpn.c machdep.c parsenfsfh.c in_cksum.c \
	print-802_11.c print-802_15_4.c print-ap1394.c print-ah.c \
	print-arcnet.c print-aodv.c print-arp.c print-ascii.c print-atalk.c \
	print-atm.c print-beep.c print-bfd.c print-bgp.c \
	print-bootp.c print-bt.c print-carp.c print-cdp.c print-cfm.c \
	print-chdlc.c print-cip.c print-cnfp.c print-dccp.c print-decnet.c \
	print-domain.c print-dtp.c print-dvmrp.c print-enc.c print-egp.c \
	print-eap.c print-eigrp.c\
	print-esp.c print-ether.c print-fddi.c print-fr.c \
	print-gre.c print-hsrp.c print-icmp.c print-igmp.c \
	print-igrp.c print-ip.c print-ipcomp.c print-ipfc.c print-ipnet.c \
	print-ipx.c print-isoclns.c print-juniper.c print-krb.c \
	print-l2tp.c print-lane.c print-ldp.c print-lldp.c print-llc.c \
	print-lmp.c print-lspping.c print-lwapp.c \
	print-lwres.c print-mobile.c print-mpcp.c print-mpls.c print-msdp.c \
	print-nfs.c print-ntp.c print-null.c print-olsr.c print-ospf.c \
	print-pgm.c print-pim.c \
	print-ppi.c print-ppp.c print-pppoe.c print-pptp.c \
	print-radius.c print-raw.c print-rip.c print-rpki-rtr.c print-rrcp.c print-rsvp.c \
	print-rx.c print-sctp.c print-sflow.c print-sip.c print-sl.c print-sll.c \
	print-slow.c print-snmp.c print-stp.c print-sunatm.c print-sunrpc.c \
	print-symantec.c print-syslog.c print-tcp.c print-telnet.c print-tftp.c \
	print-timed.c print-token.c print-udld.c print-udp.c print-usb.c \
	print-vjc.c print-vqp.c print-vrrp.c print-vtp.c print-forces.c \
	print-wb.c print-zephyr.c signature.c setsignal.c tcpdump.c util.c \
	missing/strlcpy.c missing/strlcat.c print-tipc.c \
	print-isakmp.c print-babel.c print-dhcp6.c print-frag6.c print-icmp6.c \
	print-ip6.c print-ip6opts.c print-mobility.c print-netbios.c print-ospf6.c \
	print-ripng.c print-rt6.c print-smb.c send-ack.awk smbutil.c version.c

LOCAL_CFLAGS := -g
# tcpdump can't be built without optimizations, so we enforce -O2 if no
# other optimization flag is set - but we don't override what the global
# flags are saying if something else is given (-Os or -O3 are useful)
ifeq ($(findstring -O, $(TARGET_GLOBAL_CFLAGS)),)
LOCAL_CFLAGS += -O2
endif
ifneq ($(findstring -O0, $(TARGET_GLOBAL_CFLAGS)),)
LOCAL_CFLAGS += -O2
endif
LOCAL_CFLAGS += -fno-strict-aliasing
LOCAL_CFLAGS += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNBBY=8

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/missing\
	external/openssl/include\
	external/libpcap

LOCAL_SHARED_LIBRARIES += libssl libcrypto

LOCAL_STATIC_LIBRARIES += libpcap

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE := tcpdump

include $(BUILD_EXECUTABLE)
