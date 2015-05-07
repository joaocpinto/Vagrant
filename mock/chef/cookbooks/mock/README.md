Mock Builder
========================

# Deploy and create build environment for mock with Vagrant and VirtualBox from boxed VM available on Dropbox

## Dependencies

- [Vagrant](https://www.vagrantup.com/)
- [ChefDK](https://downloads.chef.io/chef-dk/)

## Aditional references

- [Mock](https://fedoraproject.org/wiki/Mock?rd=Subprojects/Mock)



* download vm image and provision it

```
vagrant up
```

* enter the build environment

```
vagrant ssh
```

* change to build user

```
sudo su - mockbuilder
```


# Create SRPM for the package

* copy relevant sources to /home/mockbuilder/packages/XXX/SOURCES

* copy SPEC file to /home/mockbuilder/packages/XXX/SPEC

* generate the SRPM
```
rpmbuild -bs /home/mockbuilder/packages/XXX/SPECS/xxx.spec --nodeps
```


# build package from SRPM with mock


* mock -r <REPO RELEASE> <SRPM PATH>

```
mock -r epel-6-x86_64 rebuild /home/mockbuilder/packages/XXX/SRPMS/xxx.src.rpm
```
