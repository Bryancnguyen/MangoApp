(function () {
    'use strict';

    angular
        .module('myApp', ['ngRoute', 'ngCookies'])
        .config(config)
        .run(run);

    config.$inject = ['$routeProvider', '$locationProvider'];
    function config($routeProvider, $locationProvider) {
        $routeProvider
            .when('/', {
                controller: 'SliceController',
                templateUrl: './pages/home.view.html',
                controllerAs: 'vm'
            })

            .when('/login', {
                controller: 'LoginController',
                templateUrl: './pages/login.view.html',
                controllerAs: 'vm'
            })

            .when('/register', {
                controller: 'RegisterController',
                templateUrl: './pages/register.view.html',
                controllerAs: 'vm'
            })

            .when('/signedin', {
                controller: 'HomeController',
                templateUrl: './pages/signedin.view.html',
                controllerAs: 'vm'
            })
            .when('/slice', {
                controller: 'SliceController',
                templateUrl: './pages/slice.html',
                controllerAs: 'vm'
            })
            .when('/pastslice',{
            templateUrl:'./pages/pastslice.html'
            })
            .when('/suggest', {
              templateUrl: './pages/suggest.html'
            })
            .otherwise({
           controller : function(){
           window.location.replace('/404');
                },
        templateUrl : './404.html'
               });
    }

    run.$inject = ['$rootScope', '$location', '$cookieStore', '$http'];
    function run($rootScope, $location, $cookieStore, $http) {
        // keep user logged in after page refresh
        $rootScope.globals = $cookieStore.get('globals') || {};
        if ($rootScope.globals.currentUser) {
            $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata; // jshint ignore:line
        }


    }

})();
