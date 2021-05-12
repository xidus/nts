# Jupyter

[Official Jupyter Lab online documentation](https://jupyterlab.readthedocs.io/en/stable/index.html)

## Working with virtual environments

### Register python interpreter in virtual environment

With the virtual environment (`venv` or `conda`) activated, install `ipykernel` and run the following:

```
python -m ipykernel install --user --name=name-of-your-project
```

Refreshing the browser window with a currently running jupyter session or just starting a new session up, you should now be able to see the new interpreter available to you.

See the modules help info on removing the configured interpreter. Or you can simply delete the directory containing the json file with the settings.

The above command install these settings in the user's home directory in the location of the local jupyter settings.

Without the `--user` flag, you need access to the global location of these settings, but the presented approach here, makes it much easier to work with (given that intepreters can be deleted easily without using `sudo`).

---

## Settings

```
# Generate the default configuration file for Jupyter Lab
# This creates the file ~/.jupyter/jupyter_lab_config.py
jupyter lab --generate-config

# If editing with nano, you can get line numbers shown using `-c` in the command
nano -c ~/.jupyter/jupyter_lab_config.py

# With nothing set, I search the configuration for the settings I need like so
# With `grep`, I use `-n` to show what line numbers I need to browse go to, and `-i` to make the search case-insensitive.

# Where can I set the token to an empty string, so that I do not need to copy and paste from the server?
cat ~/.jupyter/jupyter_lab_config.py | grep -in token

# See which line, I need to go to in order to fix the default notebook_dir
cat ~/.jupyter/jupyter_lab_config.py | grep -in notebook_dir

# See lines in config file that are set (i.e. not commented out)
cat ~/.jupyter/jupyter_lab_config.py | grep -in ^c\.
# As of writing the above command gives me something like this: 
# 683:c.ServerApp.notebook_dir = '/home/[USERNAME]/'
# 786:c.ServerApp.token = ''
# which is what I needed in this case.
```
