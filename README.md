# dev-container-dotnet

This is a template repository for creating new repositories that use the same directory structure and files as this one.

This environment, which uses a dev container, is intended to be used for .NET 6.0 development using VS Code.

## Prerequisites

Prerequisites (most recent stable version unless stated otherwise):
- VS Code
- Docker Desktop (MacOS, Windows) or docker engine (Linux)
- Remote development extension
- git client

## Using this Repository

1. Use the button "Use this template" in the top-right corner of this page when shown at https://github.com/RimuTec/dev-container-dotnet. Or just clone or fork this repository.
1. In a terminal, e.g., `bash`, and at the root of the cloned repo execute the following:
   ```bash
   code .
   ```
1. At this point you may want to review the port numbers and service name(s) specified in `docker-compose.yml` and apply appropriate changes if required. Typically you will need to make changes when you have used this template for more than one repository, possibly even at first use.
1. Use Ctrl+Shift+P to open command palette then enter or select `remote-containers: reopen in dev container`. This will build the dev container and download docker images as needed, then start the dev container and launch VS Code which remotely connects to the dev container. The repository clone is mounted into the dev container at path `/work`.

The initial start may take several minutes if container base images need to be pulled first. Equally if you upgrade Docker Desktop (Windows, MacOS) or Docker Engine (Linux), the first startup after the upgrade may take several minutes as well. If the images are already available, startup should be less than 1 minute (about 10 seconds on my machine).


## Rebase on Sync

This template sync's with rebase as it is designed for trunk-based development. If you use a different branch management approach or you prefer a different sync behavior, change the setting in `.vscode/settings.json` as required. You may also want to change the code in file `.devcontainer/init.sh` to match your preferred sync behavior.

## Creating Solution and Projects

Before you start using the template but after you have cloned it, I'd recommend renaming all occurances of `dotnet-demo` in this repository to something that is more meaningful in your context.

Use commands such as `dotnet new` to create the solution file and one or more project files.

## Version Information

This version of the repo is for .NET SDK version 8.0.407. This includes these .NET runtimes:
- Microsoft.AspNetCore.App 8.0.14
- Microsoft.NETCore.App 8.0.14

You can use a different version of the .NET SDK by choosing a different base image in file `Dockerfile`. For information about available base images, please see https://hub.docker.com/_/microsoft-dotnet-sdk/

If you change the base image for the dev container, you also need to adjust the target framework in your `*.csproj` files (or equivalent). You may also need to adjust any configurations that you may have in the `.vscode/launch.json` (if you created any).
