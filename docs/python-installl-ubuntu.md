# Install Python on Ubuntu

Update local package index

```python
sudo apt update
```

Then upgrade the packages installed

```python
sudo apt -y upgrade
```

To manage software packages for Python, install pip

```python
sudo apt install -y python3-pip
```

There are a few more packages and development tools to install to ensure that we have a robust setup for our programming environment

```python
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
```
---

## Setting up Virtual Environment
---

Use the `venv` module, which is part of the standard Python 3 library

```python
sudo apt install -y python3-venv
```
We are ready to create environments

```python
mkdir environments
```
```python
cd environments
```
create an environment by running the following command

```python
python3 -m venv my_env
```

Essentially, `pyvenv` sets up a new directory that contains a few items which we can view with the `ls` command:

```python
ls my_env
bin include lib lib64 pyvenv.cfg share
```
To use this environment, you need to activate it
```python
source my_env/bin/activate
```
To leave the environment, type the command `deactivate` and you will return to your original directory.

To list all the installed packages in pip use command
```python
pip list
```