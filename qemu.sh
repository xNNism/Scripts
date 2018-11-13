#!/bin/bash
 
sudo qemu-system-x86_64 -machine type=pc,accel=kvm -enable-kvm -cpu host -smp cores=2 \
-m size=2G \
-vga std \
-k de \
-hda /dev/sd<X>
