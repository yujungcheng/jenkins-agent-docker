## Run Jenkins and install ansible

Simple script to run Jenkins via docker-compose and install ansible into it.

Modify the compose file to fit your need and simply execute ./run.sh


## Test ansible inside jenkins
```sh
jenkins@4478b623772d:~/ansible$ pwd
/var/jenkins_home/ansible

jenkins@4478b623772d:~/ansible$ cat hosts
[all:vars]

ansible_connection = ssh

[test]
test ansible_host=192.168.1.15 ansible_user=jenkins ansible_private_key_file=/var/jenkins_home/.ssh/id_rsa


jenkins@4478b623772d:~/ansible$ ansible -i hosts -m ping test
[DEPRECATION WARNING]: Ansible will require Python 3.8 or newer on the controller starting with Ansible 2.12. Current version: 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0]. This feature will be removed from ansible-core in
version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
[WARNING]: Found both group and host with same name: test
[DEPRECATION WARNING]: Distribution Ubuntu 20.04 on host test should use /usr/bin/python3, but is using /usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible release will default to using the
discovered platform python for this host. See https://docs.ansible.com/ansible-core/2.11/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in version 2.12. Deprecation warnings can
 be disabled by setting deprecation_warnings=False in ansible.cfg.
test | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}

jenkins@4478b623772d:~/ansible$ cat main.yml
- hosts: test
  tasks:
    - shell: echo "$(date) $(hostname)"
    
jenkins@4478b623772d:~/ansible$ ansible-playbook -i hosts main.yml
[DEPRECATION WARNING]: Ansible will require Python 3.8 or newer on the controller starting with
Ansible 2.12. Current version: 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0]. This feature
will be removed from ansible-core in version 2.12. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
[WARNING]: Found both group and host with same name: test

PLAY [test] *************************************************************************************

TASK [Gathering Facts] **************************************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 20.04 on host test should use /usr/bin/python3, but
is using /usr/bin/python for backward compatibility with prior Ansible releases. A future
Ansible release will default to using the discovered platform python for this host. See
https://docs.ansible.com/ansible-core/2.11/reference_appendices/interpreter_discovery.html for
more information. This feature will be removed in version 2.12. Deprecation warnings can be
disabled by setting deprecation_warnings=False in ansible.cfg.
ok: [test]

TASK [shell] ************************************************************************************
changed: [test]

PLAY RECAP **************************************************************************************
test                       : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
