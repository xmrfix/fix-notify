<div align="center">
  <img src="https://i.imgur.com/FbfjyVF.png" alt="MR-FIX Notify Banner" width="100%">

  <h1>🎯 MR-FIX Notification System</h1>
  <p><b>A modern, beautiful, and highly customizable notification system for FiveM.</b></p>
  
  [![QBCore Compatible](https://img.shields.io/badge/QBCore-Compatible-green.svg)](https://github.com/qbcore-framework)
  [![Standalone Compatible](https://img.shields.io/badge/Standalone-Compatible-blue.svg)](#)
  [![License](https://img.shields.io/badge/License-MIT-orange.svg)](#)

</div>

<br>

## 📖 About
**MR-FIX Notification System** is a next-generation notification UI built for modern FiveM Roleplay servers. Featuring buttery-smooth animations, a dedicated settings dashboard, and dynamic sound effects, it replaces the boring standard notifications with an interactive, premium experience.

Players can use the built-in configuration panel to adjust their notification positions, toggle dark/light mode, and mute sounds based on their personal preferences!

---

## ✨ Features

- **🎨 Beautiful UI/UX**: Clean, minimalist, and extremely professional design using Inter fonts.
- **⚙️ Player Dashboard**: Players can type `/notify` to open a sleek settings panel.
- **📍 Dynamic Positioning**: Support for 5 different on-screen positions (Top Right, Top Left, Top Center, Center Right, Center Left).
- **🌓 Theme Toggling**: Built-in Dark Mode and Light Mode, toggleable by the player.
- **🔊 Immersive Audio**: Procedural notification sounds (pings, error buzzes, etc.) generated via Web Audio API.
- **🚀 QBCore Ready**: Drops right into any QBCore server without hassle, while still being usable on Standalone setups.
- **⚡ Highly Optimized**: Zero 0.00ms idle resmon. Built with vanilla HTML/CSS/JS for ultra-fast load times.

---

## 📸 Previews

### ⚙️ The Settings Dashboard & Notification Types (Success, Error, Info, Warning)
<p align="center">
  <img src="https://i.imgur.com/dHLzW8G.gif" width="800" alt="Dashboard & Notification Previews">
</p>
---

## 🛠️ Installation

1. Download the latest release from the repository.
2. Extract the `fix-notify` folder into your FiveM `resources` directory.
3. Add `ensure fix-notify` to your `server.cfg`.

### Integrating with QBCore (Replacing Default Notify)

If you use QBCore, you can completely replace the default notification system. Open `qb-core/client/functions.lua`, find `QBCore.Functions.Notify`, and replace it with:

```lua
function QBCore.Functions.Notify(text, texttype, length)
    texttype = texttype or 'info'
    if texttype == 'primary' then texttype = 'info' end
    
    local title = texttype:gsub("^%l", string.upper)
    local message = text
    
    if type(text) == "table" then
        title = text.caption or title
        message = text.text or 'Notification'
    end

    exports['fix-notify']:SendNotification(texttype, title, message, length or 4000)
end
```

---

## 💻 Developer Usage (Exports)

If you are writing your own scripts and want to trigger a notification, you can use the client-side export:

```lua
-- types: 'success', 'error', 'info', 'warning'
-- syntax: exports['fix-notify']:SendNotification(type, title, message, duration)

exports['fix-notify']:SendNotification('success', 'Bank', 'You deposited $500.', 5000)
exports['fix-notify']:SendNotification('error', 'Lockpick', 'Your lockpick broke!', 4000)
```

---

## ⌨️ Player Commands

- `/notify` - Opens the interactive settings dashboard where players can adjust notification position, theme, and sounds.

---

## 📜 License

This project is licensed under the MIT License. You are free to modify and use it in your servers, but please leave credit where credit is due!
