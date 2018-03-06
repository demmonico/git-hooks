#!/usr/bin/env bash
#-----------------------------------------------------------#
# @author: dep
# @link: https://github.com/demmonico
# @package: https://github.com/demmonico/git-hooks
#
# Helper for pulling git hooks
#
# Usage:
# - run ./pull_git_hooks.sh hook_name_1 [, hook_name_2 ...]
# - add to composer.json file in "scripts" section
#       "post-install-cmd": [
#           "bash pull_git_hooks.sh pre-commit commit-msg"
#       ]
#-----------------------------------------------------------#

GREEN='\033[0;32m'
NC='\033[0m' # No Color

SOURCE_URL='https://raw.githubusercontent.com/demmonico/git-hooks/master/hooks'
DESTINATION_FOLDER='.git/hooks'

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# pull all arguments
for HOOK in "$@"
do
    echo -n "Pulling ${HOOK} git hook ... "
    DESTINATION="${ROOT_DIR}/${DESTINATION_FOLDER}/${HOOK}"
    if [ ! -f "${DESTINATION}" ]; then
        wget -q -O "${DESTINATION}" "${SOURCE_URL}/${HOOK}" && chmod +x "${DESTINATION}"
        echo -e "${GREEN}Done${NC}"
    else
        echo -e "${GREEN}Already exists${NC}"
    fi;
done