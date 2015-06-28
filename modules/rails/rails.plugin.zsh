# ===========================================================
# Rails aliases & functions
#
# These are meant to compliment existing oh-my-zsh plugins:
# ===========================================================

function remote_console() {
  /usr/bin/env ssh $1 "(cd $2 && ruby script/console production)"
}

# start rails in the current dir
start_rails() {
  filename=".railsrc"

  if [ ! -f $filename ]; then
    echo $fg[yellow]"Rails config '${filename}' not found"
    return
  fi

  # TODO - Implement more reliable seraching for 'export BYEBUGPORT=####'
  port=$(head -n 1 $filename)

  # echo "Starting rails on localhost:${port}"
  bundle exec rails s -p $port
}

alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'

# Rails aliases
alias rc='bundle exec rails console'
alias rd='bundle exec rails destroy'
alias rdb='bundle exec rails dbconsole'
alias rg='bundle exec rails generate'
alias rgm='bundle exec rails generate migration'
alias rp='bundle exec rails plugin'
alias ru='bundle exec rails runner'
alias rs='bundle exec rails server'
alias rsd='bundle exec rails server --debugger'

# Rake aliases
alias rdm='bundle exec rake db:migrate'
alias rdms='bundle exec rake db:migrate:status'
alias rdr='bundle exec rake db:rollback'
alias rdc='bundle exec rake db:create'
alias rds='bundle exec rake db:seed'
alias rdd='bundle exec rake db:drop'
alias rdrs='bundle exec rake db:reset'
alias rdtc='bundle exec rake db:test:clone'
alias rdtp='bundle exec rake db:test:prepare'
alias rdmtc='bundle exec rake db:migrate db:test:clone'

alias rlc='bundle exec rake log:clear'
alias rn='bundle exec rake notes'
alias rr='bundle exec rake routes'

alias testdropdb="bundle exec rake db:drop RAILS_ENV=test"
alias testcreatedb="bundle exec rake db:create RAILS_ENV=test"
alias testloaddb="bundle exec rake db:schema:load RAILS_ENV=test"
alias testreset="testdropdb; testcreatedb; testloaddb; testprep"
alias testprep="bundle exec rake db:migrate RAILS_ENV=test"
alias schemas="bundle exec rake db:migrate; testprep"

alias be="bundle exec"
alias rspec="bundle exec rspec"

alias choo="start_rails"