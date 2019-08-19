# common
namespace merge
vm config disk /tmp/debian-buster.qcow2
vm config net 100

# v0
vm config schedule b
vm launch kvm v0
vm start v0

# v1
vm config schedule d
vm launch kvm v1
vm start v1

