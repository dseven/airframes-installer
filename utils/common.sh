#!/usr/bin/env bash
#
# Airframes Installer - Common functions
#

STEP=$((100/$STEPS))
current_step=0
LOG_DIR="/tmp/airframes-installer/logs"
LOG_FILE="${LOG_DIR}/install.log"
mkdir -p "${LOG_DIR}"

printStep() {
  (
    cat <<EOF
XXX
$counter
$counter% installed

$2
XXX
EOF
  ) | dialog --title "Installing $1" --gauge "Initializing" 10 70 0
}

doStep() {
  printStep $1 "${@:3}"
  if [ $2 == "done" ]; then
    return 0
  fi
  $2 >> $LOG_FILE 2>&1
  ((current_step+=1))
  ((counter+=STEP))
}
