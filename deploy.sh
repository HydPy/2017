#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_changes() {
  git clone https://github.com/HydPy/hydpy.github.io.git pyconf-websites
  cd pyconf-websites
  rm -rf 2017
  mkdir 2017
  cp -rf ../_site/* 2017/
  git add .
  git commit -m "Travis build: hydpyconf2017-$TRAVIS_BUILD_NUMBER"
}

push_files_to_github() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/HydPy/hydpy.github.io.git
  git push origin-pages master
}

setup_git
commit_changes
push_files_to_github
