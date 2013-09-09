# git setup

## Creating a repository and a branch

- Create a new repository on your git server.
- Pull the new directory in the directory where you put the source code you're working on:
      ale:~/docs/src/ git@github.com:aoloe/qtsubdir.git
- Even if your repository is still empty, start with the good habits and create a new branch before starting working on a new task. Our branch will be called "initialize_project":
      $ git checkout -b initialize_project
  The command `git branch` will show your newly created branch as the active one:
      $ git branch
        master
      * initialize_project
  Finally, connect the local branch with a new branch on your server:
      $ git push -u origin initialize_project
  In the future, you can just do `git pull` and `git push` to syncronize your work with the server.
- Each time you do some changes, it's a good idea to do a local commit to track your work:
      $ git commit -a -m "create the main widget"
  The changes will only get pushed to the server -- and will be visible to other people -- when you do:
      $ git push

## Managing your branch

- merge the branch into the master:
      $ git checkout master
      $ git merge initialize_project
- merge and solve conflicts
- clean up the commits list by merging commits
