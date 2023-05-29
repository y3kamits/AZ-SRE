#Random string resource
resource "random_string" "Random_RG" {
  length  = 4
  special = false
  upper   = false
}
