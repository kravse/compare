
// ----------------------------------------
// Include CoffeeScript Compiler
// ----------------------------------------
require('coffee-script/register');

// ----------------------------------------
// Require Gulp Utilities
// ----------------------------------------
var util = require('gulp-util');

// ----------------------------------------
// Log our use of a different Gulpfile
// ----------------------------------------
var gulpfile = 'Gulpfile.coffee';
util.log('Using file', util.colors.magenta(gulpfile));

// ----------------------------------------
// Include our Gulpfile.coffee
// ----------------------------------------
require('./' + gulpfile);
