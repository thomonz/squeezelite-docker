#!/bin/bash

DEFAULT_SQUEEZELITE_TIMEOUT=2
DEFAULT_SQUEEZELITE_DELAY=500

function cmdline-server-port() {
    if [ -z "${SQUEEZELITE_SERVER_PORT}" ]; then
        echo "Variable SQUEEZELITE_SERVER_PORT has not been specified, using discovery";
    else
        echo "Variable SQUEEZELITE_SERVER_PORT has been specified: $SQUEEZELITE_SERVER_PORT";
        CMD_LINE="$CMD_LINE -s $SQUEEZELITE_SERVER_PORT";
    fi    
}

function cmdline-player-name() {
    if [ -z "${SQUEEZELITE_NAME}" ]; then
        echo "Variable SQUEEZELITE_NAME has not been specified";
    else
        echo "Variable SQUEEZELITE_NAME has been specified: $SQUEEZELITE_NAME";
        CMD_LINE="$CMD_LINE -n $SQUEEZELITE_NAME";
    fi
}

function cmdline-model-name() {
    if [ -z "${SQUEEZELITE_MODEL_NAME}" ]; then
      echo "Variable SQUEEZELITE_MODEL_NAME has not been specified";
    else
        echo "Variable SQUEEZELITE_MODEL_NAME has been specified: $SQUEEZELITE_MODEL_NAME";
        CMD_LINE="$CMD_LINE -M $SQUEEZELITE_MODEL_NAME";
    fi
}

function cmdline-timeout() {
    if [ -z "${SQUEEZELITE_TIMEOUT}" ]; then
        echo "Variable SQUEEZELITE_TIMEOUT has not been specified, using default $DEFAULT_SQUEEZELITE_TIMEOUT";
        SQUEEZELITE_TIMEOUT=$DEFAULT_SQUEEZELITE_TIMEOUT;
    else
        echo "Variable SQUEEZELITE_TIMEOUT has been specified: $SQUEEZELITE_TIMEOUT";
    fi
    CMD_LINE="$CMD_LINE -C $SQUEEZELITE_TIMEOUT";
}

function cmdline-mac-address() {
    if [ -z "${SQUEEZELITE_MAC_ADDRESS}" ]; then
        echo "Variable SQUEEZELITE_MAC_ADDRESS not specified";
    else
        echo "Variable SQUEEZELITE_MAC_ADDRESS specified: $SQUEEZELITE_MAC_ADDRESS";
        CMD_LINE="$CMD_LINE -m $SQUEEZELITE_MAC_ADDRESS";
    fi    
}

function cmdline-audio-device() {
    if [ -z "${SQUEEZELITE_AUDIO_DEVICE}" ]; then
        echo "Variable SQUEEZELITE_AUDIO_DEVICE has not been specified";
    else
        echo "Variable SQUEEZELITE_AUDIO_DEVICE has been specified: $SQUEEZELITE_AUDIO_DEVICE";
        CMD_LINE="$CMD_LINE -o "$SQUEEZELITE_AUDIO_DEVICE;
    fi
}

function cmdline-mixer-device() {
    if [ -z "${SQUEEZELITE_MIXER_DEVICE}" ]; then
        echo "Variable SQUEEZELITE_MIXER_DEVICE has not been specified";
    else
        echo "Variable SQUEEZELITE_MIXER_DEVICE has been specified: $SQUEEZELITE_MIXER_DEVICE";
        CMD_LINE="$CMD_LINE -O $SQUEEZELITE_MIXER_DEVICE";
    fi
}

function cmdline-delay() {
    if [ -z "${SQUEEZELITE_DELAY}" ]; then
        echo "Variable SQUEEZELITE_DELAY has not been specified, using default $DEFAULT_SQUEEZELITE_DELAY";
        SQUEEZELITE_DELAY=$DEFAULT_SQUEEZELITE_DELAY;
    else
        echo "Variable SQUEEZELITE_DELAY has been specified: $SQUEEZELITE_DELAY";
    fi
    CMD_LINE="$CMD_LINE -D $SQUEEZELITE_DELAY";
}

function cmdline-params() {
    if [ -z "${SQUEEZELITE_PARAMS}" ]; then
        echo "Variable SQUEEZELITE_PARAMS has not been specified";
    else
        echo "Variable SQUEEZELITE_PARAMS has been specified: $SQUEEZELITE_PARAMS";
        CMD_LINE="$CMD_LINE -a $SQUEEZELITE_PARAMS";
    fi
}

function cmdline-volume-control() {
    if [ -z "${SQUEEZELITE_VOLUME_CONTROL}" ]; then
        echo "Variable SQUEEZELITE_VOLUME_CONTROL not specified";
    else
        echo "Variable SQUEEZELITE_VOLUME_CONTROL specified: $SQUEEZELITE_VOLUME_CONTROL";
        CMD_LINE="$CMD_LINE -V $SQUEEZELITE_VOLUME_CONTROL";
    fi
}

function cmdline-linear-volume() {
    if [ -z "${SQUEEZELITE_LINEAR_VOLUME}" ]; then
        echo "Variable SQUEEZELITE_LINEAR_VOLUME not specified";
    else
        echo "Variable SQUEEZELITE_LINEAR_VOLUME specified: $SQUEEZELITE_LINEAR_VOLUME";
        linear=${SQUEEZELITE_LINEAR_VOLUME^^}
        echo "linear: $linear";
        if [ "$linear" == "Y" ]; then
            echo "Variable SQUEEZELITE_LINEAR_VOLUME set to enabled.";
            CMD_LINE="$CMD_LINE -X";
        else 
            if [ "$linear" == "N" ]; then
                echo "Variable SQUEEZELITE_LINEAR_VOLUME set to disabled.";
            else
                echo "Variable SQUEEZELITE_LINEAR_VOLUME invalid value: $SQUEEZELITE_LINEAR_VOLUME";
            fi
        fi
    fi
}

function cmdline-codecs() {
    if [ -z "${SQUEEZELITE_CODECS}" ]; then
        echo "Variable SQUEEZELITE_CODECS has not been specified";
    else
        echo "Variable SQUEEZELITE_CODECS has been specified: $SQUEEZELITE_CODECS";
        CMD_LINE="$CMD_LINE -c $SQUEEZELITE_CODECS";
    fi
}

function cmdline-exclude-codecs() {
    if [ -z "${SQUEEZELITE_EXCLUDE_CODECS}" ]; then
        echo "Variable SQUEEZELITE_EXCLUDE_CODECS has not been specified";
    else
        echo "Variable SQUEEZELITE_EXCLUDE_CODECS has been specified: $SQUEEZELITE_EXCLUDE_CODECS";
        CMD_LINE="$CMD_LINE -e $SQUEEZELITE_EXCLUDE_CODECS";
    fi
}

function cmdline-rates() {
    if [ -z "${SQUEEZELITE_RATES}" ]; then
        echo "Variable SQUEEZELITE_RATES not specified";
    else
        echo "Variable SQUEEZELITE_RATES specified: $SQUEEZELITE_RATES";
        CMD_LINE="$CMD_LINE -r $SQUEEZELITE_RATES";
    fi
}