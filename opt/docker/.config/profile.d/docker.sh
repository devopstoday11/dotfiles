#
# Initialize docker environment
#

if ! command_exists "docker"; then
  return 1
fi

# Change the docker config location
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

#
# Aliases
#

alias dk='docker'

# Images
alias di='docker images'
alias dbuild='docker build'
alias dhist='docker history'
alias dpull="docker pull"
alias dpull_all='docker images --format "{{.Repository}}:{{.Tag}}" | grep ':latest' | xargs -L1 docker pull'
alias drmi='docker rmi'
alias drmi_all='docker rmi $* $(docker images -a -q)'
alias drmi_dang='docker rmi $* $(docker images -q -f dangling=true)'
alias drmi_tags='docker-rmi-all-tags'

# Registry
alias di-tags='docker-tags $*'

# Containers
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpsc='docker ps -a --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias dpsl='docker ps -l $*'
alias dstart='docker start $*'
alias dstop='docker stop $*'
alias dstop_all='docker stop $* $(docker ps -q -f status=running)'
alias drestart='docker restart $*'
alias dattach='docker attach $*'
alias dexec='docker exec'
alias drun='docker run $*'
alias drunit='docker run -it $*'
alias dinspect='docker inspect $*'
alias dlog='docker logs'
alias dip='docker inspect --format="{{.NetworkSettings.IPAddress}}" $*'
alias drm='docker rm'
alias drm_stopped='docker rm -v $* $(docker ps -q -f status=exited)'
alias drm_all='docker rm -v $* $(docker ps -a -q)'

# Volumes
alias dvls='docker volume ls $*'
alias dvrm='docker volume rm $*'
alias dvrm_all='docker volume rm $(docker volume ls -q)'
alias dvrm_dang='docker volume rm $(docker volume ls -q -f dangling=true)'

# docker-compose
alias dco='docker-compose'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcps='docker-compose ps'
alias dcr='docker-compose run --rm'
alias dcrs='docker-compose run --rm --service-ports'
alias dcrm='docker-compose rm'
alias dcstart='docker-compose start'
alias dcstop='docker-compose stop'
alias dcrestart='docker-compose restart'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dcdn='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dctail='docker-compose logs --tail=all -f'

# docker machine
alias dm="docker-machine"
alias dmls="docker-machine ls"

#
# Remove all tags for image name
#
# usage:
#   docker_rmi_all_tags my_image
#
function docker_rmi_all_tags() {
  docker images | grep "$1" | awk '{system("docker rmi " "'"$1:"'" $2)}'
}
