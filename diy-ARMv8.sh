#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-ARMv8.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.1.3/g' package/base-files/files/bin/config_generate

# Hostname
sed -i 's/OpenWrt/OctopusPlanet/g' package/base-files/files/bin/config_generate
####### Modify the version number
# sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
# echo "DISTRIB_DESCRIPTION='ImmortalWrt $('%V')'" >> package/base-files/files/etc/openwrt_release
# sed -i "s/ImmortalWrt /\洲\·\C\y \build $(TZ=UTC-8 date "+%Y.%m.%d") @ ImmortalWrt /g" package/base-files/files/etc/openwrt_release
###
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt $('%V')'" >> package/base-files/files/etc/openwrt_release
sed -i "s/OpenWrt /\洲\·\C\y \build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/base-files/files/etc/openwrt_release
###
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/arm/index.htm

# Enable AAAA
sed -i 's/filter_aaaa	1/filter_aaaa	0/g' package/network/services/dnsmasq/files/dhcp.conf

# Timezone
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
sed -i 's/time1\.apple\.com/ntp\.ntsc\.ac\.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1\.google\.com/ntp\.tencent\.com/g' package/base-files/files/bin/config_generate
sed -i 's/time\.cloudflare\.com/ntp1\.aliyun\.com/g' package/base-files/files/bin/config_generate

# cpufreq
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
sed -i 's/services/system/g' feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# Change default theme
#sed -i 's#luci-theme-bootstrap#luci-theme-opentomcat#g' feeds/luci/collections/luci/Makefile
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Add additional packages
## git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
## git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
## git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/openwrt-passwall2
## git clone --depth=1 -b luci https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
## git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
#svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-dockerman feeds/luci/luci-app-dockerman
#svn export --force https://github.com/kiddin9/openwrt-packages/trunk/dockerd feeds/packages/utils/dockerd

rm -rf feeds/luci/luci-app-aliyundrive-webdav
rm -rf feeds/packages/aliyundrive-webdav

#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# docker回滚25.0.6版本
sed -i 's/PKG_VERSION:=\([0-9]\+\.[0-9]\+\.[0-9]\+\)/PKG_VERSION:=25.0.6/g' feeds/packages/utils/docker/Makefile
sed -i 's/^\(PKG_HASH:=\)\([a-fA-F0-9]\{64\}\)/PKG_HASH:=c19640df369eec3a485158d7851fe647a1403009b11361c50a9ec4c58742c3c0/g' feeds/packages/utils/docker/Makefile
sed -i 's/PKG_GIT_SHORT_COMMIT:=\([[:alnum:]]\+\)/PKG_GIT_SHORT_COMMIT:=32b99dd/g' feeds/packages/utils/docker/Makefile

# dockerd回滚25.0.6版本or去版本验证
#sed -i 's/PKG_VERSION:=\([0-9]\+\.[0-9]\+\.[0-9]\+\)/PKG_VERSION:=25.0.6/g' feeds/packages/utils/dockerd/Makefile
#sed -i 's/^\(PKG_HASH:=\)\([a-fA-F0-9]\{64\}\)/PKG_HASH:=c06bfd5dc561b3d105488d9641ce5f8c7024130616ba393e61b2af47b5177658/g' feeds/packages/utils/dockerd/Makefile
#sed -i 's/PKG_GIT_SHORT_COMMIT:=\([[:alnum:]]\+\)/PKG_GIT_SHORT_COMMIT:=b08a51f/g' feeds/packages/utils/dockerd/Makefile
sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile

# containerd Has验证
sed -i 's/PKG_HASH:=.*/PKG_HASH:=skip/g' feeds/packages/utils/containerd/Makefile

sed -i '741a\
                <tr><td width="33%">&#32534;&#35793;&#32773;&#58;&#32;&#27954;&#183;&#67;&#121;</td><td><a href="https://github.com/2286927/OpenWrt-ARMv8" style="color: black;" target="_blank">&#32534;&#35793;&#22320;&#22336;</a></td></tr>\
                <tr><td width="33%">&#28304;&#30721;&#58;&#32;&#108;&#101;&#100;&#101;</td><td><a href="https://github.com/coolsnowwolf/lede" style="color: black;" target="_blank">&#28304;&#30721;&#38142;&#25509;</a></td></tr>
' package/lean/autocore/files/arm/index.htm

