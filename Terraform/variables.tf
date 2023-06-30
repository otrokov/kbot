variable "GOOGLE_REGION" {
  type        = string
  default     = "asia-east1-a"
  description = "GCP region to use"
}

variable "GOOGLE_PROJECT" {
  type        = string
  description = "GCP project name"
}

variable "GKE_NUM_NODES" {
  type        = number
  default     = 1
  description = "GKE nodes"

}
variable "GKE_MACHINE_TYPE" {
  type        = string
  default     = "g1-small"
  description = "Machine type"
}

variable "algorithm" {
  type        = string
  default     = "ECDSA"
  description = "The cryptographic algorithm (e.g. RSA, ECDSA)"
}

variable "ecdsa_curve" {
  type        = string
  default     = "P256"
  description = "The elliptic curve (e.g. P256, P384, P521)"
}

variable "GITHUB_OWNER" {
  type = string
  default = "otrokov"
  description = "Github username"
}

variable "FLUX_GITHUB_REPO" {
  type = string
  default = "flux-gitops"
  description = "GitHub repository to store Flux manifests"
}

variable "GITHUB_TOKEN" {
  type = string
  description = "The token used to authenticate with the Git repository"
}

