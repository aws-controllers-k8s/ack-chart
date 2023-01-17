#!/usr/bin/env bash

# upload-chart.sh handles taking the newest version of the parent chart and
# uploading it into its respective ECR public repositories.

set -Eeo pipefail

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR="$SCRIPTS_DIR/.."

DEFAULT_SERVICE_CONTROLLER_SOURCE_PATH="$ROOT_DIR/../$AWS_SERVICE-controller"
SERVICE_CONTROLLER_SOURCE_PATH=${SERVICE_CONTROLLER_SOURCE_PATH:-$DEFAULT_SERVICE_CONTROLLER_SOURCE_PATH}



run() {
    # Package and push the HEAD into ECR

    exit 0
}

# The purpose of the `return` subshell command in this script is to determine
# whether the script was sourced, or whether it is being executed directly.
# https://stackoverflow.com/a/28776166
(return 0 2>/dev/null) || run