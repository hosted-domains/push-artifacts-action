#!/usr/bin/env bash
#set -e

echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
echo "GITHUB_RUN_NUMBER: ${GITHUB_RUN_NUMBER}"
echo "GITHUB_RUN_ATTEMPT: ${GITHUB_RUN_ATTEMPT}"

echo "INPUT_PATH: ${INPUT_PATH}"
echo "INPUT_HOST: ${INPUT_HOST}"
#echo "INPUT_USER: ${INPUT_USER}"
#echo "INPUT_PASS: ${INPUT_PASS}"
echo "INPUT_PORT: ${INPUT_PORT}"
echo "INPUT_BASE: ${INPUT_BASE}"

REPO_RUN_PATH="${GITHUB_REPOSITORY}/${GITHUB_RUN_NUMBER}-${GITHUB_RUN_ATTEMPT}"

echo "REPO_RUN_PATH: ${REPO_RUN_PATH}"

mkdir -p "${GITHUB_REPOSITORY}"
mv "${INPUT_PATH}" "${REPO_RUN_PATH}"

ls -lAhR "${REPO_RUN_PATH}"

sshpass -p "${INPUT_PASS}" \
scp -P "${INPUT_PORT}" -o StrictHostKeyChecking=no -r \
    "${REPO_RUN_PATH}" "${INPUT_USER}@${INPUT_HOST}:${INPUT_BASE}/${REPO_RUN_PATH}"
