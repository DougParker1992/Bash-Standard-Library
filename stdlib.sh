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
CLR_END_BG
CLR_BLACK_BG
CLR_RED_BG
CLR_GREEN_BG
CLR_YELLOW_BG
CLR_BLUE_BG
CLR_MAGENTA_BG
CLR_CYAN_BG
CLR_LIGHTGRAY_BG
CLR_DARKGRAY_BG
CLR_LIGHTRED_BG
CLR_LIGHTGREEN_BG
CLR_LIGHTYELLOW_BG
CLR_LIGHTBLUE_BG
CLR_LIGHTMAGENTA_BG
CLR_LIGHTCYAN_BG
CLR_WHITE_BG

#############
# Functions #
#############