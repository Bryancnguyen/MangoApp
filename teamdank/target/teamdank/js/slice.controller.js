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
  $scope.sliceBoolean = false;
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
var sliceUrl = 'http://localhost:8080/teamdank/rest/hello/slice/';
     $scope.callSlice = function() {
     var request =
     { method: 'GET',
     url: sliceUrl
     };
     $http(request).then(
     function successCallback(response) { //success
     vm.slice = response.data
     vm.tempimagefilepath = ""
     if(vm.slice === "Clubbing")
     {
      vm.tempimagefilepath = "img/clubbing.jpg"
     }
     else if(vm.slice === "Star Gazing")
     {
      vm.tempimagefilepath = "img/stargazing.jpg"
     }
     else if(vm.slice === "Bar Hopping")
     {
      vm.tempimagefilepath = "img/barhopping.jpg"
     }
     else if(vm.slice === "Amusement Park")
     {
      vm.tempimagefilepath = "img/amuse.jpg"
     }
     else if(vm.slice === "Museum")
     {
      vm.tempimagefilepath = "img/museum.jpg"
     }
     else if(vm.slice === "Bowling")
     {
      vm.tempimagefilepath = "img/bowling.jpg"
     }
     else if(vm.slice === "Netflix and Chill")
     {
      vm.tempimagefilepath = "img/netflix.gif"
     }
     else
     {
       vm.tempimagefilepath = "img/image-not-found.png"
     }
     console.log(vm.slice)
     },
     function errorCallback(response) { //error $scope.phone = 'An unknow problem happened.';
                });
          } //search //PhoneCont
} //PhoneCont


})();
