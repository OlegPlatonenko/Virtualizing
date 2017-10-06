git init - Start mamaging folder
git add - add file to git
git add -A - add all files to git
git commit -m "commit message" - commit
git config --global user.email "oleg.platonenko@outlook.com" - Add info
git config --global user.name "Oleg Platonenko" - - Add info
git log - list of commits
git diff - show difference between two files
.gitignore - file with git exclusions

PUSH REPOSITORY
1. Create new repository with same name on GitHub in the Internet
2. git remote add origin https://github.com/OlegPlatonenko/Virtualizing
3. git push -u origin master

PULL REPOSITORY
1. Create folder with the repository name
2. git remote add origin https://github.com/OlegPlatonenko/Virtualizing
3. git pull -u origin master

BRANCHING
git branch - return list of branches
git branch <branch name> - create new branch
git checkout <branch name> - swip to chosen branch