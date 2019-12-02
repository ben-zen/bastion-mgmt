# Bastion MGMT
Manage your devices out of band, securely!

## Environment
This tool is intended for use on a _bastion machine_, which is a non-routing
gateway for managing devices on a secure network. From this machine, IPMI or
serial interfaces are accessible to users with the appropriate permissions, as
recorded in a LDAP directory, probably hosted on another computer.

## Background
Black Lodge Research, a hackerspace in Redmond, WA, needs a way to manage
devices on the network. This tool is intended for use on our network, but may be
useful to other groups in need of tools for handling OOB network management.