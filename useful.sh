#!/usr/bin/env bash

# Developed by Claromes, 2024
# Licensed under the GNU General Public License v3.0

GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)
BOLD=$(tput bold)

###### HELP ######
HELP="
    useful utils ${GREEN}(Bash)${RESET}

    useful docker

    useful git

    useful poetry

    useful venv ${GREEN}(Python)${RESET}

    useful deno
"
ERROR="
    Unknown option: $1

    Usage: ${BOLD}useful <LIST NAME>${RESET}
    Help: ${BOLD}useful help
"

###### COMMANDS ######
UTILS_CMD="
    Name:
        ${BOLD}Utils${RESET}

    Commands:
        sudo apt update && sudo apt upgrade ${GREEN}# update package index and upgrade all installed packages${RESET}

        chmod u+x {file_name} ${GREEN}# permission to execute (grant only the owner)${RESET}

        chmod +x {file_name} ${GREEN}# permission to execute (grant all - owner, group, others)${RESET}

        chown -R {user_name}:{user_name} . ${GREEN}# changes permissions${RESET}

        find . -name {file_name} ${GREEN}# finds a dir by name${RESET}

        dpkg -i *.deb ${GREEN}# installs .deb files${RESET}

        tar -vzxf *tar.gz ${GREEN}# extract tar.gz files${RESET}

        ls -p | grep -v / ${GREEN}# shows only files${RESET}

        history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10 ${GREEN}# last commands most used${RESET}

        history | cut -c8- | \grep -Eo '^[^[:space:]]+| \| [^[:space:]]+' | sed 's/ \| //' | sort | uniq -c | sort -n ${GREEN}# command to (sort of) get all of the commands from your history by count${RESET}

        dpkg --get-selections | grep -v deinstall | nl ${GREEN}# get a list of packages installed locally with number lines (nl)${RESET}

        dpkg -l ${GREEN}# same list with description. add \"| nl\" to see number lines (nl)${RESET}

        <ctrl> + u ${GREEN}# clears the line. Useful when password is typed wrong${RESET}

        less -N {file_name} ${GREEN}# displays file contents output one page at a time with number lines (-N). An alternative to cat${RESET}

        lsof -i :{port} ${GREEN}# knows which process is using some port${RESET}

        kill -9 {PID} ${GREEN}# if you want to terminate the process listed before${RESET}

        busybox httpd -p 8080 -h {path/to/file_name} ${GREEN}# simple web server with BusyBox HTTP Daemon. Available at http://localhost:8080${RESET}

        tail -n 100 {file_name} ${GREEN}# last 100 lines of a file${RESET}
"
DOCKER_CMD="
    Name:
        ${BOLD}Docker${RESET}

    Commands:
        docker ps -a ${GREEN}# list both running and stopped containers${RESET}

        docker stop {container} ${GREEN}# stop one container${RESET}

        docker stop \`docker ps -q\` ${GREEN}# stop all the containers${RESET}

        docker rm {container} ${GREEN}# delete one container${RESET}

        docker rm -f {container} ${GREEN}# delete one container without stopping it${RESET}

        docker stop \`docker ps -q\`; docker rm \`docker ps -aq\` ${GREEN}# delete all the containers${RESET}
"
GIT_CMD="
    Name:
        ${BOLD}Git${RESET}

    Commands:
        git branch -D branch_name ${GREEN}# delete branch locally${RESET}

        git push origin --delete branch_name ${GREEN}# delete branch remotely${RESET}

        git remote set-url origin git@github.com:<user>/<repo>.git ${GREEN}# remote set-url origin${RESET}

        git remote add origin git@github.com:<user>/<repo>.git ${GREEN}# remote add origin${RESET}

        git push -u origin main ${GREEN}# first push${RESET}

        git stash pop ${GREEN}# undo last git stash${RESET}
"
POETRY_CMD="
    Name:
        ${BOLD}Poetry${RESET}

    Commands:
        poetry shell ${GREEN}# spawns a shell and if a virtualenv does not exist, it will be created${RESET}
        poetry new ${GREEN}# creates a directory structure${RESET}
        poetry install <package-name> ${GREEN}# installs the package${RESET}
        poetry run <package-name> ${GREEN}# executes the package inside the project's virtualenv${RESET}
        poetry add <package-name> --group <group-name> ${GREEN}# adds packages to your pyproject.toml and installs them${RESET}
        poetry remove <package-name> --group <group-name> ${GREEN}# removes packages to your pyproject.toml and uninstalls them${RESET}
        poetry build ${GREEN}# builds the source and wheels archives${RESET}
        poetry publish -u __token__ -p <pypi-token> ${GREEN}# publishes the package, previously built with the build command${RESET}
"
VENV_CMD="
    Name:
        ${BOLD}venv${RESET}

    Commands:
        ${GREEN}# win${RESET}
        python -m venv .venv
        .venv\Scripts\activate
        deactivate

        ${GREEN}# unix${RESET}
        python -m venv .venv
        source .venv/bin/activate
        deactivate

        ${GREEN}# install requirements${RESET}
        pip install -r requirements.txt
"
DENO_CMD="
    Name:
        ${BOLD}Deno${RESET}

    Commands:
        deno install <OPTIONS> <package-name>
            OPTIONS:
                --allow-net  ${GREEN}# grants permissions for network access${RESET}
                --allow-read  ${GREEN}# grants permissions for file reading${RESET}
                --allow-write  ${GREEN}# grants permissions for file writing${RESET}
                -n  ${GREEN}# names the executable${RESET}
            EXAMPLE:
                ${CYAN}deno install --allow-net --allow-read --allow-write -n <exec-name> <package-name>${RESET}
"

###### ECHO ######

case "$1" in
    help)
        echo "$HELP"
        exit 0
    ;;
    "" | [0-9]* | -* | --*)
        echo "$ERROR"
        exit 1
    ;;
    utils)
        echo "$UTILS_CMD" | less -R
        exit 0
    ;;
    docker)
        echo "$DOCKER_CMD" | less -R
        exit 0
    ;;
    git)
        echo "$GIT_CMD" | less -R
        exit 0
    ;;
    poetry)
        echo "$POETRY_CMD" | less -R
        exit 0
    ;;
    venv)
        echo "$VENV_CMD" | less -R
        exit 0
    ;;
    deno)
        echo "$DENO_CMD" | less -R
        exit 0
    ;;
esac
