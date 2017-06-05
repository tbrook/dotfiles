#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


tb.mount() {
    mnt="$1"
    uuid="$2"
    opts="$3"
    fstype="$4"
    opt1=0
    opt2=2

    if [[ ! -e "$mnt" ]]; then
	sudo mkdir -p "$mnt"
    else
	echo "${mnt} は既に存在します" >&2
    fi

    if ! mountpoint -q "$mnt"; then
	if sudo mount -t "$fstype" -U "$uuid" -o "$opts" "$mnt"; then
	    printf "\n以下を /etc/fstab に追加して下さい\n" >&2
	    echo "# ${uuid}  ${mnt}  ${fstype}  ${opts}  ${opt1}  ${opt2}"
	else
	    echo "  error?UUID: ${uuid}" >&2
	fi
    else
	echo "${mnt} は既にマウントされています" >&2
    fi
}



# SSD
tb.mount \
    "/mnt/ssd1-data" \
    "865c48a5-5f3d-4bf0-917d-c7229e79a977" \
    "defaults,noatime" \
    "ext4"


# LVM
tb.mount \
    "/mnt/data" \
    "ab09b5a3-f239-4bc4-a52c-8e2987ab7418" \
    "defaults" \
    "ext4"
