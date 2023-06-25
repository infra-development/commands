# Anaconda Python Distribution on Ubuntu

Download anaconda
```python{style=colorful}
ubuntu@ubuntu:~$ cd /tmp
ubuntu@ubuntu:~$ curl https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh --output anaconda.sh
```

Run script
```python{style=colorful}
ubuntu@ubuntu:~$ bash anaconda.sh
```

You’ll receive the following output
```python{style=colorful}
Output

Welcome to Anaconda3 2020.02

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>> 
```

Press `ENTER` to continue and then press `ENTER` to read through the license.

```python{style=colorful}
Output
Do you approve the license terms? [yes|no]
```

You can press `ENTER` to accept the default location, or specify a different location to modify it.

```python{style=colorful}
Output
Anaconda3 will now be installed into this location:
/home/ubuntu/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/ubuntu/anaconda3] >>> 
```

Once installation is complete, you’ll receive the following output

```python{style=colorful}
Output
...
Preparing transaction: done
Executing transaction: done
installation finished.
Do you wish the installer to initialize Anaconda3
by running conda init? [yes|no]
[no] >>> 
```

Type `yes` so that you can initialize Anaconda3.

```python{style=colorful}
Output
...
Thank you for installing Anaconda3!
...
```

You can now activate the installation by sourcing the 
`~/.bashrc` file

```python{style=colorful}
ubuntu@ubuntu:~$ source ~/.bashrc
```

Once you have done that, you’ll be placed into the default base programming environment of Anaconda, and your command prompt will change to be the following

```python{style=colorful}
(base) ubuntu@ubuntu:~$
```

You can further verify your install by making use of the conda command, for example with `list`

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda list
```

You’ll receive output of all the packages you have available through the Anaconda installation

```python{style=colorful}
Output
# packages in environment at /home/ubuntu/anaconda3:
#
# Name                    Version                   Build  Channel
_ipyw_jlab_nb_ext_conf    0.1.0                    py37_0  
_libgcc_mutex             0.1                        main  
alabaster                 0.7.12                   py37_0  
anaconda                  2020.02                  py37_0  
...
```

Now that Anaconda is installed, we can go on to setting up Anaconda environments.

# Setting Up Anaconda Environments

Anaconda virtual environments allow you to keep projects organized by Python versions and packages needed.<br>
First, we can check to see which versions of Python are available for us to use.

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda search "^python$"
```

Let’s create an environment using the most recent version of Python 3

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda create --name my_env python=3
```

You can activate your new environment by typing the following

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda activate my_env
```

With your environment activated, your command prompt prefix will reflect

```python{style=colorful}
(my_env) ubuntu@ubuntu:~$
```

Within the environment, you can verify that you’re using the version of Python that you had intended to use

```python{style=colorful}
(my_env) ubuntu@ubuntu:~$ python --version
```

```python{style=colorful}
Output
Python 3.8.2
```

Deactivate anaconda environment

```python{style=colorful}
(my_env) ubuntu@ubuntu:~$ conda deactivate
```

To target a more specific version of Python, you can pass a specific version to the python argument

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda create -n my_env35 python=3.5
```

You can inspect all of the environments

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda info --envs
```

```python{style=colorful}
Output
# conda environments:
#
base                  *  /home/ubuntu/anaconda3
my_env                   /home/ubuntu/anaconda3/envs/my_env
my_env35                 /home/ubuntu/anaconda3/envs/my_env35
```

The asterisk indicates the current active environment.

Add additional packages, such as `numpy`

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda install --name my_env35 numpy
```

If you know you would like a `numpy` environment upon creation, you can target it in your `conda create` command

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda create --name my_env python=3 numpy
```

You can remove environment

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda remove --name my_env35 --all
```

# Updating Conda

First update the `conda` utility

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda update conda
```

Once the update of conda is complete, you can update the Anaconda distribution

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda update anaconda
```

# Uninstalling Anaconda

You should start with the `anaconda-clean` module, which will remove configuration files for when you uninstall Anaconda

```python{style=colorful}
ubuntu@ubuntu:~$ conda install anaconda-clean
```

Run the following command

```python{style=colorful}
ubuntu@ubuntu:~$ anaconda-clean
```

This will also create a backup folder called `.anaconda_backup` in your home directory

```python{style=colorful}
Output
Backup directory: /home/ubuntu/.anaconda_backup/2020-05-06T024432
```

You can now remove your entire Anaconda directory

```python{style=colorful}
ubuntu@ubuntu:~$ rm -rf ~/anaconda3
```

you can remove the `PATH` line from your `.bashrc` file that Anaconda added

```python{style=colorful}
ubuntu@ubuntu:~$ vim ~/.bashrc
```

Then scroll down to the end of the file (if this is a recent install) or type CTRL + W to search for Anaconda. Delete or comment out this Anaconda block

```python{style=colorful}
...
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ubuntu/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ubuntu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ubuntu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ubuntu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```

# Additional Helpful commands

Check conda configuration

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda config --show
```
To deactivate the `base` conda environment by default without removing it, you can modify your conda configuration

```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda config --show | grep auto_activate_base
```
This will show output as

```python{style-colorful}
auto_activate_base: True
```

Set the `auto_activate_base` configuration to `False`, which ensures that the base environment is not automatically activated by default.


```python{style=colorful}
(base) ubuntu@ubuntu:~$ conda config --set auto_activate_base False
```

To see the change you need to restart the terminal or open new session

You can manually activate it using

```python{style=colorful}
ubuntu@ubuntu:~$ conda activate base
```

To install packages in active conda virtual environment use `conda install` command

```python{style=colorful}
(my_env) ubuntu@ubuntu:~$ conda install numpy
(my_env) ubuntu@ubuntu:~$ conda install numpy=1.2.3
```
You can install multiple packages at once

```python{style=colorful}
(my_env) ubuntu@ubuntu:~$ conda install numpy pandas matplotlib
```

If a package is not available in the Conda repository, you can use the pip command to install packages from the Python Package Index (PyPI) within the active conda environment

```python{style=colorful}
(my_env) ubuntu@ubuntu:~$ pip install numpy
```















