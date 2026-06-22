# JetBrains Toolbox
export PATH="$PATH:/Users/masaki/Library/Application Support/JetBrains/Toolbox/scripts"

# colima
export DOCKER_HOST=$(docker context inspect colima -f '{{.Endpoints.docker.Host}}')

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
