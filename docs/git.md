# Git


## Github

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


## Windows

### Git Bash: Change default start directory to avoid always having to navigate to desired directory

*   [How do I launch a Git Bash window with particular working directory using a script?](https://stackoverflow.com/questions/19916670/how-do-i-launch-a-git-bash-window-with-particular-working-directory-using-a-scri)

Method 1: Easiest way is to open properties for the short cut for Git Bash and change the directory in the field Start in.

Method 2: Open Explorer (Windows + E) and navigate to your directory. Then, right-click and select open location with Git Bash.

---


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

