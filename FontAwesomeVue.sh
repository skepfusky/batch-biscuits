#!/usr/bin/bash

# Installs Font Awesome as dev dependencies
npm install --save @fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/free-brands-svg-icons @fortawesome/free-regular-svg-icons

# Force installs the Vue FA as a dev dependency
# Because it'll throw an error of a missing dependency or something like that
# But I'll 100% work just fine lol
npm install --save --force @fortawesome/vue-fontawesome