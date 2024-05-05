# Omnisharp-Vim

## Prequisites

### Dotnet
TODO figure out what are base essentials
https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

### Plugin Manager
Install [vim-plug](https://github.com/junegunn/vim-plug?tab=readme-ov-file#installation): 
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Open Vim and install plugins:
`:PlugInstall`

When first opening a .cs files, omnisharp-vim will ask to install a server.
Choose yes
TODO: Read through install instructions. I'm probably missing something, like a
working dotnet install. I do have dotnet 7 main install. Which I suspect is not
good enough for the project I'm working on.
Though I would expect that to be more obvious in error messages.


TODO: Does this vary by linux, windows, WSL?
TODO: On linux I'm not getting any colors, or the appearance of any Omnisharp
functionality. Because TERM=alacritty, not xterm. Hmmm. Not sure if worth
documenting. I'v emade some changes. just document.
TODO: Document installing dotnet for different versions of SDK
TODO: Install and try Vimspector for debugging
TODO: Run down of functionality and what provides it.
TODO: Install coc.nvim (or something like it) for non-C# code, and keep it from
interfering with Omnisharp. I wonder if I have something dumb in my personal config
that is using coc/csharp_ls in parallel with Omnisharp.
TODO: Fugitive for my own sanity.
TODO: Are the mappings already defined as defaults based on prefix? Still worth including
for discoverability.

## Troubleshooting

### Could not load type of field (linux)
https://github.com/dotnet/vscode-csharp/issues/3537
`sudo apt install mono-complete`
```
 "~/aspire/src/Aspire.Hosting.Azure.CosmosDB/AzureCosmosDBResource.cs" 44L,
1746B
channel 0 buffered: 'System.TypeLoadException: Could not load type of field
''McMaster.Extensions.CommandLineUtils.CommandLineApplication:_validationErrorHandler''
(41) due to: Could not load file or assembly
''System.ComponentModel.DataAnnotations, Version=4.0.0.0, Culture=n
eutral, PublicKeyToken=31bf3856ad364e35'' or one of its dependencies.'
channel 0 buffered: '  at OmniSharp.Stdio.StdioCommandLineApplication..ctor ()
[0x00000] in <efc6b46535c34fd29bcc8225e8b906b9>:0 '
channel 0 buffered: '  at
OmniSharp.Stdio.Driver.Program+<>c__DisplayClass0_0.<Main>b__0 () [0x00006] in
<7129cfa88395469c9fe86ce0955b7903>:0 '
"~/.vim/plugged/omnisharp-vim/log/202404232125_1337828_omnisharp.log" 7L, 247B
```

### Could not locate MSBuild instance to register with OmniSharp.
https://github.com/OmniSharp/omnisharp-vim/issues/791
`let g:OmniSharp_server_use_net6 = 1`
Is this a linux only solution? They suggested this may become the default 2
years ago. Should this be part of the default install?

`channel 0 open: '<feff>Could not locate MSBuild instance to register with OmniSharp.`

### A compatible .NET SDK was not found.
I have 8.0.204
Not sure what I did but it just started working.
I tried with another setup that didn't have the requested SDK, and it still had
the same error with no installed SDKs listed.

```
channel 0 open: 'A compatible .NET SDK was not found.'
channel 0 open: ''
channel 0 open: 'Requested SDK version: 8.0.200'
channel 0 open: 'global.json file: /home/testing/aspire/global.json'
channel 0 open: ''
channel 0 open: 'Installed SDKs:'
channel 0 open: ''
channel 0 open: 'Install the [8.0.200] .NET SDK or update [/home/testing/aspire/global.json] to match an installed SDK.'
channel 0 open: ''
channel 0 open: 'Learn about SDK resolution:
```
