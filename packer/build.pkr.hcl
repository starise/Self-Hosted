# A build block invokes sources and runs provisioning steps on them.
# https://www.packer.io/docs/from-1.5/blocks/build
build {
    sources = ["source.arm.provisioner"]

    provisioner "shell" {
        inline = [
            "pacman-key --init",
            "pacman-key --populate archlinuxarm",
            "mv /etc/resolv.conf /etc/resolv.conf.bk",
            "echo 'nameserver 1.1.1.1' > /etc/resolv.conf",
            "echo 'nameserver 8.8.8.8' >> /etc/resolv.conf",
            "pacman -Sy --noconfirm --needed",
            "pacman -S parted --noconfirm --needed"
        ]
    }
    # Upload scripts/resizerootfs to /tmp
    provisioner "file" {
        destination = "/tmp"
        source      = "scripts/resizerootfs"
    }
    # Set up rootfs resize for first boot
    provisioner "shell" {
        script = "scripts/bootstrap_resizerootfs.sh"
    }
    # Set server timezone
    provisioner "shell" {
        inline = ["ln -sf /usr/share/zoneinfo/${var.timezone} /etc/localtime"]
    }
}
