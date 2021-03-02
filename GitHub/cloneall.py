from github import Github
from git import Repo
import os

#access token
g = Github("<Github Token>")

# Then play with your Github objects:
for repo in g.get_user().get_repos():
    pathToGitDir="./"+ repo.name    
    os.mkdir(pathToGitDir)
    Repo.clone_from("git@github.com:<USERNAME>/"+repo.name+".git", pathToGitDir)
