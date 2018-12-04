var gulp  = require('gulp');
var sass = require('gulp-sass');
//var imagemin = require('gulp-imagemin');
//var responsive = require('gulp-responsive');


gulp.task('styles', function() {
    return gulp.src('src/**/*.scss')
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(gulp.dest('_book'));
});

gulp.task("watch", function(){
  gulp.watch("src/**/*.scss", ["styles"])
});

// gulp.task("default", ["styles"])

/*
gulp.task("responsive-images", () =>
  gulp.src("src/assets/ * * / *.{jpg,png}")
    .pipe(responsive({}))
    .pipe(gulp.dest("dist/assets/image-preoptimized"))
);


gulp.task('imagemin', () =>
    gulp.src('src/assets/* * / * ')
        .pipe(imagemin([
          imagemin.gifsicle({interlaced: true}),
          imagemin.jpegtran({progressive: true}),
          imagemin.optipng({optimizationLevel: 5}),
          imagemin.svgo({
              plugins: [
                  {removeViewBox: true},
                  {cleanupIDs: false}
              ]
          })
]))
        .pipe(gulp.dest('dist/assets/img'))
);
*/
/*
gulp.task('assets', gulp.parallel(
  'images',
  'styles',
  'scripts'
));

gulp.task('build', gulp.series(
  // 'get:data',
  'generate',
  'assets'
)); */
