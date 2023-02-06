#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-Selfuse.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default IP
#sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Hostname
sed -i 's/OpenWrt/OctopusPlanet/g' package/base-files/files/bin/config_generate

####### Modify the version number
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt $('+%D %V %C')'" >> package/base-files/files/etc/openwrt_release
sed -i "s/OpenWrt /洲·Cy build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/base-files/files/etc/openwrt_release
# DNS Cache FixUP
echo -e "#max-ttl=600\nneg-ttl=600\nmin-cache-ttl=3600" >> package/network/services/dnsmasq/files/dnsmasq.conf
# 修改连接数
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=165535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

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
# git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/openwrt-passwall2
# git clone --depth=1 -b luci https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
# git clone --depth=1 https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat

# dockerd去版本验证
sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' package/small-package/dockerd/Makefile

# containerd Has验证
sed -i 's/PKG_HASH:=.*/PKG_HASH:=skip/g' feeds/packages/utils/containerd/Makefile

# 插件库改动
#rm -rf ./package/small-package
#rm -rf ./feeds/kenzo
#rm -rf ./feeds/small
# 个别插件删减
# rm -rf ./package/small-package/dockerd
# rm -rf ./package/small-package/luci-app-dockerman
#rm -rf ./feeds/packages/utils/dockerd
rm -rf ./feeds/luci/luci-app-aliyundrive-webdav
rm -rf ./feeds/packages/aliyundrive-webdav
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-aliyundrive-webdav feeds/kenzo
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/aliyundrive-webdav feeds/small
#rfeedsm -rf ./feeds/luci/luci-app-dockerman
# rm -rf ./feeds/luci/luci-app-docker
#rm -rf ./feeds/packages/utils/docker
# rm -rf ./package/small-package/luci-app-tencentcloud-cos
# rm -rf ./package/small-package/transmission-web-control
