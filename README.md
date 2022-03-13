## Sublime text editor

Repository includes configuration parameters for [Sublime Text Editor](https://www.sublimetext.com)

### Installation process

#### Install ansible through PIP

```console
pip install --user ansible
```

#### Install Sublime Text Editor (ansible playbook)

```console
cd Sublime/ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -K -i inventory.yml playbook.yml
```
