var gulp = require('gulp');
var sass = require('gulp-sass');
var bs = require('browser-sync').create();

gulp.task('browsersync', ['sass'], function() {
  bs.init({
  server: {
      baseDir: "./"
  }
    });
});

gulp.task('sass', function () {
    return gulp.src('scss/*.scss')
                .pipe(sass())
                .pipe(gulp.dest('css'))
                .pipe(bs.reload({stream: true}));
});

gulp.task('watch', ['browsersync'], function () {
    gulp.watch("scss/*.scss", ['sass']);
    gulp.watch("*.css").on('change', bs.reload)
    gulp.watch("*.html").on('change', bs.reload);
});
