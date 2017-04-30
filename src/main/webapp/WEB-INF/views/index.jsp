<!DOCTYPE html>
<html ng-app="foodApp">

<head>
  <meta charset="utf-8">
  <title>OnlineFoodDelivery</title>
  <link rel="stylesheet" type="text/css" href="/resources/css/screen.css" media="screen" />
  <link href="https://fonts.googleapis.com/css?family=Abel|Amatic+SC|Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="/resources/js/angular.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script>
      //var model = "";
      var foodApp = angular.module('foodApp', []);

      foodApp.controller('CheckCtrl', function ($scope){
          $scope.login =
              {'email': 'admin',
                  'password':'admin'
              }
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
      //******************************************

      //-----------------10.04---------
      // Controller function and passing $http service and $scope var.
      foodApp.controller('SignUpCtrl', function($scope, $http) {
          // create a blank object to handle form data.
          $scope.user = {};
          // calling our submit function.
          $scope.submitForm = function() {
              // Posting data to php file
              $http({
                  method  : 'POST',
                  url     : '/registration',
                  data    : $scope.user, //forms user object
                  headers : {'Content-Type': 'application/json'}
              }).then(function (data){
                  if (data.errors) {
                      // Showing errors.
                      $scope.errorName = data.errors.name;
                      $scope.errorPassword = data.errors.password;

                  } else {
                      $scope.message = data.message;
                  }
              },function (error){
                  alert("is not good!")
              });



            /* success(function(data) {
             if (data.errors) {
             // Showing errors.
             $scope.errorName = data.errors.name;
             $scope.errorPassword = data.errors.password;

             } else {
             $scope.message = data.message;
             }
             });*/
          };
      });

      //---------------------------------
      //--------------------------
      //var app = angular.module('postserviceApp', []);
      foodApp.controller('postserviceCtrl', function ($scope, $http) {
          $scope.username = null;
          $scope.password = null;
          $scope.lblMsg = null;
          $scope.postdata = function (username, password) {
              var data = {
                  username: username,
                  password: password

              };
//Call the services
              $http.post('/registration', JSON.stringify(data)).then(function (response) {
                  if (response.data)
                      $scope.msg = "Post Data Submitted Successfully!";
                  alert("nice")
              }, function (response) {
                  $scope.msg = "Service not Exists";
                  $scope.statusval = response.status;
                  $scope.statustext = response.statusText;
                  $scope.headers = response.headers();
                  alert("error")
              });
          };
      });
      //-----------------------
      foodApp.controller('logCtrl', function ($scope, $http) {
          $scope.username = null;
          $scope.password = null;
          $scope.lblMsg = null;
          $scope.postdata = function (username, password) {
              var data = {
                  username: username,
                  password: password

              };
//Call the services
              $http.post('/login', JSON.stringify(data)).then(function (response) {
                  if (response.data)
                      $scope.msg = "Post Data Submitted Successfully!";
                  alert("nice")
              }, function (response) {
                  $scope.msg = "Service not Exists";
                  $scope.statusval = response.status;
                  $scope.statustext = response.statusText;
                  $scope.headers = response.headers();
                  alert("error")
              });
          };
      });


      //---------------------



      foodApp.controller('PizCtrl',
          function PizCtrl($scope, $http){

              $scope.loaded=false;

              $scope.load = function (){
                  $http.get('/products/all').
                  then(function(success) {
                      $scope.pizza=success.data;
                      $scope.loaded=true;
                      //alert($scope.pizza.name);
                  },function (error) {
                      alert("Error");
                  });
              };
            /*$scope.voteUp = function (answer){
             answer.rate++;
             };
             $scope.voteDown = function (answer){
             answer.rate--;
             };*/
          }
      )

  </script>
  <style>
    form .ng-invalid-required.ng-dirty{
      background-color: lightpink;
    }
    form .ng-invalid-email.ng-dirty{
      background-color:lightgoldenrodyellow;
    }
    form .ng-valid.ng-dirty{
      background-color: lightgreen;
    }
    span.summary.ng-valid{
      color: green;
    }
    span.summary.ng-invalid{
      color: red;
      font-weight:bold;
    }
    div.error{
      color:black;
      font-weight: bold;
    }
  </style>
</head>

<body ng-controller="PizCtrl">

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href"#">OnlineFood</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">


        <!-- Выподающие меню с подпунктами -->
        <li class="dropdown">
          <a data-toggle="dropdown" class="dropdown-toggle" href="#" >Меню <b class="caret"></b></a>
          <ul role="menu" class="dropdown-menu">
            <li><a href="#" ng-click="load()">Піца</a></li>
            <li><a href="#">Салати</a></li>
            <li><a href="#">Десерти</a></li>
            <li><a href="#">Напої</a></li>
            <!--<li class="divider"></li>
            <li><a href="#">Меню 4</a></li>-->
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input id="search" type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Пошук</button>
      </form>

      <ul class="nav navbar-nav navbar-right">

        <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modal-3"><span class="glyphicon glyphicon-shopping-cart"></span></button></li>
        <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modal-1"><span class="glyphicon glyphicon-user"></span>   Реєстрація</button></li>
        <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modal-2"><span class="glyphicon glyphicon-log-in"></span>   Вхід</button></li>
      </ul>
    </div>
  </div>
</div>


<div class="jumbotron">
  <div class="container">
    <h1 id='alpino'>Альпіно{{orders.name}}</h1>
    <div id="forintroduction">
      <p id="introduction">Альпіно - онлайн-ресторан - безкоштовна доставка суші Львів!

        Доставка Альпіно Львів - це невелика команда професіоналів та ентузіастів італійської кухні, яка Вас ніколи не підведе.
        Ми готуємо смачні та корисні страви італійської кухні та швидко доставляємо їх прямісінько до Вас по всьому Львову.
        Всі страви готуються тільки після Вашого замовленя, тобто Ви отримуєте свіжі страви, які відправлені до Вас "з-під ножа".
        Ми любимо свою справу і своє місто Львів - тому готуємо тільки найсмачніші страви.
        Доставка Альпіно Львів- онлайн-ресторан з безкоштовною достакою  по Львову!
      </p>
    </div>
    <p><a href="#" class="btn btn-primary btn-lg"  > Дізнатись більше &raquo;</a></p>
  </div>
</div>


<div class="container" ng-controller="PizCtrl">
  <div class="row">
    <div class="col-md-4" ng-repeat="p in pizza">
      <div class="row">
        <div class="col-md-6">
          <h2>{{p.name}}</h2>
        </div>
        <div class="col-md-6">

          <a href="#" class="starburst7"><span><span><span><span><span><span><span><span><h1>{{p.price}}грн</h1><br /></span></span></span></span></span></span></span></span></a>
        </div>
      </div>
      <img  id="imgmenu" src="{{p.photo}}" alt="{{p.name}}" class="img-responsive">

      <!--  <p><a href="#" class="btn btn-primary btn-lg" data-toogle="tooltip"  data-placement="top" title="Склад"> Дізнатись більше &raquo;</a></p>-->
      <div class="row">
        <div class="col-md-6">
          <p><a href="#"
                class="btn btn-primary btn-lg"
                data-toogle="popover"
                title="{{p.price}}г"
                data-placement="top"
                data-content="{{p.description}}"
                data-trigger="hover"
          > Склад &raquo;
          </a></p>
        </div>

        <div class="col-md-3">
          <p><a href="#"
                class="btn btn-primary btn-lg"
                id="order"
          > Замовити
          </a></p>
        </div>
      </div>
    </div>

  </div>
  <hr>
  <footer>
    <p>&copy; Усі права захищені 2017</p>
  </footer>
</div>
<div class="modal fade" id="modal-1" >
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" type="button" data-dismiss="modal">&times;</button>

        <h4 class="modal-title">Реєстрація</h4>
      </div>

      <div class=modal-body >
        <!-- FORM -->
        <!-- FORM -->
        <form name="userForm" ng-submit="submitForm()"   ng-controller="SignUpCtrl">
          <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" class="form-control" ng-model="user.name">
            <span ng-show="errorName">{{errorName}}</span>
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="text" name="password" class="form-control" ng-model="user.password">
            <span ng-show="errorPassword">{{errorPassword}}</span>
          </div>

          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <!--
      <div  ng-controller="SignUpCtrl">
        <div>
          Name : <input ng-model="name" /><br/><br/>
          Password : <input ng-model="password" /><br/><br/>

          <input type="button" value="Send" ng-click="postdata(name,password)" /> <br/><br/>
        </div>
        <p>Output Message : {{msg}}</p>
        <p>StatusCode: {{statusval}}</p>
        <p>Status: {{statustext}}</p>
        <p>Response Headers: {{headers}}</p>
      </div>
        -->
        <!--  <form class="form-horizontal" name="myForm">
    <!--<div class="form-group">
      <label class="control-label col-xs-3" for="lastName">Прізвище:</label>
      <div class="col-xs-9">
        <input type="text" class="form-control" id="lastName" placeholder="Введіть прізвище">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-xs-3" for="firstName">Ім'я:</label>
      <div class="col-xs-9">
        <input type="text" class="form-control" id="firstName" placeholder="Введіть ім'я">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-xs-3" for="fatherName">По батькові:</label>
      <div class="col-xs-9">
        <input type="text" class="form-control" id="fatherName" placeholder="Введіть по батькові">
      </div>
    </div>
 -->


        <!-- <div class="form-group">
           <label class="control-label col-xs-3" for="inputEmail">Email:</label>
           <div class="col-xs-9">
             <input type="email" class="form-control" id="inputEmail" placeholder="Email" ng-model="answer.email">
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-xs-3" for="inputPassword">Пароль:</label>
           <div class="col-xs-9">
             <input type="password" ng-model="answer.password" class="form-control" id="inputPassword" placeholder="Введіть пароль">
           </div>
         </div>-->
        <!--<div class="form-group">
          <label class="control-label col-xs-3" for="confirmPassword">Підтвердіть пароль:</label>
          <div class="col-xs-9">
            <input type="password" class="form-control" id="confirmPassword" placeholder="Введіть пароль ще раз">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-xs-3" for="phoneNumber">Телефон:</label>
          <div class="col-xs-9">
            <input type="tel" class="form-control" id="phoneNumber" placeholder="Введіть номер телефону">
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-xs-3" for="postalAddress">Адреса:</label>
          <div class="col-xs-9">
            <textarea rows="3" class="form-control" id="postalAddress" placeholder="Введіть адресу"></textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-xs-3">Стать:</label>
          <div class="col-xs-2">
            <label class="radio-inline">
              <input type="radio" name="genderRadios" value="male"> Чоловіча
            </label>
          </div>
          <div class="col-xs-2">
            <label class="radio-inline">
              <input type="radio" name="genderRadios" value="female"> Жіноча
            </label>
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-9">
            <label class="checkbox-inline">
              <input type="checkbox" value="agree">  Я згідний з <a href="#">умовами</a>.
            </label>
          </div>
        </div>-->
        <br />
        <!-- <div class="form-group">
           <div class="col-xs-offset-3 col-xs-9">
             <input type="submit" class="btn btn-primary" value="Реєстрація" ng-click="save(answer, myForm)">
             <input type="reset" class="btn btn-default" value="Очистити форму">
           </div>
         </div>-->
        <!--</form>-->

      </div>

      <div class="modal-footer">
        <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
      </div>
    </div>
  </div>
</div>


<!--------------------------------------------------->
<div class="modal fade" id="modal-2" ng-controller="CheckCtrl">
  <div class="modal-dialog"  >
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" type="button" data-dismiss="modal">&times;</button>

        <h4 class="modal-title">Вхід</h4>
      </div>
      <div class=modal-body>

        <!-- FORM -->
        <div  ng-controller="logCtrl">
          <div>
            Name : <input ng-model="username" /><br/><br/>
            Password : <input ng-model="password" /><br/><br/>

            <input type="button" value="Send" ng-click="postdata(username,password)" /> <br/><br/>
          </div>
          <p>Output Message : {{msg}}</p>
          <p>StatusCode: {{statusval}}</p>
          <p>Status: {{statustext}}</p>
          <p>Response Headers: {{headers}}</p>
        </div>
        <!--<form class="form-horizontal" name="myForm" novalidate ng-submit="checkUser(newUser,myForm.$valid)">

          <div class="form-group">
            <label for="inputEmail" class="control-label col-xs-2">Email</label>
            <div class="col-xs-10">
              <input  name="userEmail"  type="email" class="form-control" id="inputEmail" placeholder="Email" required ng-model="newUser.email">
              <div class="error" ng-show="showError">
                {{getError(myForm.userEmail.$error)}}
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword" class="control-label col-xs-2">Пароль</label>
            <div class="col-xs-10">
              <input name="userPassword"  type="password" class="form-control" id="inputPassword" placeholder="Пароль" required ng-model="newUser.password">
              <div class="error" ng-show="showError">
                {{getError(myForm.userPassword.$error)}}
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
              <div class="checkbox">
                <label><input type="checkbox"> Запам'ятати</label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
              <button type="submit" class="btn btn-primary btn-block" ng-click="save(answer, myForm)" >Увійти</button>
            </div>
          </div>

        </form>-->

      </div>
    </div>
    <!--
            <div class="modal-footer">
                <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
            </div>-->
  </div>
</div>
<!--------------------------------------------------->
<div class="modal fade" id="modal-3" ng-controller="CheckCtrl">
  <div class="modal-dialog"  >
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" type="button" data-dismiss="modal">&times;</button>

        <h4 class="modal-title">Закази</h4>
      </div>
      <div class=modal-body>

        <!-- FORM -->
        <div  ng-controller="logCtrl">
          <div>
            Name : <input ng-model="username" /><br/><br/>
            Password : <input ng-model="password" /><br/><br/>

            <input type="button" value="Send" ng-click="postdata(username,password)" /> <br/><br/>
          </div>
          <p>Output Message : {{msg}}</p>
          <p>StatusCode: {{statusval}}</p>
          <p>Status: {{statustext}}</p>
          <p>Response Headers: {{headers}}</p>
        </div>
        <!--<form class="form-horizontal" name="myForm" novalidate ng-submit="checkUser(newUser,myForm.$valid)">

          <div class="form-group">
            <label for="inputEmail" class="control-label col-xs-2">Email</label>
            <div class="col-xs-10">
              <input  name="userEmail"  type="email" class="form-control" id="inputEmail" placeholder="Email" required ng-model="newUser.email">
              <div class="error" ng-show="showError">
                {{getError(myForm.userEmail.$error)}}
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword" class="control-label col-xs-2">Пароль</label>
            <div class="col-xs-10">
              <input name="userPassword"  type="password" class="form-control" id="inputPassword" placeholder="Пароль" required ng-model="newUser.password">
              <div class="error" ng-show="showError">
                {{getError(myForm.userPassword.$error)}}
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
              <div class="checkbox">
                <label><input type="checkbox"> Запам'ятати</label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-xs-offset-2 col-xs-10">
              <button type="submit" class="btn btn-primary btn-block" ng-click="save(answer, myForm)" >Увійти</button>
            </div>
          </div>

        </form>-->

      </div>
    </div>
    <!--
            <div class="modal-footer">
                <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
            </div>-->
  </div>
</div>

<!--------------------------------------------------->
</div>
<script>
    $(function(){
        //$('[data-toogle="tooltip"]').tooltip();
        $('[data-toogle="popover"]').popover();

    });

</script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
﻿
