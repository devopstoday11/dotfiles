#
# Postgres
#

# Create XDG directories if needed
[[ ! -d "${XDG_CONFIG_HOME}/pg" ]] && mkdir -p "${XDG_CONFIG_HOME}/pg"
[[ ! -d "${XDG_CACHE_HOME}/pg" ]] && mkdir "${XDG_CACHE_HOME}/pg"

# XDG specification
export PSQLRC="${XDG_CONFIG_HOME}/pg/psqlrc"
export PSQL_HISTORY="${XDG_CACHE_HOME}/pg/psql_history"
export PGPASSFILE="${XDG_CONFIG_HOME}/pg/pgpass"
if [[ -f ${XDG_CONFIG_HOME}/pg/pg_service.conf ]]; then
  export PGSERVICEFILE="${XDG_CONFIG_HOME}/pg/pg_service.conf"
fi

# Add postgres binaries to path
if [[ -d "/usr/local/opt/libpq/bin" ]]; then
  prepend_path "/usr/local/opt/libpq/bin"
fi
