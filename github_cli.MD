update github (quick guide for myself since I am lazy and forget)

pwd #see current directory

cd #change working directory

git init #initialize it

git status #check the status

git add -A #ready files to be added

git remote add origin https://github.com/randallhelms/examplerepo.git #add origin

git remote set-url origin https://github.com/randallhelms/examplerepo.git #set new remote origin

git pull origin master #pull data from remote repo

#if you get stuck in the vi editor, write i, then the merge message, then esc, then :wq

git commit -m "message" #commit and add a message

git push origin master #push the files to the remote repository

git push --force #force the push

