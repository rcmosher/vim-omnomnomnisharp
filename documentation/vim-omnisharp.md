# Omnisharp-Vim

## Prequisites
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
TODO: Install dotnet
TODO: On linux I'm not getting any colors, or the appearance of any Omnisharp
functionality. Because TERM=alacritty, not xterm. Hmmm. Not sure if worth
documenting.
TODO: "~/aspire/src/Aspire.Hosting.Azure.CosmosDB/AzureCosmosDBResource.cs" 44L,
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

TODO: Document installing dotnet for different versions of SDK
