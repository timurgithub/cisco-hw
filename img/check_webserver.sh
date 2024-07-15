vrrp_script chk_webserver {
        script "/usr/local/bin/check_webserver.sh"
        interval 3
        fall 2
        rise 2
}

vrrp_instance VI_1 {
        state MASTER
        interface enp0s3
        virtual_router_id 253
        priority 255
        advert_int 1

        virtual_ipaddress {
              192.168.71.253/24
        }

        track_process {
                 check_nginx
                 }

        track_script {
                chk_webserver
                 }
}
