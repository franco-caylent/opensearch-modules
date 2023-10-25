variable "name" {
  type        = string
  description = "The name to use for the role and role"
}

##########################################################################################
## The tool used for hashing will be deprecated in the next major release of OpenSearch ##
## https://github.com/opensearch-project/security/issues/1755                           ##
##########################################################################################
variable "password_hash" {
  type        = string
  description = "The BCrypt hashed password to use for the user. See https://opensearch.org/docs/2.11/security/configuration/yaml/#internal_usersyml"
}

variable "attributes" {
  type        = map(string)
  description = "Attributes to add to the user"
  default     = null
}

variable "cluster_permissions" {
  type        = list(string)
  description = "Cluster permissions to add to the role. See https://opensearch.org/docs/latest/security/access-control/permissions/#cluster-permissions"
  default = null
}

variable "index_permissions" {
  type        = map(map(any))
  description = "Allowed actions to add to the role. See https://opensearch.org/docs/latest/security/access-control/permissions/#index-permissions"
}
