echo "Enter project name : "
read name

echo "Creating Vite app: $name"

npm create vite@latest $name -- --template vue --yes && wait

cd $name

echo "Installing  packages ..."

npm i && npm i tailwindcss axios

echo "don't forget to configure tailwind"

npm i -D prettier

touch .prettierrc .env tailwind.config.js
