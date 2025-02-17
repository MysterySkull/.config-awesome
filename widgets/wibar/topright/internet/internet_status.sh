#!/bin/bash

# Je veux une fonction qui me donne une chaine de caractère que je vais pouvoir traiter 

if [[ $(nmcli -t d | grep 'enp0s31f6' | tr ' ' '_' | tr ':' ' ' | awk {'print $3'}) = "connected" ]] then
    mode="ethernet"
    router=$(nmcli -t d | grep 'enp0s31f6' | tr ' ' '_' | tr ':' ' ' | awk {'print $4'})

    force="4"
else
    var=$(nmcli -t d | grep 'wlp1s0:wifi:' | tr ' ' '_' | tr ':' ' ' | awk {'print $3'})
    if [[ "$var" != "unavailable" ]] then
        mode="wifi"
        if [[ "$var" = "connected" ]] then
            router=$(nmcli -t d | grep 'wlp1s0:wifi:' | tr ' ' '_' | tr ':' ' ' | awk {'print $4'})
            if [[ $(ping -c1 8.8.8.8) ]] then
                force_str=$(nmcli -t -f IN-USE,SIGNAL d wifi | grep "*" | tr ':' ' '| awk {'print $2'})
                if [[ "$force_str" = "100" ]] then force="4" 
                else
                    force="$(($force_str/20))"
                fi
            else
                force=0
            fi
        else
            router="not_connected"
            force="no_internet"
        fi
    else
        mode="no_connection"
        router="not_connected"
        force="no_internet"
    fi
fi

# mode : Ethernet / Wifi / no_connection
# router : Router / not_connected
# force : 0 1 2 3 4 no_internet
echo "$mode $router $force"
