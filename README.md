# dev-container-dotnet

This is a template repository for creating new repositories that use the same directory structure and files as this one.

This environment, which uses a dev container, is intended to be used for .NET 6.0 development using VS Code.

## Prerequisites

Prerequisites (most recent stable version unless stated otherwise):
- VS Code
- Docker Desktop (MacOS, Windows) or docker engine (Linux)
- Remote development extension
- git client
- `devcontainer CLI`, follow instructions at https://code.visualstudio.com/docs/remote/devcontainer-cli

Occasionally, there is a issue with the `devcontainer CLI` when running in WSL. The command may not be available immediately after installation. If that is the case, restart WSL.

## Using this Repository

1. Use the button "Use this template" in the top-right corner of this page when shown at https://github.com/RimuTec/dev-container-dotnet. Or just clone this repository.
1. In a terminal, e.g., `bash`, and at the root of the cloned repo execute the following:
   ```bash
   devcontainer open .
   ```
   This will download docker images as needed, build docker images as needed, then start the dev container and launch VS Code which remotely connects to the dev container. The repository clone is mounted into the dev container at path `/src`.

The initial start may take several minutes if container base images need to be pulled first. Equally if you upgrade Docker Desktop (Windows, MacOS) or Docker Engine (Linux), the first startup after the upgrade may take several minutes as well. If the images are already available, startup should be less than 1 minute (about 10 seconds on my machine).

## Creating Solution and Projects

Before you start using the template but after you have cloned it, I'd recommend renaming all occurances of `fooservice` in this repository to something that is more meaningful in your context.

Use commands such as `dotnet new` to create the solution file and one or more project files.

## Updating Nuget Packages

The dev container comes with `dotnet-outdated` installed. It allows upgrading all or select nuget packages of solutions and projects. The tool also supports reporting on indirect dependencies (aka transitive dependencies).

For example, in a terminal execute this command:
```
dotnet-outdated
```
If it finds a solution or project file it will then list all nuget packages for which newer versions are available, grouped by project file.

For more information see https://github.com/dotnet-outdated/dotnet-outdated

## Version Information

This version of the repo is for .NET SDK version 6.0.201.

You can use a different version of the .NET SDK by choosing a different base image in file `Dockerfile`. For information about available base images, please see https://hub.docker.com/_/microsoft-dotnet-sdk/

If you change the base image for the dev container, you also need to adjust the target framework in your `*.csproj` files (or equivalent).

## Known Issues

### `devcontainer open .` does not work

If this happens it is typically observed on a Windows host using WSL2. Confirm that you have the correct version of devcontainer installed by running `devcontainer --help`. The output should list the `open` command as well:
```Shell
manfred@DESKTOP-RYZEN9:~/projects/rimutec/dev-container-dotnet$ devcontainer --help
devcontainer <command>

Commands:
  devcontainer open [path]   Open a dev container in VS Code
  devcontainer build [path]  Build a dev container image

Options:
  -h, --help               Show help  [boolean]
      --disable-telemetry  Disable telemetry  [boolean] [default: false]
```

If the command `open` is not listed, then try the following recipe:
1. Uninstall the current version of dotnet-outdated-tool
2. Follow the instructions at https://code.visualstudio.com/docs/remote/devcontainer-cli
3. If needed, restart WSL

### Omnisharp Reports Exceptions

Omnisharp currently packages a `Mono` runtime for cross-platform support. This can cause issues when Omnisharp loads other extensions such as Roslynator which depends on the .NET Core runtime in the environment.

Omnisharp can be configured to use the .NET Core runtime instead of the packaged `Mono` runtime. This repository has a file at `/src/.vscode/settings.json` with the following setting:
```json
{
   "omnisharp.useModernNet": true // use installed .NET runtime instead of packaged Mono which may cause issues with other extensions
}
```
