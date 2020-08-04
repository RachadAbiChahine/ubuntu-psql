#!/usr/bin/bash
DATABASE=${2}
export PGSERVICE=${1}
psql -d ${DATABASE} -A -t -c "select format('vacuum analyse verbose %I.%I;', n.nspname::varchar, t.relname::varchar) FROM pg_class t JOIN pg_namespace n ON n.oid = t.relnamespace WHERE t.relkind = 'r' and n.nspname::varchar = '${DATABASE}' order by 1;"|psql -d ${DATABASE}
