#!/bin/bash

ts=$(date +%s)
current_branch=$1
git branch ${current_branch}_${ts}
git checkout ${current_branch}_${ts}

