# useful

Lists of useful GNU/Linux commands I use in my daily routine. The script uses `less` for pagination.

## Installation

```bash
git clone git@github.com:claromes/useful.git
```

```bash
cd useful && sudo chmod +x ./useful.sh
```

In the `.bashrc` file, add the following line:

```bash
alias useful='/home/<user>/useful/useful.sh'
```

## Usage

Available lists:
```bash
useful help
```

Show list:
```bash
useful <LIST NAME>
```
## Add your own commands and lists

Fork the project and modify the `useful.sh` script.

In the `###### COMMANDS ######` section, insert your commands, creating a new variable.

In the `###### ECHO ######` section, add another option to the case statement with the list name (`arg_name`) that will be passed as an argument, and the variable with the commands (`$NAME_CMD`).
```bash
arg_name)
    echo "$NAME_CMD" | less -R
    exit 0
;;
```

Don't forget to insert this new `arg_name` into the `HELP` variable, in the `###### HELP ######` section of the code.
