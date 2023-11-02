#!/bin/bash

APP_NAME="Flask_Web_Application"
GUNICORN_BIN="venv/bin/gunicorn"  # Replace with the path to your Gunicorn binary
GUNICORN_CONFIG="gunicorn_config.py"  # Replace with the path to your Gunicorn config file

start() {
    echo "Starting $APP_NAME..."
    $GUNICORN_BIN -c $GUNICORN_CONFIG -D
    echo "$APP_NAME started."
}

stop() {
    echo "Stopping $APP_NAME..."
    pkill -f "$GUNICORN_BIN"
    echo "$APP_NAME stopped."
}

restart() {
    stop
    start
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
esac
