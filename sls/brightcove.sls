
{% set USER = salt['grains.item']('username')['username'] %}
{% set HOME = "/Users/" + USER %}

brew-packages:
  cmd.run:
    - name: brew install awscli
    - unless: brew list awscli

vscode-projects-manager:
  file.managed:
    - name: "{{ HOME }}/Library/Application Support/Code/User/projects.json"
    - source: salt://files/vscode-brightcove-projects.json

# non-Go repos:
bolt-ops:
  git.latest:
    - name: git@github.com:zencoder/bolt-ops.git
    - branch: master
    - target: {{ HOME }}/ws/repos/bolt-ops

bolt-build-base:
  git.latest:
    - name: git@github.com:zencoder/bolt-build-base.git
    - branch: master
    - target: {{ HOME }}/ws/repos/bolt-build-base

bolt-utils:
  git.latest:
    - name: git@github.com:zencoder/bolt-utils.git
    - branch: master
    - target: {{ HOME }}/ws/repos/bolt-utils

bolt-runbook:
  git.latest:
    - name: git@github.com:zencoder/bolt-runbook.git
    - branch: master
    - target: {{ HOME }}/ws/repos/bolt-runbook

bolt-monitoring:
  git.latest:
    - name: git@github.com:zencoder/bolt-monitoring.git
    - branch: master
    - target: {{ HOME }}/ws/repos/bolt-monitoring

bolt-infrastructure:
  git.latest:
    - name: git@github.com:zencoder/bolt-infrastructure.git
    - branch: master
    - target: {{ HOME }}/ws/repos/bolt-infrastructure

fabric-config:
  git.latest:
    - name: git@github.com:zencoder/fabric-config.git
    - branch: master
    - target: {{ HOME }}/ws/repos/fabric-config

# Go repos:
palantir:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/bolt-palantir
    - branch: master
    - name: git@github.com:zencoder/bolt-palantir

bolt-e2e:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/bolt-e2e
    - name: git@github.com:zencoder/bolt-e2e.git
    - branch: master

autobindings:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/autobindings
    - branch: master
    - name: git@github.com:zencoder/autobindings

bolt-jaws-media-lib:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/bolt-jaws-media-lib
    - branch: master
    - name: git@github.com:zencoder/bolt-jaws-media-lib

bolt-billing-aggregator:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/bolt-billing-aggregator
    - branch: master
    - name: git@github.com:zencoder/bolt-billing-aggregator

bolt-fastly:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/bolt-fastly
    - branch: master
    - name: git@github.com:zencoder/bolt-fastly

bolt-sources-api:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/bolt-sources-api
    - branch: master
    - name: git@github.com:zencoder/bolt-sources-api

ddbsync:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/ddbsync
    - branch: master
    - name: git@github.com:zencoder/ddbsync

fabric:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric
    - branch: master
    - name: git@github.com:zencoder/fabric

fabric-license-api:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-license-api
    - branch: master
    - name: git@github.com:zencoder/fabric-license-api

fabric-image-api:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-image-api
    - branch: master
    - name: git@github.com:zencoder/fabric-image-api

fabric-captionorigin:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-captionorigin
    - branch: master
    - name: git@github.com:zencoder/fabric-captionorigin

fabric-common:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-common
    - branch: master
    - name: git@github.com:zencoder/fabric-common

fabric-ingest-processor:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-ingest-processor
    - branch: master
    - name: git@github.com:zencoder/fabric-ingest-processor

fabric-jit-2:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-jit-2
    - branch: master
    - name: git@github.com:zencoder/fabric-jit-2

fabric-jit-api:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-jit-api
    - branch: master
    - name: git@github.com:zencoder/fabric-jit-api

fabric-management-api:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-management-api
    - branch: master
    - name: git@github.com:zencoder/fabric-management-api

fabric-playback-api:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-playback-api
    - branch: master
    - name: git@github.com:zencoder/fabric-playback-api

fabric-pmp4-proxy:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-pmp4-proxy
    - branch: master
    - name: git@github.com:zencoder/fabric-pmp4-proxy

fabric-terminator:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fabric-terminator
    - branch: master
    - name: git@github.com:zencoder/fabric-terminator

fastly-tokens:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/fastly-tokens
    - branch: master
    - name: git@github.com:zencoder/fastly-tokens

go-dash:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/go-dash
    - branch: master
    - name: git@github.com:zencoder/go-dash

go-remote-config:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/go-remote-config
    - branch: master
    - name: git@github.com:zencoder/go-remote-config

gokay:
  git.latest:
    - target: {{ HOME }}/ws/go/src/github.com/zencoder/gokay
    - branch: master
    - name: git@github.com:zencoder/gokay


# aws directory
{{ HOME }}/.aws:
  file.directory

# bento directory
{{ HOME }}/ws/bento:
  file.directory
