output "instance_settings"{
    value = [ 
    {info_web = ["Instance Name is: ${yandex_compute_instance.platform.name}","External IP address is: ${yandex_compute_instance.platform.network_interface.0.nat_ip_address}","Internal IP address is:${yandex_compute_instance.platform.network_interface[0].ip_address}","FQDN is: ${yandex_compute_instance.platform.fqdn}"]},
    {info_db = ["Instance Name is: ${yandex_compute_instance.platformdb.name}","External IP address is: ${yandex_compute_instance.platformdb.network_interface.0.nat_ip_address}","Internal IP address is: ${yandex_compute_instance.platformdb.network_interface.0.ip_address}","FQDN is: ${yandex_compute_instance.platformdb.fqdn}"]}
    
    ]
}
