#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/172.34.1.1/g' package/base-files/files/bin/config_generate
# Hostname
sed -i 's/OpenWrt/AX3600/g' package/base-files/files/bin/config_generate
# 修改连接数
#sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
####### Modify the version number
# sed -i "s/OpenWrt /洲•Cy build from Lienol $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/default-settings/files/zzz-default-settings
sed -i "s/\%C/洲•Cy build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/base-files/files/etc/openwrt_version
# 修改NTP服务器
sed -i 's/0.openwrt.pool.ntp.org/cn.ntp.org.cn/g' package/base-files/files/bin/config_generate
sed -i 's/1.openwrt.pool.ntp.org/ntp.aliyun.com/g' package/base-files/files/bin/config_generate
sed -i 's/2.openwrt.pool.ntp.org/time1.cloud.tencent.com/g' package/base-files/files/bin/config_generate
# 修改时区
#sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

sed -i 's/ImmortalWrt/AX3600/g' package/base-files/files/bin/config_generate
####### Modify the version number
#sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
#echo "DISTRIB_DESCRIPTION='ImmortalWrt $('%V')'" >> package/base-files/files/etc/openwrt_release
#sed -i "s/ImmortalWrt /\洲\·\C\y \build $(TZ=UTC-8 date "+%Y.%m.%d") @ ImmortalWrt /g" package/base-files/files/etc/openwrt_release
##
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt $('%V')'" >> package/base-files/files/etc/openwrt_release
sed -i "s/OpenWrt /\洲\·\C\y \build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/base-files/files/etc/openwrt_release
# DNS Cache FixUP
echo -e "#max-ttl=600\nneg-ttl=600\nmin-cache-ttl=3600" >> package/network/services/dnsmasq/files/dnsmasq.conf
# 修改连接数
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# Timezone
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
sed -i 's/time1.apple.com/ntp.ntsc.ac.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1.google.com/ntp.tencent.com/g' package/base-files/files/bin/config_generate
sed -i 's/time.cloudflare.com/ntp1.aliyun.com/g' package/base-files/files/bin/config_generate
