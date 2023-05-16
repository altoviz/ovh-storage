#!/bin/sh
# set -x

echo OVH credentials initialization

crendentials_private="./credentials-private.sh"
if [ -f $crendentials_private ]; then
  echo OVH reading private credentials
  . $crendentials_private 
else
  echo $crendentials_private file is missing. Creating the file. Check readme.md for more information
  echo "#!/bin/sh" >> $crendentials_private
  echo "export OVH_APPLICATION_KEY_PRIVATE=\"<Your Application Private Key>\"" >> $crendentials_private
  echo "export OVH_APPLICATION_SECRET_PRIVATE=\"<Your Application Secret>\"" >> $crendentials_private
  echo "export OVH_CONSUMER_KEY_PRIVATE=\"<Your Consummer Key>\"" >> $crendentials_private
  echo "export OVH_REGION_PRIVATE=\"gra\"" >> $crendentials_private
  echo "export OVH_ENDPOINT_PRIVATE=\"ovh-eu\"" >> $crendentials_private
  chmod +x $crendentials_private
  exit 1
fi

export OVH_APPLICATION_KEY=${OVH_APPLICATION_KEY_PRIVATE}
export OVH_APPLICATION_SECRET=${OVH_APPLICATION_SECRET_PRIVATE}
export OVH_CONSUMER_KEY=${OVH_CONSUMER_KEY_PRIVATE}
export OVH_REGION=${OVH_REGION_PRIVATE:="gra"}
export OVH_ENDPOINT=${OVH_ENDPOINT_PRIVATE:="ovh-eu"}

terraform_folder="./setup"
export OVH_S3_ACCESS_KEY_ID=$(terraform -chdir=${terraform_folder} output -raw s3_access_key_id || true)
export OVH_S3_SECRET_ACCESS_KEY=$(terraform -chdir=${terraform_folder} output -raw s3_secret_access_key || true)
export OVH_S3_BUCKET=$(terraform -chdir=${terraform_folder} output -raw s3_bucket || true)
export OVH_S3_REGION=$(terraform -chdir=${terraform_folder} output -raw s3_region || true)
