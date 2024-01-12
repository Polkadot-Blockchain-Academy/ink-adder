const gulp = require("gulp");
const shell = require("gulp-shell");

gulp.task("compile", shell.task("npm run compile"));

gulp.task("watch", function () {
  gulp.watch(["lib.rs", "Cargo.toml"], gulp.series("compile"));
});

gulp.task("default", gulp.series("watch"));
