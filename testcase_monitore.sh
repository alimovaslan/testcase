#!/bin/bash
set -x

LOG_FILE="/var/log/monitoring.log"
URL="https://test.com/monitoring/test/api"
PROCESS_NAME="testcase.sh"
PREV_PID_FILE="/tmp/testcase_prev_pid"

check_process() {
            pgrep -x "$PROCESS_NAME"
    }

log_message() {
        local level="$1"
        shift
        local message="$@"
        echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $message" | tee -a "$LOG_FILE"
    }

monitor() {
        CURRENT_PID=$(check_process)
        if [[ -n "$CURRENT_PID" ]]; then
                if [[ -f "$PREV_PID_FILE" ]]; then
                        PREV_PID=$(cat "$PREV_PID_FILE")
                        if [[ "$CURRENT_PID" != "$PREV_PID" ]]; then
                                log_message "Процесс $PROCESS_NAME был перезапущен (PID: $CURRENT_PID)"
                        fi
                fi
                echo "$CURRENT_PID" > "$PREV_PID_FILE"

                curl -k -s -o /dev/null --connect-timeout 5 --max-time 10 "$URL"
                if [[ $? -ne 0 ]]; then
                        log_message "ERROR" "Сервер мониторинга недоступен - $URL"
                else
                        log_message "INFO" "Сервер мониторинга доступен - $URL"
                fi
        else
                log_message "WARN" "Процесс $PROCESS_NAME не найден"
        fi
}

log_message "INFO" "Скрипт запущен"

monitor