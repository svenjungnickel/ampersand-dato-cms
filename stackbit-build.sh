#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc0866082692d0013d1df24/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc0866082692d0013d1df24
curl -s -X POST https://api.stackbit.com/project/5dc0866082692d0013d1df24/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dc0866082692d0013d1df24/webhook/build/publish > /dev/null
