#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#git clone https://github.com/kiddin9/openwrt-packages package/kiddin9
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
git clone https://github.com/kenzok8/small.git package/small
#rm -rf package/openwrt-packages/luci-app-adguardhome
#rm -rf package/openwrt-packages/adguardhome
#rm -rf package/openwrt-packages/luci-app-ddns-go
#rm -rf package/openwrt-packages/ddns-go
#rm -rf feeds/packages/net/adguardhome
#git clone https://github.com/kenzok8/small-package package/small-package
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-turboacc package/small-package/luci-app-turboacc
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/shortcut-fe package/small-package/luci-app-turboacc/shortcut-fe
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-rclone package/small-package/luci-app-rclone
#git clone https://github.com/bootli/luci-app-ddns-go.git package/ddns-go
# git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/ddns-scripts-dnspod package/small-package/luci-app-ddns/ddns-scripts-dnspod
# svn export --force https://github.com/kiddin9/openwrt-packages/trunk/luci-app-ddns package/small-package/luci-app-ddns
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/small-package/luci-app-jd-dailybonus
