#!/bin/bash

export DEFAULT_SQUEEZELITE_MODE=alsa
export DEFAULT_STARTUP_DELAY_SEC=0
export DEFAULT_SQUEEZELITE_DELAY=500
export DEFAULT_SQUEEZELITE_TIMEOUT=2

if [ -z "${SQUEEZELITE_MODE}" ]; then
  SQUEEZELITE_MODE=$DEFAULT_SQUEEZELITE_MODE;
  echo "Setting default value for SQUEEZELITE_MODE: ["$SQUEEZELITE_MODE"]"
fi

if [ -z "${STARTUP_DELAY_SEC}" ]; then
  STARTUP_DELAY_SEC=$DEFAULT_STARTUP_DELAY_SEC;
  echo "Setting default value for STARTUP_DELAY_SEC: ["$STARTUP_DELAY_SEC"]"
fi

echo "About to sleep for $STARTUP_DELAY_SEC second(s)"
sleep $STARTUP_DELAY_SEC
echo "Ready to start."

echo "=== BEGIN Available audio devices ==="
/usr/bin/squeezelite -l
echo "=== END-- Available audio devices ==="
echo ""

if [ "${SQUEEZELITE_MODE}" == "alsa" ]; then
  /app/bin/run-squeezelite-alsa.sh;
else
  /app/bin/run-squeezelite-pulse.sh;
fi

