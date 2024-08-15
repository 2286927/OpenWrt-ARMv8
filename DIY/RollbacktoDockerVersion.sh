#!/bin/bash

# docker回滚25.0.6版本
sed -i 's/PKG_VERSION:=\([0-9]\+\.[0-9]\+\.[0-9]\+\)/PKG_VERSION:=25.0.6/g' feeds/packages/utils/docker/Makefile
sed -i 's/^\(PKG_HASH:=\)\([a-fA-F0-9]\{64\}\)/PKG_HASH:=c19640df369eec3a485158d7851fe647a1403009b11361c50a9ec4c58742c3c0/g' feeds/packages/utils/docker/Makefile
sed -i 's/PKG_GIT_SHORT_COMMIT:=\([[:alnum:]]\+\)/PKG_GIT_SHORT_COMMIT:=32b99dd/g' feeds/packages/utils/docker/Makefile

# dockerd回滚25.0.6版本or去版本验证
sed -i 's/PKG_VERSION:=\([0-9]\+\.[0-9]\+\.[0-9]\+\)/PKG_VERSION:=25.0.6/g' feeds/packages/utils/dockerd/Makefile
sed -i 's/^\(PKG_HASH:=\)\([a-fA-F0-9]\{64\}\)/PKG_HASH:=c06bfd5dc561b3d105488d9641ce5f8c7024130616ba393e61b2af47b5177658/g' feeds/packages/utils/dockerd/Makefile
sed -i 's/PKG_GIT_SHORT_COMMIT:=\([[:alnum:]]\+\)/PKG_GIT_SHORT_COMMIT:=b08a51f/g' feeds/packages/utils/dockerd/Makefile
#sed -i 's/^\s*$[(]call\sEnsureVendoredVersion/#&/' feeds/packages/utils/dockerd/Makefile

# containerd Has验证
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=skip/g' feeds/packages/utils/containerd/Makefile
sed -i 's/PKG_VERSION:=\([0-9]\+\.[0-9]\+\.[0-9]\+\)/PKG_VERSION:=1.7.20/g' feeds/packages/utils/containerd/Makefile
sed -i 's/^\(PKG_HASH:=\)\([a-fA-F0-9]\{64\}\)/PKG_HASH:=c4268561e514a2e8322bc8cdd39113d5e164fb31c2cef76f479d683395ea9bd6/g' feeds/packages/utils/containerd/Makefile

# runc回滚1.1.12
sed -i 's/PKG_VERSION:=\([0-9]\+\.[0-9]\+\.[0-9]\+\)/PKG_VERSION:=1.1.12/g' feeds/packages/utils/runc/Makefile
sed -i 's/^\(PKG_HASH:=\)\([a-fA-F0-9]\{64\}\)/PKG_HASH:=be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208/g' feeds/packages/utils/runc/Makefile
