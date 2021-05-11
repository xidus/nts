# Secure Shell (SSH)

## Documentation

https://www.ssh.com/academy/ssh/config

## Forwaring Methods

https://www.starkandwayne.com/blog/setting-up-an-ssh-tunnel-with-ssh-config/

### Testing your setup

Example: Using LocalForward in your `config` file:

```sshconfig
Host server
    LocalForward 8888 localhost:8880
```

From the server, you can serve a simple page in the following ways:

!!! Testing your setup

    ```sh
    python -m SimpleHTTPServer 8888
    ```
    
    or
    
    ```sh
    python3 -m http.server 8888
    ```
    
    and go to your local browser and check `localhost:8888`.

---

