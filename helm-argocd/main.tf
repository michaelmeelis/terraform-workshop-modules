resource "random_password" "argocd-server-secretkey" {
  length  = 64
  special = false
}
# Fix to prevent bcrypt of running again and again https://github.com/hashicorp/terraform-provider-random/issues/102
resource "random_password" "argocd-admin-password" {
  length  = 64
  special = false
}

resource "null_resource" "argocd-admin-password-bcrypt" {
  triggers = {
    orig = random_password.argocd-admin-password.result
    pw   = bcrypt(random_password.argocd-admin-password.result)
    time = timestamp()
  }

  lifecycle {
    ignore_changes = [triggers["pw"], triggers["time"]]
  }
}
locals {
  app_name                = "argocd"
  argocd_values           = {
    argocd                         = var.argocd
    argocd_admin_password_mtime    = null_resource.argocd-admin-password-bcrypt.triggers["time"]
    argocd_admin_password_bcrypted = null_resource.argocd-admin-password-bcrypt.triggers["pw"]
    argocd_server_secretkey        = random_password.argocd-server-secretkey.result
  }
}

resource "kubernetes_namespace" "kubernetes-argocd-namespace" {
  metadata {
    name = local.app_name
  }
}

resource "helm_release" "argocd" {
  chart      = "argo-cd"
  name       = "argocd"
  namespace  = kubernetes_namespace.kubernetes-argocd-namespace.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  version    = var.argocd.helm_version
  values     = [
    templatefile("${path.module}/resources/values-tmpl.yaml", local.argocd_values)
  ]
  timeout = 900
}