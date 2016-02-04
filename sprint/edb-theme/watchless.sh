while inotifywait -e close_write ./*.less; do lessc --no-ie-compat ./style.less ./style.css; done
