<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script> <script>mermaid.initialize({startOnLoad:true});</script>

# Git

## Configuration files

## Global and local Git-configuration files

### Content

### Location

Windows

## SSH keys and configuration file

Linux/BSD

* `~/.ssh/`

Windows

TBW

## Repository files

* `.gitignore`
* `.gitkeep`
* `.gitattributes`

## Github

### GitHub-specific configuration files

Templates and general

* `.github/`

GitHub Actions-configuration files

* `.github/workflows/`


### Clean up branches locally after pull-request merge on GitHub

Based on [this site][clean-local-branches], I ended up doing the following:

* Locally, I pruned `remote origin`
  - `git remote prune origin`
  - Note that you can prune with the `--dry-run` argument.
* Locally, I deleted the branch
* The branch-deletion fails due to missing local merge (need elaboration), so I merged the branch to master, locally, as well.
* Then deletion went fine.

[clean-local-branches]: http://www.fizerkhan.com/blog/posts/Clean-up-your-local-branches-after-merge-and-delete-in-GitHub.html


### [How do I update a GitHub forked repository?](https://stackoverflow.com/questions/7244321/how-do-i-update-a-github-forked-repository)

> In your local clone of your forked repository, you can add the original GitHub repository as a "remote". ("Remotes" are like nicknames for the URLs of repositories - origin is one, for example.) Then you can fetch all the branches from that upstream repository, and rebase your work to continue working on the upstream version. In terms of commands that might look like:

> ```sh
> # Add the remote, call it "upstream":
> git remote add upstream https://github.com/whoever/whatever.git
> # Fetch all the branches of that remote into remote-tracking branches,
> # such as upstream/master:
> git fetch upstream
> # Make sure that you're on your master branch:
> git checkout master
> # Rewrite your master branch so that any commits of yours that
> # aren't already in upstream/master are replayed on top of that
> # other branch:
> git rebase upstream/master
> ```
> 
> If you don't want to rewrite the history of your master branch, (for example because other people may have cloned it) then you should replace the last command with git merge upstream/master. However, for making further pull requests that are as clean as possible, it's probably better to rebase.
> 
> If you've rebased your branch onto upstream/master you may need to force the push in order to push it to your own forked repository on GitHub. You'd do that with:
> 
> ```sh
> git push -f origin master
> ```
> 
> You only need to use the -f the first time after you've rebased.

### GitHub changing master branch to main

These steps are from https://stevenmortimer.com/5-steps-to-change-github-default-branch-from-master-to-main/

```sh
# Step 1 
# create main branch locally, taking the history from master
git branch -m master main

# Step 2 
# push the new local main branch to the remote repo (GitHub) 
git push -u origin main

# Step 3
# switch the current HEAD to the main branch
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main

# Step 4
# change the default branch on GitHub to main
# https://docs.github.com/en/github/administering-a-repository/setting-the-default-branch

# Step 5
# delete the master branch on the remote
git push origin --delete master
```

Other material:

* https://www.techrepublic.com/article/github-to-replace-master-with-main-starting-in-october-what-developers-need-to-know/


## Windows

### Git Bash: Change default start directory to avoid always having to navigate to desired directory

*   [How do I launch a Git Bash window with particular working directory using a script?](https://stackoverflow.com/questions/19916670/how-do-i-launch-a-git-bash-window-with-particular-working-directory-using-a-scri)

Method 1: Easiest way is to open properties for the short cut for Git Bash and change the directory in the field Start in.

Method 2: Open Explorer (Windows + E) and navigate to your directory. Then, right-click and select open location with Git Bash.

---

### [How to create file execute mode permissions in Git on Windows?](https://stackoverflow.com/questions/21691202/how-to-create-file-execute-mode-permissions-in-git-on-windows#21694391)

From [the following answer](https://stackoverflow.com/a/38285462), I got this simple solution:

> ```
> git add --chmod=+x -- afile
> git commit -m"Executable!"
> ```

## Workflow

### Automatically update all local repositories

I have written [the following script](assets/git-pull-all.sh) that I keep in the directory of git repositories that I use for work.

```bash
#!/bin/bash
for dir in ./*/
do
    dir=${dir%*/}
    echo ${dir##*/}
    cd ${dir}
    git pull
    cd -
done
```

The script simply loops over all the directories (assumed to be git repositories) and runs `git pull` inside each of them.

Use case: When at work, I often change source files locally or centrally (github enterprise), which means that I do not always have the updated version of the locally activated branches that I have on my work computer. In this case, there is usually no danger involved in automating an update of each repository.

I found [this simple solution on stack overflow](https://stackoverflow.com/questions/2107945/how-to-loop-over-directories-in-linux#2108296), it only took about two minutes to create a script that does exactly this for me.


### Semantic commit messages

> ```
> chore: add Oyster build script
> docs: explain hat wobble
> feat: add beta sequence
> fix: remove broken confirmation message
> refactor: share logic between 4d3d3d3 and flarhgunnstow
> style: convert tabs to spaces
> test: ensure Tayne retains clothing
> ```
> 
> -- Source: https://seesparkbox.com/foundry/semantic_commit_messages

### Stash

https://stackoverflow.com/questions/89332/how-to-recover-a-dropped-stash-in-git#91795

---

### Undo last commit

`git reset HEAD~1`


### Untrack file without deleting it.

From: https://stackoverflow.com/a/1143800

> When --cached is given, the staged content has to match either the tip of the branch or the file on disk, allowing the file to be removed from just the index.
> 
> So, for a single file:
> 
>     git rm --cached mylogfile.log
> 
> and for a single directory:
> 
>     git rm --cached -r mydirectory
> 
> 

---

### Squash commits

From: https://stackoverflow.com/a/5309051

>     git checkout master
>     git merge --squash bugfix
>     git commit

> [Comment][] If you want to keep references to the old commit messages you can write git commit (without -m param) and you will get to modify a drafted commit message containing all commit messages that you squashed.

[Comment]: https://stackoverflow.com/questions/5308816/how-to-use-git-merge-squash#comment26548055_5309051

---

### Working with git as root / admin user

These are some ideas that I have tried out previously. They do not feel right, but they work.

Admin user is a user on the host with root privileges using `sudo`.

As admin user on the server:

* Add info to admin user `~/.gitconfig`
* Add info to root user `/root/.gitconfig`

  ```gitconfig
  (...)
  [user]
      name = Any admin user
      email = actual email of maintainer.
      username = root@server
  (...)
  ```

* Add info to repo's config file `.git/config`

  Details of repo's config file for use with this setup:

  ```sshconfig
  (...)
  [core]
      repositoryformatversion = 0
      filemode = true
      bare = false
      logallrefupdates = true
      sshCommand = ssh -i ~/.ssh/[SSHKEY] -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
  (...)
  ```

* Add SSH key (GH deploy key) to `/root/.ssh`
* Add this key to repository's deploy keys on GH.

* On the server, all write operations, including git push and git pull must be run with sudo.

### MermaidJS


<div class="mermaid">
    graph LR
    A[system] -->|extracted| B(program.py)
    B -->|Step 1| C(search)
    C -->|Raw HTML| D[`cmd1`]
    B -->|Step 2| E(get)
    E -->|Raw| F[`cmd2`]
    B -->|Step 3| G(transform)
    G -->|format| H[`cmd3`]
</div>

---

### Line-feed (LF), carriage-return (CR) and `.gitattributes` versus `core.autocrlf = true`

* https://stackoverflow.com/questions/5834014/lf-will-be-replaced-by-crlf-in-git-what-is-that-and-is-it-important#5834094
* https://stackoverflow.com/a/31747915
* https://stackoverflow.com/questions/57960566/how-to-force-consistent-line-endings-in-git-commits-with-cross-platform-compatib/59644154#59644154
* https://docs.github.com/en/free-pro-team@latest/github/using-git/configuring-git-to-handle-line-endings#per-repository-settings

---

### Other

*   https://stackoverflow.com/questions/12481639/remove-files-from-git-commit/15321456#15321456
*   https://stackoverflow.com/questions/307828/how-do-you-fix-a-bad-merge-and-replay-your-good-commits-onto-a-fixed-merge
