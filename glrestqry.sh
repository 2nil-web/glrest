#!/bin/bash

TOKGLDLA=glpat-7vNxDcFXHX_jhdd6GsLK
URI=https://gitlab.com/api/v4
PFX_CMD="curl -s ${URI}"
PFX_CMD_TOK="curl -s --header 'PRIVATE-TOKEN: ${TOKGLDLA}' ${URI}"

page=1
project="dummy"
rm -f projectList.txt
while [ "project" != "[]" ]
do
#  CMD="${PFX_CMD}/projects?per_page=100&page=$page"
  CMD="${PFX_CMD}/projects/?simple=yes&private=true&per_page=100&page=$page"
  echo ${CMD}
#  ${CMD} | jq '.[]' >> projectList.txt
  ${CMD} | jq -f filter.jq >> projectList.csv
  let page++
done

if false
then
${PFX_CMD}/projects
${PFX_CMD_TOK}/projects/37754240/repository/contributors
${PFX_CMD_TOK}/projects/37754240/repository/tree
${PFX_CMD_TOK}/users/9930598/projects

jq -f filter.jq myglrep.txt >myglrep.csv
fi
