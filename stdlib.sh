#!/bin/bash
# shellcheck disable=SC2155

###############################################################################################################
#  ____            _        _____ _                  _               _   _      _ _                           #
# |  _ \          | |      / ____| |                | |             | | | |    (_) |                          #
# | |_) | __ _ ___| |__   | (___ | |_ __ _ _ __   __| | __ _ _ __ __| | | |     _| |__  _ __ __ _ _ __ _   _  #
# |  _ < / _` / __| '_ \   \___ \| __/ _` | '_ \ / _` |/ _` | '__/ _` | | |    | | '_ \| '__/ _` | '__| | | | #
# | |_) | (_| \__ \ | | |  ____) | || (_| | | | | (_| | (_| | | | (_| | | |____| | |_) | | | (_| | |  | |_| | #
# |____/ \__,_|___/_| |_| |_____/ \__\__,_|_| |_|\__,_|\__,_|_|  \__,_| |______|_|_.__/|_|  \__,_|_|   \__, | #
#                                                                                                       __/ | #
#                                                                                                      |___/  #
###############################################################################################################

#############
# Functions #
#############

### <summary>
###     get_operating_system
###
###     Get the name of the operating system.
### </summary>
### <returns>
###     A string containing the name of the operating system.
###
###     String          Description
###
###     Linux           Linux
###     Darwin          MacOS
###     Cygwin          POSIX compatibility layer and Linux environment emulation for Windows
###     MSYS            Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
###     FreeBSD         FreeBSD
###     SunOS           Solaris
### </returns>
get_operating_system ()
{
    uname -s
}

get_distribution ()
{
    if [ -f /etc/os-release ]; then
        awk -F '=' '{print $2}' /etc/os-release | awk 'FNR == 1 {print}' | tr -d '"' | tr '[:upper:]' '[:lower:]'
    elif [ -f /etc/lsb-release ]; then
        awk -F '=' '{print $2}' /etc/lsb-release | awk 'FNR == 1 {print}' | tr -d '"' | tr '[:upper:]' '[:lower:]'
    # elif [ -f /etc/*release ]; then
    fi
}

get_version ()
{
    if [ -f /etc/os-release ]; then
        awk -F '=' '{print $2}' /etc/os-release | awk 'FNR == 6 {print}' | tr -d '"' | tr '[:upper:]' '[:lower:]'
    elif [ -f /etc/lsb-release ]; then
        awk -F '=' '{print $2}' /etc/lsb-release | awk 'FNR == 2 {print}' | tr -d '"' | tr '[:upper:]' '[:lower:]'
    # elif [ -f /etc/*release ]; then
    fi
}

get_architecture ()
{
    uname -m
}

get_kernel ()
{
    uname -r
}

package_check ()
{
    if [[ $SYSTEM_DISTRIBUTION == "ubuntu" || $SYSTEM_DISTRIBUTION == "debian" ]]; then

        if dpkg -l "$1" &> /dev/null; then
            return 0
        else
            return 1
        fi

    fi
}

prompt () {
    MESSAGE="$1"
    while true; do
        IFS="" read -p "$MESSAGE [Y/N]: " -r PROMPT
        PROMPT="$(lowercase "$PROMPT")"
        if [[ "$PROMPT" == "y" || "$PROMPT" == "yes" ]]; then
            return 0
        elif [[ "$PROMPT" == "n" || "$PROMPT" == "no" ]]; then
            return 1
        fi
    done
}

output () {
    DEBUG_LEVEL=${2:-"INFO"}
    if [[ "$DEBUG_LEVEL" == "INFO" ]]; then
        DEBUG_LEVEL="$CLR_BLUE$DEBUG_LEVEL$CLR_END"
    elif [[ "$DEBUG_LEVEL" == "WARNING" ]]; then
        DEBUG_LEVEL="$CLR_YELLOW$DEBUG_LEVEL$CLR_END"
    elif [[ "$DEBUG_LEVEL" == "ERROR" ]]; then
        DEBUG_LEVEL="$CLR_RED$DEBUG_LEVEL$CLR_END"
    elif [[ "$DEBUG_LEVEL" == "SUCCESS" ]]; then
        DEBUG_LEVEL="$CLR_GREEN$DEBUG_LEVEL$CLR_END"
    elif [[ "$DEBUG_LEVEL" == "FAILURE" ]]; then
        DEBUG_LEVEL="$CLR_RED$DEBUG_LEVEL$CLR_END"
    else
        DEBUG_LEVEL="$DEBUG_LEVEL"
    fi
    printf "($(date +'%Y-%m-%d') $(date +'%T')) [$DEBUG_LEVEL] $1\n" | tee --append $LOG_FILE
}

lowercase () {
    echo "$1" | tr "[:upper:]" "[:lower:]"
}

uppercase () {
    echo "$1" | tr "[:lower:]" "[:upper:]"
}

#############
# Variables #
#############

export LOG_FILE="/var/log/$(basename "$0").log"

export SYSTEM_OS="$(get_operating_system)"
export SYSTEM_KERNEL="$(get_kernel)"
export SYSTEM_ARCHITECTURE="$(get_architecture)"
export SYSTEM_DISTRIBUTION="$(get_distribution)"
export SYSTEM_VERSION="$(get_version)"

# Formatting
export FMT_END="\e[0m"
export FMT_BOLD="\e[1m"
export FMT_DIM="\e[2m"
export FMT_UNDERLINE="\e[4m"
export FMT_BLINK="\e[5m"
export FMT_INVERT="\e[7m"
export FMT_HIDDEN="\e[8m"
export FMT_BOLD_END="\e[21m"
export FMT_DIM_END="\e[22m"
export FMT_UNDERLINE_END="\e[24m"
export FMT_BLINK_END="\e[25m"
export FMT_INVERT_END="\e[27m"
export FMT_HIDDEN_END="\e[28m"

# Foreground Colors (Text) [8/16 Colors]
export CLR_END="\e[39m"
export CLR_BLACK="\e[30m"
export CLR_RED="\e[31m"
export CLR_GREEN="\e[32m"
export CLR_YELLOW="\e[33m"
export CLR_BLUE="\e[34m"
export CLR_MAGENTA="\e[35m"
export CLR_CYAN="\e[36m"
export CLR_LIGHTGRAY="\e[37m"
export CLR_DARKGRAY="\e[90m"
export CLR_LIGHTRED="\e[91m"
export CLR_LIGHTGREEN="\e[92m"
export CLR_LIGHTYELLOW="\e[93m"
export CLR_LIGHTBLUE="\e[94m"
export CLR_LIGHTMAGENTA="\e[95m"
export CLR_LIGHTCYAN="\e[96m"
export CLR_WHITE="\e[97m"

# Background Colors
export CLR_END_BG="\e[49m"
export CLR_BLACK_BG="\e[40m"
export CLR_RED_BG="\e[41m"
export CLR_GREEN_BG="\e[42m"
export CLR_YELLOW_BG="\e[43m"
export CLR_BLUE_BG="\e[43m"
export CLR_MAGENTA_BG="\e[45m"
export CLR_CYAN_BG="\e[46m"
export CLR_LIGHTGRAY_BG="\e[47m"
export CLR_DARKGRAY_BG="\e[100m"
export CLR_LIGHTRED_BG="\e[101m"
export CLR_LIGHTGREEN_BG="\e[102m"
export CLR_LIGHTYELLOW_BG="\e[103m"
export CLR_LIGHTBLUE_BG="\e[104m"
export CLR_LIGHTMAGENTA_BG="\e[105m"
export CLR_LIGHTCYAN_BG="\e[106m"
export CLR_WHITE_BG="\e[107m"