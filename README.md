# Judy

I am a bot named Judy :rabit:

## Installation

### Requirement

* CentOS 7+
* ansible
* git

### Preparement

```sh
# Login your server for deployment
ssh deployment.example.com

# Define workspace
WORKSPACE=/tmp/workspace-$(date "+%Y%m%d%H%M%S")
cd $WORKSPACE

# Clone me
git clone https://github.com/mizoR/Judy.git $WORKSPACE
cd ./provisioning

# Run provisioning
ansible-playbook -i ./judy.inventry ./site.yml

# Clean up workspace
cd ~ && rm -rf $WORKSPACE
```

You can provision from local machine if above preparement is completed already.

```sh
cap production provision
```

## Deployment

```
cap deploy production
```

## vagrant

```sh
# Launch development VM
vagrant up --no-provision

# Run provisioning
vagrant provision

# Run test
bundle _1.10.6_ exec rake provisioning:spec
```
