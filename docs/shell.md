
```sh
#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install \
  zsh \
  git \
  curl \
  man \
  watch \
  tree \

chsh –s /bin/zsh
```

*   Log out
*   Log in
*   ZSH prompts: type 1, 2, 1, 0

Oh My ZSH:

*   Copy install command from https://ohmyz.sh/ (used below)

Install:

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
