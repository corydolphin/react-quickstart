gulp       = require 'gulp'
gutil      = require 'gulp-util'
nodemon    = require 'gulp-nodemon'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
watchify   = require 'watchify'
streamify  = require 'gulp-streamify'
uglify     = require 'gulp-uglify'

getBundle = ->
  browserify({ debug:true, cache: {}, packageCache: {}, fullPaths: true})
  .add('./src/app.coffee')
  .transform( 'coffeeify')

gulp.task "watchify", ->
  bundler = watchify getBundle()

  updater = (b) ->
    bundler.bundle()
    .pipe source("bundle.js")
    .pipe gulp.dest("./assets")

  timer = (time) ->
    gutil.log 'Bundle update. Elapsed time:', gutil.colors.cyan(time), 'ms'

  bundler.on 'update', updater
  bundler.on 'time', timer

  updater()

gulp.task "production", ->
  getBundle()
  .bundle()
  .pipe source("bundle.js")
  .pipe streamify(uglify())
  .pipe gulp.dest('assets')

gulp.task "watch", ->
  nodemon(
    script: "server.coffee"
    ext: "coffee"
    ignore: [
      "assets/bundle.js"
      "**/node_modules/**/*"
    ]
  )

gulp.task 'default', ['watch', 'watchify']