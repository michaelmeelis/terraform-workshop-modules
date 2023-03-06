variable "argocd" {
  default = {
    helm_version           = "4.9.0"
    version                = "v2.4.0"
  }
  type = object({
    helm_version           = string
    version                = string
  })
}
