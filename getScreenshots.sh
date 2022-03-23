#!/usr/bin/env bash

shodanparse () {
    shodan download search "$1" 2> /dev/null
    shodan parse --fields ip_str,port --separator : search.json.gz 2> /dev/null | tee "shodan.$(date -Iseconds).log"
}

shodanvnc () {
    while read line; do
        host=$(echo "$line" | awk -F: '{print $1}')
        port=$(echo "$line" | awk -F: '{print $2}')

        echo "[!] Attempt started on $host:$port"

        timeout 8s vncsnapshot -quiet $host:$(expr $port - 5900) $host-$port.jpg
        if [[ $? -eq 124 ]]; then
            echo Timed out.
        fi

        echo -e "Attempt finished on $host:$port\n"
    done < $1
}

"$@"
