var gulp = require('gulp'),
    gutil = require('gulp-util'),
    browserify = require('gulp-browserify'),
    concat = require('gulp-concat'),
    nodemon = require('gulp-nodemon'),
    uglify = require('gulp-uglify');

// Browserify task
gulp.task('browserify', function() {
  gulp.src(['src/client.js'])
  .pipe(browserify({
    insertGlobals: true,
    debug: true
  }))
  // Bundle to a single file
  .pipe(concat('bundle.js'))
  // Output it to our dist folder
  .pipe(gulp.dest('assets/'));
});

// Browserify task
gulp.task('production', function() {
  gulp.src(['src/client.js'])
  .pipe(browserify({
    insertGlobals: true,
    debug: true
  }))
  // Bundle to a single file
  .pipe(concat('bundle.min.js'))
  .pipe(uglify())

  // Output it to our dist folder
  .pipe(gulp.dest('assets/'));
});



gulp.task('develop', function () {
  nodemon({ script: 'server.js', ext: 'js', ignore:['assets/bundle.js', '**/node_modules/**/*']})
    .on('change', ['browserify'])
    .on('restart', function () {
      console.log('restarted!')
    })
})