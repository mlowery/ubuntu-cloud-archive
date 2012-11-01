Description
===========

1. Adds Ubuntu Cloud Archive key.
2. Adds Ubuntu Cloud Archive repository.
3. Runs apt-get update.

Requirements
============

This cookbook uses the apt cookbook from OpsCode.

Attributes
==========

package_component: The OpenStack release (by codename). For example, "folsom".

Usage
=====

recipe[ubuntu-cloud-archive]