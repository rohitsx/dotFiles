1# My Dotfiles

A clean, dark-themed, and keyboard-centric Linux desktop environment. This repository contains the personal configuration files for my setup, focusing on efficiency and aesthetics.

The core components are **i3-gaps** for window management, **Kitty** as the terminal, and a highly-customized **Neovim** setup for development.

![image](https://github.com/user-attachments/assets/f00c965a-7ed6-49c8-982b-18640e94a128)

## Table of Contents

- [Philosophy](#philosophy)
- [Software & Components](#software--components)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration Details](#configuration-details)
  - [i3 Window Manager](#i3-window-manager)
  - [Kitty Terminal](#kitty-terminal)
  - [Neovim](#neovim)
  - [Picom Compositor](#picom-compositor)
  - [Redshift](#redshift)
- [License](#license)

## Philosophy

- **Keyboard First**: Everything is optimized for keyboard-driven workflows to minimize reliance on the mouse
- **Minimalist Aesthetics**: A consistent dark theme (`#2a2a2e`) with rounded corners and subtle transparency provides a clean, distraction-free workspace
- **Fast & Lightweight**: Components are chosen for their performance and low resource usage
- **Modular**: Configurations are split into logical files (e.g., i3 keybindings, appearance) for easier management

## Software & Components

| Component       | Application         | Purpose                                        |
| --------------- | ------------------- | ---------------------------------------------- |
| Window Manager  | i3-gaps             | Tiling window manager                          |
| Terminal        | kitty               | Fast, feature-rich, GPU-accelerated terminal   |
| Editor          | neovim              | The one true editor, configured with Lua       |
| Compositor      | picom               | For transparency, shadows, and rounded corners |
| App Launcher    | dmenu               | Fast and minimal application launcher          |
| Status Bar      | i3bar with i3status | System information at a glance                 |
| Night Light     | redshift            | Adjusts screen color temperature               |
| Screenshot Tool | flameshot           | Powerful and intuitive screenshot utility      |
| Wallpaper       | feh                 | Sets the desktop background                    |
| Font            | FiraCode Nerd Font  | Provides essential icons and ligatures         |

## Prerequisites

Before installing, make sure you have the
