var gulp = require('gulp');
var sass = require('gulp-sass');
var bs = require('browser-sync').create();

gulp.task('browsersync', function() {
    bs.init({
        server: {
            baseDir: "./"
        }
    });
    gulp.watch("*.html").on('change', bs.reload);
});
gulp.task('watch', ['browsersync'], function () {
    gulp.watch("scss/*.scss", ['sass']);
    gulp.watch("*.html").on('change', bs.reload);
});
