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

variable "index_template_mappings" {
  type        = string
  description = "The index template mappings to use in json format."
  default = "{}"
}

variable "index_template_shards" {
  type        = number
  description = "The index template shards to use."
  default = 1
}

variable "index_template_replicas" {
  type        = number
  description = "The index template replicas to use."
  default = 1
}

variable "create_data_stream" {
  type        = bool
  description = "Creates a data stream so applications always write to the same index"
  default = false
}