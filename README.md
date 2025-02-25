# Dotfiles

This repository contains my dotfiles, which are configuration files for setting up my general development environment.

## Prerequisites

- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

## Installation

1. **Clone the Repository**:  
   Clone this repository to your local machine. It's recommended to fork the repository first if you plan to make personal modifications.

   ```bash
   git clone https://github.com/ikaromarlon/dotfiles.git
   ```

2. **Run the Installation Script**:  
   Navigate to the repository root and execute the installation script to set up the dotfiles.

   ```bash
   ./install.sh
   ```

   *Note: If you encounter any errors due to missing dependencies like Zsh, nvm, etc., resolve them and rerun the installation.*

## What the `install.sh` Script Does

The `./install.sh` script automates the setup of your dotfiles by:

- Installing necessary packages.
- Creating symbolic links from the files in this repository to their respective locations on your local machine, typically in your home directory.

This setup allows you to easily manage and update your configuration files. Any changes made locally can be committed and pushed to your remote repository to keep everything synchronized.

## Important Notes

- **Review Before Use**: Make sure to review the script and dotfiles to understand their specific actions. Remove or modify any parts that you do not need.
- **Customization**: Feel free to customize the dotfiles to suit your personal preferences and workflow.

## Troubleshooting

If you face any issues during installation, ensure that all prerequisites are installed and properly configured. Refer to the documentation of each tool for additional help.

---

By following these instructions, you can efficiently set up and manage your development environment using this dotfiles repository.