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
sed -i 's/192.168.1.1/172.16.1.1/g' package/base-files/files/bin/config_generate
# 修改机器名称
#sed -i 's/OpenWrt/CM520-79F-Home/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/RedmiAX6000/g' package/base-files/files/bin/config_generate
# 修改机器初始密码
#sed -i 's/root::0:0:99999:7:::/root::0:0:99999:7:::/g' package/base-files/files/etc/shadow
# zerotier
#sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.8.4/g' feeds/packages/net/zerotier/Makefile
#rm -rf feeds/small/v2ray-core
####### Modify the version number
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='ImmortalWrt $('%V')'" >> package/base-files/files/etc/openwrt_release
sed -i "s/ImmortalWrt /洲·Cy build $(TZ=UTC-8 date "+%Y.%m.%d") @ ImmortalWrt /g" package/base-files/files/etc/openwrt_release
##  sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/arm/index.htm
##  
##  sed -i '741a\
##                  <tr><td width="33%">&#32534;&#35793;&#32773;&#58;&#32;&#27954;&#183;&#67;&#121;</td><td><a href="https://github.com/2286927/Build_CM520_OpenWrt_AdGuardHome" style="color: black;" target="_blank">&#32534;&#35793;&#22320;&#22336;</a></td></tr>\
##                  <tr><td width="33%">&#28304;&#30721;&#58;&#32;&#73;&#109;&#109;&#111;&#114;&#116;&#97;&#108;&#87;&#114;&#116;</td><td><a href="https://github.com/immortalwrt/immortalwrt" style="color: black;" target="_blank">&#28304;&#30721;&#38142;&#25509;</a></td></tr>
##  ' package/lean/autocore/files/arm/index.htm
# DNS Cache FixUP
echo -e "#max-ttl=600\nneg-ttl=600\nmin-cache-ttl=3600" >> package/network/services/dnsmasq/files/dnsmasq.conf
# 修改连接数
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# cpufreq
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
sed -i 's/services/system/g' feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# Timezone
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
sed -i 's/time1\.apple\.com/ntp\.ntsc\.ac\.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1\.google\.com/ntp\.tencent\.com/g' package/base-files/files/bin/config_generate
sed -i 's/time\.cloudflare\.com/ntp1\.aliyun\.com/g' package/base-files/files/bin/config_generate
