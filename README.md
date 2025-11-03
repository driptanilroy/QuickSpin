# QuickSpin

QuickSpin automates the time-consuming process of setting up a new project with Vite, Tailwind, Axios, and Prettier — including basic Git setup and optional remote linking.

---

## Prerequisites

Make sure you have the following installed on your system:
- Node.js (v18 or higher recommended)
- npm (comes with Node.js) / (latest version)
- Git
- GitBash for Windows (Doesn't work with powershell) 

---

## How to Use

### 1. Create an empty folder
On your local machine, create a new empty folder where you want your project setup to happen.

Example:
```bash
mkdir myproject
cd myproject
````

---

### 2. Create an empty GitHub repository

Create a new repository on GitHub **without any files**, LICENSE, or README.
(Adding those files from GitHub can cause merge conflicts later.)
(You can later add them in GitHub)

You can name the repo the same as your local folder for convenience.

---

### 3. Download QuickSpin

Use `curl` to download the setup script directly into your folder:

```bash
curl -o quickspin.sh https://raw.githubusercontent.com/driptanilroy/QuickSpin/refs/heads/main/quickspin.sh
```

---

### 4. Run QuickSpin

Execute the script using either of the following commands:

```bash
source quickspin.sh
```

or

```bash
. quickspin.sh
```

---

### 5. Follow the prompts

QuickSpin will ask for:

* Project name
* Git initialization confirmation
* Commit message
* Optional remote repository setup (SSH or HTTPS)

Once confirmed, QuickSpin will automatically:

* Create a new Vite app (Vue template by default -- change it to any vite template in the .sh source file after you download)
* [ Common Vite Templates : vanilla / vanilla-ts | react / react-ts | vue / vue-ts | svelte / svelte-ts | solid / solid-ts | preact / preact-ts ]
* Install TailwindCSS, Axios, and Prettier(As a dev-dependency)
* Auto-generate `.env`, `.gitignore`, `.prettierrc`, and `tailwind.config.js`
* Link and push to your GitHub repository (if selected)

Manual Task : Configure Tailwind (will be automated later on)

Paste the following in `vite.config.json`

```javascript
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import tailwindcss from "@tailwindcss/vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue(), tailwindcss()],
});
```
Also `@import "tailwindcss";` in your source CSS file i.e. `src/style.css` or `src/index.css` or something like that!

---

### 6. Start your project

After setup completes, enter your project folder:

```bash
cd <your-project-name>
npm run dev
```

Your new project is now fully configured and ready to run.

---

## Notes

* If you use SSH for GitHub, make sure your SSH keys are configured. Or use HTTPS instead!
* GitHub requires the use of Personal Access Tokens (PATs) instead of your regular password for authenticating Git operations over HTTPS. You can generate PATs in your GitHub settings under `"settings" > "Developer settings" > "Personal access tokens".` (Not recommended might get 403 error for now. Will fix in future versions)
* The script automatically appends `.env` to `.gitignore`.
* Tailwind is installed but not configured manual configuration is required
* For now, Vue is the default framework template. To change open `quickspin.sh` and replace the `vue` after `--template` with required template at line 6
* Once you see and confirm the `npm list` (automatic) then you can safely remove the `quickspin.sh` and `.gitignore`
* Git is initialized at the parent folder to track multiple folder for future **backend** setup automation.
* If not required you can move the `.git` folder inside the project folder and `git add . && git commit -m "commit msg" && git push` and relax!

---

## Contributing

Contributions are welcome!

To contribute:

1. Fork the repository on GitHub
2. Clone your fork:

   ```bash
   git clone https://github.com/<your-username>/QuickSpin.git
   cd QuickSpin
   ```
3. Create a new branch for your feature:

   ```bash
   git checkout -b feature-name
   ```
4. Make your changes, test them, and commit:

   ```bash
   git add .
   git commit -m "Added [short description of change]"
   ```
5. Push your branch:

   ```bash
   git push origin feature-name
   ```
6. Open a Pull Request from your fork to the main repository.

---

## Purpose

QuickSpin aims to save developers from repetitive setup steps and create a ready-to-code environment in seconds.

To run directly without any steps:
```bash
curl -o quickspin.sh https://raw.githubusercontent.com/driptanilroy/QuickSpin/refs/heads/main/quickspin.sh && source quickspin.sh
```
