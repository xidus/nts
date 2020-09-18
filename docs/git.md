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

## Windows

### Git Bash: Change default start directory to avoid always having to navigate to desired directory

*   [How do I launch a Git Bash window with particular working directory using a script?](https://stackoverflow.com/questions/19916670/how-do-i-launch-a-git-bash-window-with-particular-working-directory-using-a-scri)

Method 1: Easiest way is to open properties for the short cut for Git Bash and change the directory in the field Start in.

Method 2: Open Explorer (Windows + E) and navigate to your directory. Then, right-click and select open location with Git Bash.

---

