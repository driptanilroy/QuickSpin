# QuickSpin

QuickSpin automates the time-consuming process of setting up a new project with Vite, Tailwind, Axios, and Prettier — including basic Git setup and optional remote linking.

---

## Prerequisites

Make sure you have the following installed on your system:
- Node.js (v18 or higher recommended)
- npm (comes with Node.js)
- Git

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

Create a new repository on GitHub **without any files**, license, or README.
(Adding those files from GitHub can cause merge conflicts later.)

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

* Create a new Vite app (Vue template by default)
* Install and configure TailwindCSS, Axios, and Prettier
* Auto-generate `.env`, `.gitignore`, `.prettierrc`, and `tailwind.config.js`
* Link and push to your GitHub repository (if selected)

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

* If you use SSH for GitHub, make sure your SSH keys are configured.
* The script automatically appends `.env` to `.gitignore`.
* For now, Vue is the default framework template.
* Tailwind is preconfigured automatically (no manual setup required).

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

```
```
