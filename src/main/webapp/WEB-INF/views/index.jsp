<!DOCTYPE html>
<html ng-app="myApp"  >

<head>
    <meta charset="utf-8">
    <title>OnlineFoodDelivery</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/screen.css" media="screen" />
    <link href="https://fonts.googleapis.com/css?family=Abel|Amatic+SC|Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <!-- <script src="/resources/js/jquery-3.2.1.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!--<script src="/resources/js/angular.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>

    <script src="/resources/js/controllers.js"></script>





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

<body ng-controller="ProductCtrl">

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
                        <li><a href="#" ng-click="load()">Салати</a></li>
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

                <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#orders" ><span class="glyphicon glyphicon-shopping-cart"></span></button></li>
                <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#registration"><span class="glyphicon glyphicon-user"></span>   Реєстрація</button></li>
                <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span>   Вхід</button></li>
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


<div class="container" ng-controller="ProductCtrl">
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
                    <!--  <div id="description" class="well">
                         {{p.description}}
                     </div>-->
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('[data-toggle="popover"]').popover()
                        })
                    </script>
                    <a
                            href="#"
                            class="btn btn-primary btn-lg"


                            class="btn btn-lg btn-danger"
                            data-toggle="popover" title="{{p.price}}"
                            data-content="{{p.description}}" data-trigger="hover"
                            placement="bottom"

                    >Склад &raquo;</a>
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
<!---->

<!---->
<!--registration form -->
<div class="modal fade" id="registration" ng-controller="RegistrationCtrl"  >
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal">&times;</button>

                <h4 class="modal-title">Реєстрація</h4>
            </div>

            <div class=modal-body >
                <!-- FORM -->
                <form name="userForm" ng-submit="submitForm()"     >

                    <div class="form-group">

                        <label>User Name</label>
                        <input type="text" name="username" class="form-control" ng-model="username" >

                    </div>

                    <div class="form-group">

                        <label>Password</label>
                        <input type="text" name="password" class="form-control" ng-model="password" >

                    </div>


                    <button type="submit" class="btn btn-success btn-lg btn-block" ng-click="postdata(username, password)" >
                        <span class="glyphicon glyphicon-flash"></span> Submit!
                    </button>
                </form>
                <br />

            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
            </div>
        </div>
    </div>
</div>


<!--------------------------------------------------->
<!--login form -->
<div class="modal fade" id="login" ng-controller="LogCtrl">

    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal">&times;</button>

                <h4 class="modal-title">Вхід</h4>
            </div>

            <div class=modal-body >
                <!-- FORM -->
                <form name="userForm" ng-submit="submitForm()"     >

                    <div class="form-group">

                        <label>User Name</label>
                        <input type="text" name="usename" class="form-control" ng-model="username" >

                    </div>

                    <div class="form-group">

                        <label>Password</label>
                        <input type="text" name="password" class="form-control" ng-model="password" >

                    </div>


                    <button type="submit" class="btn btn-success btn-lg btn-block" ng-click="postData(username, password)" >
                        <span class="glyphicon glyphicon-flash"></span> Submit!
                    </button>
                </form>
                <br />

            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
            </div>
        </div>
    </div>
</div>

<!--------------------------------------------------->
<div class="modal fade" id="orders"   >
    <div class="modal-dialog"  >
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal">&times;</button>

                <h4 class="modal-title">Закази</h4>
            </div>
            <div class=modal-body  >

                <!-- FORM -->





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

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
﻿
