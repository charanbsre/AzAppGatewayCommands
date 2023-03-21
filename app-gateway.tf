provisioner "local-exec" {
  command = <<EOT
      az network application-gateway address-pool create --gateway-name TesAGW01 --resource-group TestRG --name TestBEP02
      az network application-gateway frontend-port create --gateway-name TestAGW01 --resource-group TestRG --name Port8080 --port 8080
      az network application-gateway http-settings create --gateway-name TestAGW01 --resource-group TestRG --name Settings02 --port 8080
      az network application-gateway http-listener create --frontend-port Port8080 --gateway-name TestAGW01 --resource-group TestRG --name Listener02 --frontend-ip appGwPublicFrontendIpIPv4
      az network application-gateway rule create --gateway-name TestAGW01 --resource-group TestRG --name Rule02 --address-pool TestBEP02 --http-listener Listener02 --http-settings Settings02 --priority 2 --rule-type Basic
  EOT

  interpreter = ["PowerShell", "-Command"]
}
