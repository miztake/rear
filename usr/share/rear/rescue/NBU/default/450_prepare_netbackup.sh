# 450_prepare_netbackup.sh
# prepare environment for NBU (only if NBU version >=7.x)

[ -f /usr/openv/netbackup/bin/version ] && \
	NBU_version=$(grep -i netbackup /usr/openv/netbackup/bin/version | awk '{print $2}' | cut -d'.' -f1) || \
	NBU_version=0

[[ $NBU_version -lt 7 ]] && return	# NBU is using xinetd when version <7.x

if [ -e "/etc/init.d/netbackup" ]; then
	cp $v /etc/init.d/netbackup $ROOTFS_DIR/etc/scripts/system-setup.d/netbackup.real
	chmod $v +x $ROOTFS_DIR/etc/scripts/system-setup.d/netbackup.real
	echo "( /etc/scripts/system-setup.d/netbackup.real )" > $ROOTFS_DIR/etc/scripts/system-setup.d/90-netbackup.sh
	chmod $v +x $ROOTFS_DIR/etc/scripts/system-setup.d/90-netbackup.sh
fi
