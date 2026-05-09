# JetBrains Toolbox
export PATH="$PATH:/Users/masaki/Library/Application Support/JetBrains/Toolbox/scripts"

# colima
export DOCKER_HOST=$(docker context inspect colima -f '{{.Endpoints.docker.Host}}')
