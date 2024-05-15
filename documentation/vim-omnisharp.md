# Omnisharp-Vim
TODO Document and provide examples for omnisharp configuration

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

### With coc, slow BufWritePre

[coc.nvim]: Slow "BufWritePre" handler detected s
[coc.nvim]:     at sk.on (/home/rmosher/vimfiles/plugged/coc.nvim/build/index.js:58:4295)
[coc.nvim]:     at bp.attach (/home/rmosher/vimfiles/plugged/coc.nvim/build/index.js:177:4856)
[coc.nvim]:     at processTicksAndRejections (node:internal/process/task_queues:96:5)
[coc.nvim]:     at async vR.init (/home/rmosher/vimfiles/plugged/coc.nvim/build/index.js:198:621)
[coc.nvim]:     at async _b.init (/home/rmosher/vimfiles/plugged/coc.nvim/build/index.js:281:45514)

### WSL Package Resolver Exception
Use `let g:OmniSharp_translate_cygwin_wsl = 1`

[fail]: OmniSharp.MSBuild.ProjectLoader
        The "ResolvePackageAssets" task failed unexpectedly.
NuGet.Packaging.Core.PackagingException: Unable to find fallback package folder 'C:\Program Files\dotnet\sdk\NuGetFallbackFolder'.
   at NuGet.Packaging.FallbackPackagePathResolver..ctor(String userPackageFolder, IEnumerable`1 fallbackPackageFolders)
   at Microsoft.NET.Build.Tasks.NuGetPackageResolver.CreateResolver(IEnumerable`1 packageFolders)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.CacheWriter..ctor(ResolvePackageAssets task)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.CacheReader.CreateReaderFromDisk(ResolvePackageAssets task, Byte[] settingsHash)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.CacheReader..ctor(ResolvePackageAssets task)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.ReadItemGroups()
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.ExecuteCore()
   at Microsoft.NET.Build.Tasks.TaskBase.Execute()
   at Microsoft.Build.BackEnd.TaskExecutionHost.Microsoft.Build.BackEnd.ITaskExecutionHost.Execute()
   at Microsoft.Build.BackEnd.TaskBuilder.ExecuteInstantiatedTask(ITaskExecutionHost taskExecutionHost, TaskLoggingContext taskLoggingContext, TaskHost taskHost, ItemBucket bucket, TaskExecutionMode howToExecuteTask)

[warn]: OmniSharp.MSBuild.ProjectManager
        Failed to load project file '/mnt/c/Development/Thycotic/Enza/Thycotic.Enza/src/Thycotic.Enza.Web/Thycotic.Enza.Web.csproj'.
/mnt/c/Development/src/x.csproj
/home/user/.dotnet/sdk/8.0.204/Sdks/Microsoft.NET.Sdk/targets/Microsoft.PackageDependencyResolution.targets(266,5): Error: The "ResolvePackageAssets" task failed unexpectedly.
NuGet.Packaging.Core.PackagingException: Unable to find fallback package folder 'C:\Program Files\dotnet\sdk\NuGetFallbackFolder'.
   at NuGet.Packaging.FallbackPackagePathResolver..ctor(String userPackageFolder, IEnumerable`1 fallbackPackageFolders)
   at Microsoft.NET.Build.Tasks.NuGetPackageResolver.CreateResolver(IEnumerable`1 packageFolders)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.CacheWriter..ctor(ResolvePackageAssets task)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.CacheReader.CreateReaderFromDisk(ResolvePackageAssets task, Byte[] settingsHash)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.CacheReader..ctor(ResolvePackageAssets task)
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.ReadItemGroups()
   at Microsoft.NET.Build.Tasks.ResolvePackageAssets.ExecuteCore()
   at Microsoft.NET.Build.Tasks.TaskBase.Execute()
   at Microsoft.Build.BackEnd.TaskExecutionHost.Microsoft.Build.BackEnd.ITaskExecutionHost.Execute()
   at Microsoft.Build.BackEnd.TaskBuilder.ExecuteInstantiatedTask(ITaskExecutionHost taskExecutionHost, TaskLoggingContext taskLoggingContext, TaskHost taskHost, ItemBucket bucket, TaskExecutionMode howToExecuteTask)

### WSl Auto install fails to run
Did a manual install and pointed to that.
`let g:OmniSharp_server_path = '...'`

### ALE jumping to error goes to line after

### FZF escape is not quitting out of the pop-up the 1st time.
Seems to be a long timeout

https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577

### Attributes trying to add attribute to completion

### Completion plug in params, type params, without easy override

### Messages Disappers
OmniSharp can preview type information. By default this shows in the status line, which can hide other important messages. Show in a pop-up with:
`let g:OmniSharp_typeLookupInPreview = 1`

However, this will frequently show an empty pop-up TODO

Comment out this line if you have it to stop automatically showing:
`autocmd CursorHold *.cs OmniSharpTypeLookup`

### Showing information at bottom, but gets erased almost immediately
