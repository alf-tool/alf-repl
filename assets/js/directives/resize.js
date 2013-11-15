alfRepl.directive('resize', function ($window) {
  return function (scope,element) {
    function applyResizing() {
      element.css("height", parseInt($window.innerHeight) - 150);
    }
    angular.element($window).bind('resize', function(){
      scope.$apply(function() { applyResizing(); });
    });
    applyResizing();
  }
});
