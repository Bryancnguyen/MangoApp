var mainApp = angular.module('myApp', ['ngRoute']);

mainApp.controller('mainController', ['$scope', function($scope)
{
    $scope.name = 'YAY';
}]);

mainApp.config(function($routeProvider) {
  $routeProvider
  .when("/", {
    templateUrl : "index.html"
  })
  .when("/slice", {
    templateUrl : "/pages/slice.html"
  })
  .when("/login", {
    templateUrl : "/pages/login.html"
  })
  .when("/register", {
    templateUrl : "/pages/register.html"
  })
    .when("/lucky", {
    templateUrl : "/pages/lucky.html"
  })
    .when("/404",
    {
        templateUrl: "/pages/404.html"
    });
});