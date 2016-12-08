(function () {
    'use strict';

    angular
        .module('myApp')
        .controller('SliceController', SliceController)

  SliceController.$inject = ['UserService', '$rootScope', '$scope', '$http'];
function SliceController(UserService, $rootScope, $scope, $http) {
  var vm = this;
  vm.user = null;
  vm.allUsers = [];
  vm.deleteUser = deleteUser;

  initController();

  function initController() {
      loadCurrentUser();
      loadAllUsers();
  }

  function loadCurrentUser() {
      UserService.GetByUsername($rootScope.globals.currentUser.username)
          .then(function (user) {
              vm.user = user;
          });
  }

  function loadAllUsers() {
      UserService.GetAll()
          .then(function (users) {
              vm.allUsers = users;
          });
  }

  function deleteUser(id) {
      UserService.Delete(id)
      .then(function () {
          loadAllUsers();
      });
  }

  var serviceUrl = 'http://localhost:8080/teamdank/rest/hello/phone/';
  $scope.search = function() {
  var request = { method: 'GET',
  url: serviceUrl + $scope.name };
  $http(request).then(
  function successCallback(response) { //success
  $scope.phone = response.data.phone;
  vm.phone = $scope.phone;},
  function errorCallback(response) { //error $scope.phone = 'An unknow problem happened.';
             });
       } //search
var sliceUrl = 'http://localhost:8080/teamdank/rest/slice/';
     $scope.callSlice = function() {
     var request =
     { method: 'GET',
     url: sliceUrl 
     };
     $http(request).then(
     function successCallback(response) { //success
     vm.slice = response.data;
     console.log(vm.slice)
     },
     function errorCallback(response) { //error $scope.phone = 'An unknow problem happened.';
                });
          } //search //PhoneCont
} //PhoneCont


})();
