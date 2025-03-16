#!/bin/bash

################################################################################
echo ************************************
echo running init.sh ...


################################################################################
# Set get pull mode to rebase. Do the same for branches that may exist. However
# this is a repo designed for trunk-based development, so there shouldn't be any
# branches other than 'main' [Manfred, 22aug2022]
# For more details, see https://stackoverflow.com/a/13974638/411428
runuser -l dev -c 'cd /work && git config pull.rebase true'
runuser -l dev -c 'cd /work && git config branch.autosetuprebase always'
# option -l specifies the user on whose behalf the commmand is executed. Note that
#           this script runs as root. [Manfred, 23 Oct 2023]


################################################################################
# Set 'd' as an alias for 'dotnet' [Manfred, 25oct2022]
runuser -l dev -c 'echo "alias d='dotnet'" >> /home/dev/.bashrc && source /home/dev/.bashrc'


################################################################################
# Call init.ps1 to execute commands that prefer running in PowerShell
pwsh /work/.devcontainer/init.ps1


################################################################################
echo ************************************
echo init.sh completed.
