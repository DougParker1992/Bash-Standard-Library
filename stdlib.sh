#!/bin/bash

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

#################
# Library Index #
#################

# 1) Variables
#    1.1) Terminal Formatting
# 2) Functions

#############
# Variables #
#############

#######################
# Terminal Formatting #
#######################

# Formatting
FMT_END="\e[0m"
FMT_BOLD="\e[1m"
FMT_DIM="\e[2m"
FMT_UNDERLINE="\e[4m"
FMT_BLINK="\e[5m"
FMT_INVERT="\e[7m"
FMT_HIDDEN="\e[8m"
FMT_BOLD_END="\e[21m"
FMT_DIM_END="\e[22m"
FMT_UNDERLINE_END="\e[24m"
FMT_BLINK_END="\e[25m"
FMT_INVERT_END="\e[27m"
FMT_HIDDEN_END="\e[28m"

# Foreground Colors (Text) [8/16 Colors]
CLR_END="\e[39m"
CLR_BLACK="\e[30m"
CLR_RED="\e[31m"
CLR_GREEN="\e[32m"
CLR_YELLOW="\e[33m"
CLR_BLUE="\e[34m"
CLR_MAGENTA="\e[35m"
CLR_CYAN="\e[36m"
CLR_LIGHTGRAY="\e[37m"
CLR_DARKGRAY="\e[90m"
CLR_LIGHTRED="\e[91m"
CLR_LIGHTGREEN="\e[92m"
CLR_LIGHTYELLOW="\e[93m"
CLR_LIGHTBLUE="\e[94m"
CLR_LIGHTMAGENTA="\e[95m"
CLR_LIGHTCYAN="\e[96m"
CLR_WHITE="\e[97m"

# Background Colors
CLR_END_BG="\e[49m"
CLR_BLACK_BG="\e[40m"
CLR_RED_BG="\e[41m"
CLR_GREEN_BG="\e[42m"
CLR_YELLOW_BG="\e[43m"
CLR_BLUE_BG="\e[43m"
CLR_MAGENTA_BG="\e[45m"
CLR_CYAN_BG="\e[46m"
CLR_LIGHTGRAY_BG="\e[47m"
CLR_DARKGRAY_BG="\e[100m"
CLR_LIGHTRED_BG="\e[101m"
CLR_LIGHTGREEN_BG="\e[102m"
CLR_LIGHTYELLOW_BG="\e[103m"
CLR_LIGHTBLUE_BG="\e[104m"
CLR_LIGHTMAGENTA_BG="\e[105m"
CLR_LIGHTCYAN_BG="\e[106m"
CLR_WHITE_BG="\e[107m"

#############
# Functions #
#############