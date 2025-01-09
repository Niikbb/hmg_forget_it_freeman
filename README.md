# Homigrad

> [!NOTE]
> This is a fork of [Harrison's Homigrad Servers version](https://github.com/harrisoniam/homigrad).
> It's tailored for personal use by me and my friends. Please don’t expect features or updates that cater to everyone.

## What is Homigrad?

Homigrad is a game mode inspired by Trouble in Terrorist Town (TTT) and Murder. It features a "realistic" health and movement system and offers several sub-modes, including Team Deathmatch (TDM), Deathmatch, and Hide and Seek.

## Installation

1. [Download the repository](https://github.com/JonnyBro/homigrad/archive/refs/heads/main.zip).
2. Extract the `homigrad-main` folder and place it in your server’s `addons` directory.
3. Ensure the game mode is set to `Homigrad` (use `+gamemode homigrad` for servers).

For epic gaming, a tickrate of **99-128** is recommended to improve controls when faking.

## TODO

- [ ] Move Homigrad's commands to ULX (i like ulx).
- [ ] Find and fix existing bugs (there are many to address).
- [ ] Replace `Sound()` with just strings (`Sound()` just returns the given string because `util.PrecacheSound()` is disabled/broken on purpose by the devs).

## Known Bugs

- [x] Bots don't have models in Homicide.

## Frequently Asked Questions

### What language is this version in?

The game currently includes a mix of English and localized content. Full localization is planned for English, Russian, and Ukrainian.

### Can I use Homigrad's movement/weapons in other game modes (Sandbox, TTT, etc)?

The movement system and weapons from Homigrad are not directly compatible with other game modes. However, if you're proficient, you might explore Harrison’s [movement-addon branch](https://github.com/harrisoniam/homigrad/tree/movement-addon).

### How can I customize this for my server?

You’re free to modify the files, adjust values, and tweak the code to suit your server’s needs.

### Can I create my own game mode using this codebase?

Yes! This project is under the MIT License, so you’re welcome to use it as a base. Contributions are also encouraged—feel free to submit pull requests here or on [Harrison's repository](https://github.com/harrisoniam/homigrad).

## Credits

- **Sadsalat, Useless, Mr. Point**: For creating the original Homigrad and making it open source. The original repository is available [here](https://github.com/sadsalat/Orignal-Homigrad).
- **Harrison's Servers**: For open-sourcing their version (I wasted 2 weeks of my NY holidays to fix workshop version (╯‵□′)╯︵┻━┻).
- **ChatGPT**: Rewriting my crappy attempt at READMEs.
