var mainApp = angular.module('myApp', ['ngRoute']);

mainApp.controller('mainController', ['$scope', function($scope)
{
    $scope.name = 'YAY';
}]);

mainApp.config(function($routeProvider) {
  $routeProvider
  .get("/", {
    templateUrl : "index.html"
  })
  .get("/slice", {
    templateUrl : "slice.html"
  })
  .when("/login", {
    templateUrl : "login.html"
  })
  .when("/register", {
    templateUrl : "register.html"
  })
    .when("/lucky", {
    templateUrl : "lucky.html"
  })
    .when("/404",
    {
        templateUrl: "404.html"
    });
});