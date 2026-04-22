#!/bin/bash

echo "Отключаем модули KVM"
sudo modprobe -r kvm_intel kvm
echo "Отключили"
lsmod | grep kvm
