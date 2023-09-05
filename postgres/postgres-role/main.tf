
provider "postgresql" {
  host            = "127.0.0.1"
  port            = "5434"
  database        = "postgres"
  username        = "${var.db_username}"
  password        = "${var.db_master_password}"
  sslmode         = "require"
  connect_timeout = 15
  superuser = false
}

resource "postgresql_role" "readonly" {                                                                                                                                                      
  name = "readonly"                                                                                                                                                               
}                                                                                                                                                                                            

resource postgresql_grant "readonly_public" {                                                                                                                                                
  database    = "postgres"                                                                                                                                                                    
  role        = postgresql_role.readonly.name                                                                                                                                                
  schema      = "public"                                                                                                                                                                     
  object_type = "table"                                                                                                                                                                      
  privileges  = ["SELECT"]                                                                                                                                                              
}   

resource "postgresql_role" "readonly_user" {                                                                                                                                                 
  name     = "${var.db_username}-db-role"                                                                                                                                                                 
  password = "${var.db_read_only_password}"                                                                                                                                                             
  login    = true                                                                                                                                                                            
  roles = [postgresql_role.readonly.name]                                                                                                                                               
}
