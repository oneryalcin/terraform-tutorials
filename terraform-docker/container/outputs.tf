# --- container/outputs.tf ---

//output "ip-address" {
//  # [for i in docker_container.nodered_container[*]: join(":", [i.ip_address,i.ports[0].external]) ]
//  value       = [for i in docker_container.nodered_container[*] : join(":", [i.ip_address], i.ports[*]["external"])]
//  description = "The IP address of the container"
//  # sensitive = true
//}
//
//output "container-name" {
//  value       = docker_container.nodered_container.name
//  description = "The name of the container"
//}