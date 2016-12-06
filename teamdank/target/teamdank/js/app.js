var mainApp = angular.module('myApp', ['ngRoute','ngCookies']);

mainApp.controller('mainController', ['$scope', function($scope, $http)
{
  $scope.search = function() {
  var request = { method: 'GET',
  url: serviceUrl + $scope.name };
  $http(request).then(
  function successCallback(response) { //success
  $scope.phone = response.data.phone; },
  function errorCallback(response) { //error $scope.phone = 'An unknow problem happened.';
             });
       }
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

mainApp.factory('UserService', function()
 {
    UserService.$inject = ['$http'];
    function UserService($http) {
        var service = {};

        service.GetAll = GetAll;
        service.GetById = GetById;
        service.GetByUsername = GetByUsername;
        service.Create = Create;
        service.Update = Update;
        service.Delete = Delete;

        return service;

        function GetAll() {
            return $http.get('/api/users').then(handleSuccess, handleError('Error getting all users'));
        }

        function GetById(id) {
            return $http.get('/api/users/' + id).then(handleSuccess, handleError('Error getting user by id'));
        }

        function GetByUsername(username) {
            return $http.get('/api/users/' + username).then(handleSuccess, handleError('Error getting user by username'));
        }

        function Create(user) {
            return $http.post('/api/users', user).then(handleSuccess, handleError('Error creating user'));
        }

        function Update(user) {
            return $http.put('/api/users/' + user.id, user).then(handleSuccess, handleError('Error updating user'));
        }

        function Delete(id) {
            return $http.delete('/api/users/' + id).then(handleSuccess, handleError('Error deleting user'));
        }

        // private functions

        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
    }
});

mainApp.controller('RegistrationController', ['$scope', 'UserService', '$location', '$rootScope', 'FlashService', function(UserService, $location, $rootScope, FlashService)
{
  var vm = this;

        vm.register = register;

        function register() {
            vm.dataLoading = true;
            UserService.Create(vm.user)
                .then(function (response) {
                    if (response.success) {
                        FlashService.Success('Registration successful', true);
                        $location.path('/login');
                    } else {
                        FlashService.Error(response.message);
                        vm.dataLoading = false;
                    }
                });
}}]);
