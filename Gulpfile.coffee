gulp       = require("gulp")
gutil      = require("gulp-util")
browserify = require("gulp-browserify")
concat     = require("gulp-concat")
nodemon    = require("gulp-nodemon")
uglify     = require("gulp-uglify")
rename     = require("gulp-rename")

gulp.task "bundle", ->
  gulp.src("src/app.coffee", read: false)
    .pipe(browserify({transform: ["coffeeify"], extensions: [".coffee"]}))
    .pipe(rename("bundle.js"))
    .pipe gulp.dest("assets/")


gulp.task "watch", ->
  nodemon(
    script: "server.coffee"
    ext: "coffee"
    ignore: [
      "assets/bundle.js"
      "**/node_modules/**/*"
    ]
  ).on("change", ["bundle"]).on "restart", ->
    console.log "restarted!"

gulp.task 'default', ['bundle', 'watch']