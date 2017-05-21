/**
 * Created by taras on 12.04.2017.
 */



var app = angular.module('myApp', []);


//---------------------------list of products-----
app.controller('ProductCtrl',
    function ProductCtrl($scope, $http){

        $scope.loaded=false;

        $scope.load = function (){
            $http.get('/products/all').
            then(function(success) {
                $scope.pizza=success.data;
                $scope.loaded=true;

            },function (error) {
                alert("Error");
            });
        };


    }
)
//---------------------validation-----------
app.controller('ValidationCtrl', function ($scope){

    $scope.checkUser = function(userDetails,isvalid){
        if(isvalid){
            $scope.message = userDetails.name + " " + userDetails.email;
        }else{
            $scope.message = "Error";
            $scope.showError = true;
        }
    }

    $scope.getError = function(error){
        if(angular.isDefined(error)){
            if(error.required){
                return "Поле не  може бути пустим";
            }if(error.email){
                return "Введіть правильний email";
            }
        }
    }

});

//--------registration----------------------
app.controller('RegistrationCtrl', function ($scope, $http) {
    $scope.username = null;
    $scope.password = null;

    $scope.lblMsg = null;
    $scope.postdata = function (username, password) {
        var data = {
            username: username,
            password: password

        };

        var req = {
            method  : 'POST',
            url     : '/registration',
            // url     : '/login',
            data    : JSON.stringify(data)

        }
//Call the services
        $http(req).then(function (response) {
            if (response.data)
                $scope.msg = "Post Data Submitted Successfully!";
        }, function (response) {
            $scope.msg = "Service not Exists";
            $scope.statusval = response.status;
            $scope.statustext = response.statusText;
            $scope.headers = response.headers();
        });
    };
});
//--------------------------------------------------



//--------login----------------------
app.controller('LogCtrl', function ($scope, $http) {
    $scope.username = null;
    $scope.password = null;

    $scope.lblMsg = null;
    $scope.postData = function (username, password) {
        var data = {
            username: username,
            password: password

        };
        var req = {
            method  : 'GET',
            //url     : '/registration',
             url     : '/login?username='+data.username + '&&password='+ data.password,

        }
//Call the services
        $http(req).then(function (response) {
            if (response.data)
                $scope.msg = "Post Data Submitted Successfully!";
        }, function (response) {
            $scope.msg = "Service not Exists";
            $scope.statusval = response.status;
            $scope.statustext = response.statusText;
            $scope.headers = response.headers();
        });
    };
});
//---------------------------------------

