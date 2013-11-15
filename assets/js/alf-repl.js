'use strict';

var alfRepl = angular.module('alf.repl', ['ui.ace']);

alfRepl.config(function($locationProvider){
  $locationProvider.html5Mode(true);
});

alfRepl.filter('atob', function() {
  return function(input) {
    return btoa(input);
  };
});
