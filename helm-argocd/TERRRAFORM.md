## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | =2.4.0 |
| helm | >= 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 1.1.1 |
| kubernetes | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| argocd\_dex\_version | n/a | `any` | n/a | yes |
| argocd\_helm\_version | n/a | `any` | n/a | yes |
| argocd\_namespace | n/a | `any` | n/a | yes |
| argocd\_redis\_version | n/a | `any` | n/a | yes |
| argocd\_version | n/a | `any` | n/a | yes |
| azure\_tenant\_id | n/a | `any` | n/a | yes |
| environment | n/a | `any` | n/a | yes |
| ingress\_domain | n/a | `any` | n/a | yes |
| oauth2\_proxy\_client\_id | n/a | `any` | n/a | yes |
| oauth2\_proxy\_client\_secret | n/a | `any` | n/a | yes |
| rtl\_product | n/a | `any` | n/a | yes |

## Outputs

No output.
