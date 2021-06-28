# Example Porter Bundle

A basic example k8s deploy on GCP using terraform


# Contents

## How to use

### Install Porter

See [Porter docs](https://porter.sh/install/) for more details

```bash
curl -L https://cdn.porter.sh/latest/install-linux.sh | bash
```

### Setup Google Cloud Service Account

A GCP service account is needed with the appropriate roles for GKE admin.

```bash
gcloud iam service-accounts create porter-deploy --description="for porter deployments" --display-name="porter-deploy"

gcloud iam service-accounts keys create ~/.config/gcloud-porter-deploy-private-key.json --iam-account=porter-deploy@${GCP_PROJECT_ID}.iam.gserviceaccount.com

gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} \
    --member="serviceAccount:porter-deploy@${GCP_PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/container.clusterAdmin"

gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} \
    --member="serviceAccount:porter-deploy@${GCP_PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"

gcloud projects add-iam-policy-binding ${GCP_PROJECT_ID} \
    --member="serviceAccount:porter-deploy@${GCP_PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/compute.instanceAdmin.v1"
```

### Create Porter Credentials

Generate a set of credentials to pass into porter.

```
porter credential generate porter-terraform-example --reference ghcr.io/bdegeeter/porter-terraform-example:v0.1.0
```
```
Generating new credential porter-terraform-example from bundle porter-terraform-example
==> 1 credentials required for bundle porter-terraform-example
? How would you like to set credential "gcloud-key-file"
  file path
? Enter the path that will be used to set credential "gcloud-key-file"
  $HOME/.config/gcloud-porter-deploy-private-key.json
```

### Install Bundle

```
porter install --reference ghcr.io/bdegeeter/porter-terraform-example:v0.1.0 --cred porter-terraform-example --param="gcp_project_id=${GCP_PROJECT_ID}"
```

### Uninstall Bundle

```
porter uninstall --reference ghcr.io/bdegeeter/porter-terraform-example:v0.1.0 --cred porter-terraform-example --param="gcp_project_id=${GCP_PROJECT_ID}"
```
