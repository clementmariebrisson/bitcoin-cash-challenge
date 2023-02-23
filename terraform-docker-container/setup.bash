# INITIALIZE THE DIRECTORY
terraform init -upgrade

#FORMAT AND VALIDATE THE CONFIGURATION
	# Using consistent formatting 
terraform fmt
	# Validate your configuration
terraform validate
sleep 1

# CREATE INFRASTRUCURE
	# Apply the configuration
terraform apply
sleep 10
	# Inspect the current state
terraform show