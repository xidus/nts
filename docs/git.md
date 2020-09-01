# Git

## Github

Based on [this site][clean-local-branches], I ended up doing the following:

* Locally, I pruned `remote origin`
  - Note that you can prune with the `--dry-run` argument.
* Locally, I deleted the branch
* The branch-deletion fails due to missing local merge (need elaboration), so I merged the branch to master, locally, as well.
* Then deletion went fine.

[clean-local-branches]: http://www.fizerkhan.com/blog/posts/Clean-up-your-local-branches-after-merge-and-delete-in-GitHub.html
