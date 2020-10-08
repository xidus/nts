# Jupyter

## Working with virtual environments

### Register python interpreter in virtual environment

With the virtual environment enabled, install `ipykernel` and run the following:

```
python -m ipykernel install --user --name=name-of-your-project
```

Refreshing the browser windoew with a currently running jupyter session or just starting a new session up, you should now be able to see the new interpreter available to you.

See the modules help info on removing the configured interpreter. Or you can simply delete the directory containing the json file with the settings.

The above command install these settings in the user's home directory in the location of the local jupyter settings.

Without the `--user` flag, you need access to the global location of these settings, but the presented approach here, makes it much easier to work with (given that intepreters can be deleted easily without using `sudo`).
