###
kody - http://jh3y.github.io/kody

Npm install - installs all your global npm modules

Licensed under the MIT license

Jhey Tompkins (c) 2014.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###
colors = require "colors"
shell = require "shelljs"
pkg = require "../../package.json"
utils = require "../utils"

exports.install = install = (KODY_CONFIG)->
  if shell.which("npm").trim() isnt "" and Object.keys(KODY_CONFIG.global_npm_modules).length > 0
    utils.log "Installing npm modules", "prompt"
    utils.log "kody will ask for sudo credentials here just because you are installing node modules globally on your machine", "warn"
    installStr = "sudo npm install -g"
    for module of KODY_CONFIG.global_npm_modules
      installStr += " " + module + "@" + KODY_CONFIG.global_npm_modules[module]
    shell.exec installStr
    utils.log "Npm modules installed globally", "success"