# dev-container-dotnet

This is a template repository for creating new repositories that use the same directory structure and files as this one.

This is intended to be used for .NET Core development using VS Code 

## Getting Started

Prerequisites (most recent stable version unless stated otherwise):
- VS Code
- Docker Desktop (MacOS, Windows) or docker engine (Linux)
- Remote development extension
- git client
- `devcontainer CLI`, follow instructions at https://code.visualstudio.com/docs/remote/devcontainer-cli

How to start:
1. Create clone of this repo
1. At the root of the clone in a terminal, e.g., `bash` execute the following:

   ```bash
   devcontainer open .
   ```
   This will download docker images as needed, build docker images as need, then start the dev container and launch VS Code which remotely connects to the dev container. The repository clone is mounted into the dev container at path `/src`

The initial start may take several minutes if container base images need to be pulled first. Equally if you upgrade Docker Desktop (Windows, MacOS) or Docker Engine (Linux), the first startup after the upgrade may take several minutes as well.

## Creating Solution and Project

Use commands such as `dotnet new` to create the solution file and one or more project files.

## Version Information

This version of the repo is for .NET SDK version 5.0.402.

You can use a different versino of the .NET SDK by choosing a different base image in file `Dockerfile`.
