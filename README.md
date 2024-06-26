# vim-omnomnomnisharp
Exploration and documentation of a reliable C# editing setup in Vim/NeoVim

* IDEs
  * [Visual Studio](documentation/visual-studio.md)
  * [VSCode](documentation/vscode.md)
* True Vim
  * Vim with OmniSharp
  * Neovim with csharp_ls
  * Neovim with OmniSharp
  * Neovim with Roslyn (C# Dev Kit)
* Environments
  * Linux
  * Windows
  * WSL
  * Mac

## Motivation
Vim offers a beatiful editing experience. My current work requires I code in C#. Naturally I want to do that in Vim. Working on large code bases with such a feature filled language greatly benefits from tools like code completion, error detection, easily accessible documentaiton, etc. There are a number of options to provide these with a Vim or a Vim-like experience:

* VsCode with Vim extension
* Visual Studio with Vim extension
* Emacs with Evil
* Vim with Omnisharp
* NeoVim with csharp_ls, Omnisharp, or Roslyn (C# Dev Kit)

Working wirh the VS editors is great in that you naturally get all the tools for C# they provide. But their [Vim experience](#the-vim-experience) is subpar. Crucial features, like `:normal` are missing. There are bugs taht can corrupt your whole file. Plus, all the default editor shortcuts are overridden and it can be difficult to find what shortcuts you should be using for things that aren't defined in Vim and aren't documented for the IDE as they've been overriden. I don't have much experience with Emacs use of LSPs and the like, but Evil differs from Vim in enough ways that it is frustrating to have to relearn things. Plus, like the IDEs, it is a much slower experience.

For Vim and NeoVim there are a plethora of options. Yet they provide their own difficults. I've used [omnisharp-vim](https://github.com/OmniSharp/Omnisharp-vim) but it is difficult to configure and has the tendency to start spitting out a block errors every edit after a long session. NeoVim with csharp_ls is good, but often indicates there are errors where there are none and seems to struggle with larger projects. NeoVim with OmniSharp can also work well, but is difficult to get right. It takes a few minutes before it starts working and it fills up LpsLog with errors that may point to headaches down the road. Roslyn (C# Dev Kit) is still in the works. There are current solutions, but they aren't well documented on how to get them working. Ideally it will eventually become another LSP that can be dropped in like csharp_ls without much thought.

On top of this, setup varies quite a bit by environment. What works on Linux may not work on Windows or WSL. Especially when you consider suplimentary tools like fzf and rg. Plus getting the dotnet install right can prove difficult. Managing these prerequisites to a good experience can be troublesome.

But there is hope. I had a good experience with [LazyVim](https://github.com/LazyVim/LazyVim)'s Omnisharp extra. But LazyVim is very opiniated overriding often used standard Vim keybindings, not to mention its host of keymaps for tools that you may not like. And it adds so many plugins the experience can be quite slow.

## Goal
Our goal is to provide documentation to help you get over these hurdles. Can we get you to a good C# development experience regardless of your environment . And beyond that, to provide minimum configurations to get a good experience that can be dropped in and tested. Though these will start as attempts at a good configuration with notes.

## The Vim Experience
Some of the options just don't cut it because they don't provide the full Vim experience. But what is the Vim experience. Some aspects are objective, like missing the `:normal` command, or overriding standard keymaps out of the box. Things that will trip up experienced Vim users and make headaches for people trying to switch to Vim/NeoVim from an IDE with an extension. Other things are a little more subjective, like how you move around tabs and frames within an application. Or having to switch your brain out of Vim mode to use version control instead of having a [well crafted plugin](https://github.com/tpope/vim-fugitive) that keeps the Vim paradigm. Some things aren't even part of Vim itself, like being able to use tmux to quickly jump between different sessions that group projects. Or having easy access to standard Unix commands. Really we're talking about anything that deviates from the Vim philosphy or basic expectations of long time vim users.

### What is base line functionality
Baseline functionality ends up being quite a bit when dealing with LSPs. It will take more than just the plug-in for the language to get there so it may seem a little on the heavy side, but here's what we expect to provide in our examples.

* Improved Syntax highlighting
* Flagging errors
* Code actions to fix errors
* Jump to definition, implementation, uses, including definitions in nugets

Other essentials:
* Plug in management
* [vim-sensible](https://github.com/tpope/vim-sensible) in case some decides this is enough to get them buy

Maybe:
* Finding files by name, by matching contents. A maybe as this is generically solved and not specific to C# in Vim. Though it's fairly essential and I found to be a pain in Windows which C# is likely to have more developers using.
