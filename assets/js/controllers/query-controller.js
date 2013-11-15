function QueryController($scope, $http, $filter, $window, $timeout) {

  $scope.mode     = "data";
  $scope.error    = "";
  $scope.src      = "";
  $scope.result   = "";
  $scope.format   = "text/plain";
  $scope.inProgress = false;
  $scope.waitTimer = null;

  $scope.init = function(){
    $scope.editor.focus();
  }

  $scope.runQuery = function(){
    var qry = $scope.src;
    if ($scope.inProgress) {
      $scope.result = "in progress...";
      $timeout.cancel($scope.waitTimer);
      $scope.waitTimer = $timeout($scope.runQuery, 200);
    } else {
      if (!qry) { return; }
      $scope.inProgress = true;
      $http({
        method: "POST",
        url: "/query/" + $scope.mode,
        data: qry,
        headers: { "Accept": $scope.format }
      })
      .success(function(data){
        if (qry == $scope.src){
          $scope.result = data;
          $scope.error = "";
        }
        $scope.inProgress = false;
      })
      .error(function(data){
        if (qry == $scope.src){
          $scope.result = "";
          $scope.error = data;
        }
        $scope.inProgress = false;
      });
    }
  }
  $scope.$watch("format", $scope.runQuery);
  $scope.$watch("mode",   $scope.runQuery);
  $scope.$watch("src",    $scope.runQuery);

  $scope.bookmark = function(){
    var qry = $filter("atob")($scope.src);
    $window.location = "/?src=" + qry;
  }

  $scope.aceLoaded = function(editor) {
    $scope.editor = editor;
    editor.getSession().setTabSize(2);
    $scope.init();
  };
}
