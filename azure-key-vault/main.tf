data "azurerm_client_config" "current" {
}
resource "azurerm_key_vault" "vault" {
  name                = "${var.project_name}-vault-${var.env_name}"
  location                    = var.location
  resource_group_name         = var.rg
  enabled_for_disk_encryption = true
  tenant_id                   = "<tenant_id>"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = "<tenant_id>"
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Import", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey",
    ]

    secret_permissions = [
      "Get", "List", "Backup", "Delete", "Purge", "Recover", "Restore", "Set",
    ]

    storage_permissions = [
      "Get", "List", "Backup", "Delete", "DeleteSAS", "GetSAS", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update",
    ]

    certificate_permissions = [
        "Get", "List", "Backup", "Create", "Delete", "DeleteIssuers", "GetIssuers", "Import", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update",
    ]
  }
}