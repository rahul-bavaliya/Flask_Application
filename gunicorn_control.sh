#!/bin/bash

# Gunicorn application name (change this to your Gunicorn app name)
APP_NAME="Flash_Web_App"

# Gunicorn configuration file
GUNICORN_CONFIG="gunicorn_config.py"

# Path to the Gunicorn executable
GUNICORN_BIN="venv/Scripts/gunicorn.exe"  # Replace with the actual path to your Gunicorn executable

start() {
    echo "Starting $APP_NAME..."
    sudo $GUNICORN_BIN -c $GUNICORN_CONFIG run:app
}

stop() {
    echo "Stopping $APP_NAME..."
    sudo pkill -f "$APP_NAME"
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

exit 0
