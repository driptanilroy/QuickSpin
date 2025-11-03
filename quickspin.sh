echo "Enter project name : "
read name

echo "Creating Vite app: $name"

npm create vite@latest $name -- --template vue --yes --no-rolldown --no-immediate && wait

cd $name

echo "Installing  AXIOS | TAILWIND : "

npm i && npm i axios tailwindcss @tailwindcss/vite 

echo "DON'T FORGET TO CONFIGURE TAILWIND ! ^_^ !"

echo "Installing  DevDependencies : PRETTIER"

npm i -D prettier && wait

touch .prettierrc .env tailwind.config.js

#prepend in-folder .gitignore with .env
{
  echo "#environment variable file"
  echo ".env"
  cat .gitignore
} > .gitignore.tmp && mv .gitignore.tmp .gitignore

cd ..

touch .gitignore && echo "quickspin.sh" >> .gitignore

#git setup
read -p "GIT SETUP (y/n):" option

if [[ "$option" == "y" || "$option" == "Y" ]]; then
  #initialize git
  git init 
  #read inital commit msg
  read -p "INITIAL COMMIT MESSAGE : " message
  #git commit only if all files are staged
  git add . && git commit -m "$message"

  #add remote repository
  read -p "ADD REMOTE? (y/n) : " remote
  if [[ "$remote" == "y" || "$remote" == "Y" ]]; then
    while true; do
      read -p "ENTER YOUR GIT REPO URL (ssh/https) : " repo_url
      #check if SSH format
      if [[ "$repo_url" == git@* ]]; then
        echo "SSH detected. Checking SSH setup..."
      
        ssh -T git@github.com 2>/dev/null
        result=$?

      if [[ "$result" -eq 1 ]]; then
        echo "SUCCESS : SSH authentication available"
        break

      else
        echo "WARNING : SSH not configured. Access denied!!"
        echo "Options:"
        echo "1 - Configure SSH and try again!"
        echo "2 - Use HTTPS instead"
        read -p "Choose 1 or 2 or q(to quit check): " choice

        if [[ "$choice" == "2" ]]; then
          read -p "Enter HTTPS repo url : " repo_url
          break
        elif [[ "$choice" == "q" ]]; then
          break
        else
          echo "Please configure SSH and return"
        fi
      fi
      elif [[ "$repo_url" == https://* ]]; then
        echo "Using HTTPS ..."
        break
      else
        echo "Invalid URL format! Try again."
      fi
    done

    git remote add origin "$repo_url"

    read -p "ENTER BRANCH NAME (DEFAULT(press Enter) : main) : " branch

    branch=${branch:-main}

    git branch -M "$branch"

    git push -u origin "$branch"

    echo "CONGRATS SETUP DONE"

  else
    echo "REMOTE SETUP CANCELLED!"

  fi

else
  echo "GIT SETUP CANCELLED!"

fi
