{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {

        "publicIPAddressNameChefdelivery": {
            "defaultValue": "",
            "type": "String"
        },
        "publicIPAddressNameChefprovision": {
            "defaultValue": "",
            "type": "String"
        },
        "publicIPDomainNameLabelChefServer":{
            "defaultValue": "",
            "type": "String"
        },
        "publicIPAddressNameChefbuild1": {
            "defaultValue": "",
            "type": "String"
        },
        "publicIPAddressNameChefbuild2": {
            "defaultValue": "",
            "type": "String"
        },
        "publicIPAddressNameChefbuild3": {
            "defaultValue": "",
            "type": "String"
        },
        "networkSecurityGroupNameChefdelivery": {
            "defaultValue": "",
            "type": "String"
        },
        "networkInterfaceNameChefProvision": {
            "defaultValue": "",
            "type": "String"
        },
        "networkInterfaceNameChefdelivery": {
            "defaultValue": "",
            "type": "String"
        },
        "networkInterfaceNameChefbuild1": {
            "defaultValue": "",
            "type": "String"
        },    

        "networkInterfaceNameChefbuild2": {
            "defaultValue": "",
            "type": "String"
        },    

        "networkInterfaceNameChefbuild3": {
            "defaultValue": "",
            "type": "String"
        },    
        "vmNameChefProvision": {
            "defaultValue": "",
            "type": "String"
        },
        "vmNameChefdelivery": {
            "defaultValue": "",
            "type": "String"
        },
        "vmNameChefbuild1": {
            "defaultValue": "",
            "type": "String"
        },
        "vmNameChefbuild2": {
            "defaultValue": "",
            "type": "String"
        },
        "vmNameChefbuild3": {
            "defaultValue": "",
            "type": "String"
        },
        "vmAdminUsernameChefServer": {
            "defaultValue": "",
            "type": "String"
        },
        "vmAdminPasswordChefServer": {
            "defaultValue": "",
            "type": "SecureString"
        },
        "storageAccountName": {
            "defaultValue": "",
            "type": "String"
        },
        "vmStorageAccountContainerName": {
            "defaultValue": "",
            "type": "String"
        },
        "location": {
            "type": "string",
            "defaultValue": ""
        },
        "network-api-version": {
            "type": "string",
            "defaultValue": ""
        },
        "compute-api-version": {
            "type": "string",
            "defaultValue": ""
        },
        "tagvalues": {
            "type": "object",
            "defaultValue": {
                "program": "p2p",
                "project": "chefdelivery"
            }
        },

        "subnet3Ref": {
            "type": "string",
            "defaultValue": ""
        },
        "publicIPAddressType": {
            "type": "string",
            "defaultValue": ""
        }
    },
    "variables": {
        "clientazureVMUtilsName": "vmCustomizationClientExt",
        "clientazureVMUtilsScriptUrl": "https://raw.githubusercontent.com/boobalana/bbrepo1/delivery-branch/provision.sh",
        "clientazureVMUtilsScriptUrl1": "https://raw.githubusercontent.com/boobalana/bbrepo1/delivery-branch/ssh_install.sh",
        "imagePublisher": "Canonical",
        "imageOffer": "UbuntuServer",
        "ubuntuOSVersion": "14.04.4-LTS"
    },
    "resources": [{
            "type": "Microsoft.Compute/virtualMachines",
            "name": "[parameters('vmNameChefProvision')]",
            "apiVersion": "[parameters('compute-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },

            "properties": {
                "hardwareProfile": {
                    "vmSize": "Standard_DS2_V2"
                },
              "storageProfile": {
                
                 "imageReference": {
               "publisher": "[variables('imagePublisher')]",
                "offer": "[variables('imageOffer')]",
                "sku" : "[variables('ubuntuOSVersion')]",
                "version":"latest"
                
            },
                 "osDisk": {
                      "name": "[concat(parameters('vmNameChefProvision'),'-osDisk')]",
                      "createOption": "FromImage",
                       "vhd": {
                           "uri": "[concat('https', '://', parameters('storageAccountName'), '.blob.core.windows.net','/', parameters('vmStorageAccountContainerName'),'/', parameters('vmNameChefProvision'),'-osdisk.vhd')]"
                        },
                        "caching": "ReadWrite"
                    },
                    "dataDisks": []
                },
                "osProfile": {
                    "computerName": "[parameters('vmNameChefProvision')]",
                    "adminUsername": "[parameters('vmAdminUsernameChefServer')]",
                    "linuxConfiguration": {
                        "disablePasswordAuthentication": false
                    },
                    "secrets": [],
                    "adminPassword": "[parameters('vmAdminPasswordChefServer')]"
                },
                "networkProfile": {
                    "networkInterfaces": [{
                        "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceNameChefProvision'))]"
                    }]
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceNameChefProvision'))]"
            ]
        },
{
            "type": "Microsoft.Compute/virtualMachines",
            "name": "[parameters('vmNameChefdelivery')]",
            "apiVersion": "[parameters('compute-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },

            "properties": {
                "hardwareProfile": {
                    "vmSize": "Standard_DS2_V2"
                },
              "storageProfile": {
                
                 "imageReference": {
               "publisher": "[variables('imagePublisher')]",
                "offer": "[variables('imageOffer')]",
                "sku" : "[variables('ubuntuOSVersion')]",
                "version":"latest"
                
            },
                 "osDisk": {
                      "name": "[concat(parameters('vmNameChefdelivery'),'-osDisk')]",
                      "createOption": "FromImage",
                       "vhd": {
                           "uri": "[concat('https', '://', parameters('storageAccountName'), '.blob.core.windows.net','/', parameters('vmStorageAccountContainerName'),'/', parameters('vmNameChefdelivery'),'-osdisk.vhd')]"
                        },
                        "caching": "ReadWrite"
                    },
                    "dataDisks": []
                },
                "osProfile": {
                    "computerName": "[parameters('vmNameChefdelivery')]",
                    "adminUsername": "[parameters('vmAdminUsernameChefServer')]",
                    "linuxConfiguration": {
                        "disablePasswordAuthentication": false
                    },
                    "secrets": [],
                    "adminPassword": "[parameters('vmAdminPasswordChefServer')]"
                },
                "networkProfile": {
                    "networkInterfaces": [{
                        "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceNameChefdelivery'))]"
                    }]
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceNameChefdelivery'))]"
            ]
        },

{
            "type": "Microsoft.Compute/virtualMachines",
            "name": "[parameters('vmNameChefbuild1')]",
            "apiVersion": "[parameters('compute-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },

            "properties": {
                "hardwareProfile": {
                    "vmSize": "Standard_DS2_V2"
                },
              "storageProfile": {
                
                 "imageReference": {
               "publisher": "[variables('imagePublisher')]",
                "offer": "[variables('imageOffer')]",
                "sku" : "[variables('ubuntuOSVersion')]",
                "version":"latest"
                
            },
                 "osDisk": {
                      "name": "[concat(parameters('vmNameChefdelivery'),'-osDisk')]",
                      "createOption": "FromImage",
                       "vhd": {
                           "uri": "[concat('https', '://', parameters('storageAccountName'), '.blob.core.windows.net','/', parameters('vmStorageAccountContainerName'),'/', parameters('vmNameChefbuild1'),'-osdisk.vhd')]"
                        },
                        "caching": "ReadWrite"
                    },
                    "dataDisks": []
                },
                "osProfile": {
                    "computerName": "[parameters('vmNameChefbuild1')]",
                    "adminUsername": "[parameters('vmAdminUsernameChefServer')]",
                    "linuxConfiguration": {
                        "disablePasswordAuthentication": false
                    },
                    "secrets": [],
                    "adminPassword": "[parameters('vmAdminPasswordChefServer')]"
                },
                "networkProfile": {
                    "networkInterfaces": [{
                        "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceNameChefbuild1'))]"
                    }]
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaceNameChefbuild1'))]"
            ]
        },
           {
            "type": "Microsoft.Compute/virtualMachines/extensions",
            "name": "[concat(parameters('vmNameChefProvision'),'/', variables('clientazureVMUtilsName'))]",
            "apiVersion": "2015-05-01-preview",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[concat('Microsoft.Compute/virtualMachines/', parameters('vmNameChefProvision'))]"
   
            ],
            "properties": {
                "publisher": "Microsoft.OSTCExtensions",
                "type": "CustomScriptForLinux",
                "typeHandlerVersion": "1.2",
                "settings": {
                    "fileUris": [
                        "[variables('clientazureVMUtilsScriptUrl')]"
                    ],
                    "commandToExecute": "sh provision.sh"
                }
            }
        },
{
            "type": "Microsoft.Compute/virtualMachines/extensions",
            "name": "[concat(parameters('vmNameChefdelivery'),'/', variables('clientazureVMUtilsName'))]",
            "apiVersion": "2015-05-01-preview",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[concat('Microsoft.Compute/virtualMachines/', parameters('vmNameChefdelivery'))]"

            ],
            "properties": {
                "publisher": "Microsoft.OSTCExtensions",
                "type": "CustomScriptForLinux",
                "typeHandlerVersion": "1.2",
                "settings": {
                    "fileUris": [
                        "[variables('clientazureVMUtilsScriptUrl1')]"
                    ],
                    "commandToExecute": "sh ssh_install.sh"
                }
            }
        },

{
            "type": "Microsoft.Compute/virtualMachines/extensions",
            "name": "[concat(parameters('vmNameChefbuild1'),'/', variables('clientazureVMUtilsName'))]",
            "apiVersion": "2015-05-01-preview",
            "location": "[parameters('location')]",
            "dependsOn": [
                "[concat('Microsoft.Compute/virtualMachines/', parameters('vmNameChefbuild1'))]"

            ],
            "properties": {
                "publisher": "Microsoft.OSTCExtensions",
                "type": "CustomScriptForLinux",
                "typeHandlerVersion": "1.2",
                "settings": {
                    "fileUris": [
                        "[variables('clientazureVMUtilsScriptUrl1')]"
                    ],
                    "commandToExecute": "sh ssh_install.sh"
                }
            }
        },
      
           {
            "type": "Microsoft.Network/networkInterfaces",
            "name": "[parameters('networkInterfaceNameChefProvision')]",
            "apiVersion": "[parameters('network-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },
            "properties": {
                "ipConfigurations": [{
                    "name": "ipconfig1",
                    "properties": {
                        "privateIPAllocationMethod": "Static",
                        "privateIPAddress": "10.7.2.5",                        
                        "publicIPAddress": {
                            "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddressNameChefprovision'))]"
                        },
                        "subnet": {
                            "id": "[parameters('subnet3Ref')]"
                        }
                    }
                }],
                "dnsSettings": {
                    "dnsServers": []
                },
                "enableIPForwarding": false,
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupNameChefdelivery'))]"
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddressNameChefprovision'))]",

                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupNameChefdelivery'))]"
            ]
        }, 
          {
            "type": "Microsoft.Network/networkInterfaces",
            "name": "[parameters('networkInterfaceNameChefdelivery')]",
            "apiVersion": "[parameters('network-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },
            "properties": {
                "ipConfigurations": [{
                    "name": "ipconfig2",
                    "properties": {
                        "privateIPAllocationMethod": "Static",
                        "privateIPAddress": "10.7.2.7",                         
                        "publicIPAddress": {
                            "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddressNameChefdelivery'))]"
                        },
                        "subnet": {
                            "id": "[parameters('subnet3Ref')]"
                        }
                    }
                }],
                "dnsSettings": {
                    "dnsServers": []
                },
                "enableIPForwarding": false,
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupNameChefdelivery'))]"
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddressNameChefdelivery'))]",

                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupNameChefdelivery'))]"
            ]
        },

          {
            "type": "Microsoft.Network/networkInterfaces",
            "name": "[parameters('networkInterfaceNameChefbuild1')]",
            "apiVersion": "[parameters('network-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },
            "properties": {
                "ipConfigurations": [{
                    "name": "ipconfig3",
                    "properties": {
                        "privateIPAllocationMethod": "Static",
                        "privateIPAddress": "10.7.2.10",                         
                        "publicIPAddress": {
                            "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddressNameChefbuild1'))]"
                        },
                        "subnet": {
                            "id": "[parameters('subnet3Ref')]"
                        }
                    }
                }],
                "dnsSettings": {
                    "dnsServers": []
                },
                "enableIPForwarding": false,
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupNameChefdelivery'))]"
                }
            },
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddressNameChefbuild1'))]",

                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupNameChefdelivery'))]"
            ]
        },
    
        {
            "type": "Microsoft.Network/networkSecurityGroups",
            "name": "[parameters('networkSecurityGroupNameChefdelivery')]",
            "apiVersion": "[parameters('network-api-version')]",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },
            "properties": {
                "securityRules": [{
                    "name": "all",
                    "properties": {
                        "protocol": "Tcp",
                        "sourcePortRange": "*",
                        "destinationPortRange": "*",
                        "sourceAddressPrefix": "*",
                        "destinationAddressPrefix": "*",
                        "access": "Allow",
                        "priority": 1010,
                        "direction": "Inbound"
                    }
                }
                 ]
            },
            "dependsOn": []
        }, {
            "type": "Microsoft.Network/publicIPAddresses",
            "name": "[parameters('publicIPAddressNameChefprovision')]",
            "apiVersion": "2015-06-15",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },

            "dependsOn": []
        },
        {
            "type": "Microsoft.Network/publicIPAddresses",
            "name": "[parameters('publicIPAddressNameChefbuild1')]",
            "apiVersion": "2015-06-15",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },

            "dependsOn": []
        },
        {
            "type": "Microsoft.Network/publicIPAddresses",
            "name": "[parameters('publicIPAddressNameChefdelivery')]",
            "apiVersion": "2015-06-15",
            "location": "[parameters('location')]",
            "tags": {
                "program": "[parameters('tagvalues').program]",
                "project": "[parameters('tagvalues').project]"
            },

            "dependsOn": []
        }


    ]
}
