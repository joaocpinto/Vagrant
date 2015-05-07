Mock Builder
========================

Deploy and create build environment for mock with Vagrant and VirtualBox from boxed VM available on Dropbox

## Dependencies

- [Vagrant](https://www.vagrantup.com/)
- [ChefDK](https://downloads.chef.io/chef-dk/)

## Aditional references

- [Mock](https://fedoraproject.org/wiki/Mock?rd=Subprojects/Mock)



#### 1. download vm image and provision it

```
vagrant up
```

#### 2. enter the build environment

```
vagrant ssh
```

#### 3. change to build user

```
sudo su - mockbuilder
```


#### 4. Create SRPM for the package

* copy relevant sources to /home/mockbuilder/packages/XXX/SOURCES

* copy SPEC file to /home/mockbuilder/packages/XXX/SPEC

* generate the SRPM
```
rpmbuild -bs /home/mockbuilder/packages/XXX/SPECS/xxx.spec --nodeps
```


#### 5. build package from SRPM with mock

```
mock -r epel-6-x86_64 rebuild /home/mockbuilder/packages/XXX/SRPMS/xxx.src.rpm
```
