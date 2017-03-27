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

foodApp.controller('FoodListCtrl', function ($scope){
  $scope.foods =  [
    {'name': 'Ді Магро',
     'ingredients': 'Орегано, олія оливкова, базилік, капуста броколі, перець запечений, помідор, соус томатний, часник',
     'foodImgUrl':'/resources/images/dimagro.jpg',
     'price':'75',
     'weight':'300'
   },
    {'name': 'Джарджіно',
     'ingredients': 'Цибуля червона, помідор, баклажан, розмарин, соус базиліковий, кабачок цуккіні',
     'foodImgUrl':'/resources/images/jarjino.jpg',
     'price':'50',
     'weight':'250'
   },
    {'name': 'Альпіно',
     'ingredients': 'Печериці, цибуля червона, перець болгарський, петрушка, сир моцарела, вершки, телятина в соєвому соусі',
     'foodImgUrl':'/resources/images/alpino.jpg',
     'price':'45',
     'weight':'200'
   },

   {'name': 'Ді Магро',
    'ingredients': 'Орегано, олія оливкова, базилік, капуста броколі, перець запечений, помідор, соус томатний, часник',
    'foodImgUrl':'/resources/images/dimagro.jpg',
    'price':'75',
    'weight':'100'
  },
   {'name': 'Джарджіно',
    'ingredients': 'Цибуля червона, помідор, баклажан, розмарин, соус базиліковий, кабачок цуккіні',
    'foodImgUrl':'/resources/images/jarjino.jpg',
    'price':'75',
    'weight':'100'
  },
   {'name': 'Альпіно',
    'ingredients': 'Печериці, цибуля червона, перець болгарський, петрушка, сир моцарела, вершки, телятина в соєвому соусі',
    'foodImgUrl':'/resources/images/alpino.jpg',
    'price':'75',
    'weight':'100'
  },

  {'name': 'Ді Магро',
   'ingredients': 'Орегано, олія оливкова, базилік, капуста броколі, перець запечений, помідор, соус томатний, часник',
   'foodImgUrl':'/resources/images/dimagro.jpg',
   'price':'75',
   'weight':'100'
 },
  {'name': 'Джарджіно',
   'ingredients': 'Цибуля червона, помідор, баклажан, розмарин, соус базиліковий, кабачок цуккіні',
   'foodImgUrl':'/resources/images/jarjino.jpg',
   'price':'75',
   'weight':'100'
 },
  {'name': 'Альпіно',
   'ingredients': 'Печериці, цибуля червона, перець болгарський, петрушка, сир моцарела, вершки, телятина в соєвому соусі',
   'foodImgUrl':'/resources/images/alpino.jpg',
   'price':'75',
   'weight':'100'
 }
  ];
});
</script>
</head>

<body ng-controller="FoodListCtrl">

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
                <li><a href="#">Піца</a></li>
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
      <!--<form class="navbar-form navbar-right">
        <div class="form-group">
          <input type="text" placeholder="Email" class="form-control">
        </div>
        <div class="form-group">
          <input type="password" placeholder="Password" class="form-control">
        </div>
        <button type="submit" class="btn btn-success">Log in</button>
      </form>
    -->
    <ul class="nav navbar-nav navbar-right">
      <!--<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
      <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modal-1"><span class="glyphicon glyphicon-user"></span>   Реєстрація</button></li>
      <li><button type="button" class="btn btn-link" data-toggle="modal" data-target="#modal-2"><span class="glyphicon glyphicon-log-in"></span>   Вхід</button></li>
    </ul>
  </div>
</div>
</div>
<!---->
<!--<div id="carousel" class="carousel slide" >
  <!-- Указатели -->
  <!--<ol class="carousel-indicators">
    <li data-target="#carousel" data-slide="0" class="active"></li>
    <li data-target="#carousel" data-slide="1"></li>
    <li data-target="#carousel" data-slide="2"></li>
  </ol>
  <!-- Контент слайда (slider wrap)-->
  <!--<div class="carousel-inner">
    <div class="item active">
      <img src="images/back.jpg" alt="">
      <div class="carousel-caption">

        <div class="container">
          <h1 id='alpino'>Альпіно</h1>
          <div id="forintroduction">
            <p id="introduction">Альпіно - онлайн-ресторан - безкоштовна доставка суші Львів!

      Доставка Альпіно Львів - це невелика команда професіоналів та ентузіастів італійської кухні, яка Вас ніколи не підведе.
      Ми готуємо смачні та корисні страви італійської кухні та швидко доставляємо їх прямісінько до Вас по всьому Львову.
      Всі страви готуються тільки після Вашого замовленя, тобто Ви отримуєте свіжі страви, які відправлені до Вас "з-під ножа".
      Ми любимо свою справу і своє місто Львів - тому готуємо тільки найсмачніші страви.
      Доставка Альпіно Львів- онлайн-ресторан з безкоштовною достакою  по Львову!
      </p>
      </div>
      <p><a href="#" class="btn btn-primary btn-lg" > Дізнатись більше &raquo;</a></p>
      </div>

    </div>
    </div>
    ...
  </div>
  <!-- Элементы управления -->
<!--  <a class="left carousel-control" href="#carousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
-->
<!---->

<div class="jumbotron">
  <div class="container">
    <h1 id='alpino'>Альпіно</h1>
    <div id="forintroduction">
      <p id="introduction">Альпіно - онлайн-ресторан - безкоштовна доставка суші Львів!

Доставка Альпіно Львів - це невелика команда професіоналів та ентузіастів італійської кухні, яка Вас ніколи не підведе.
Ми готуємо смачні та корисні страви італійської кухні та швидко доставляємо їх прямісінько до Вас по всьому Львову.
Всі страви готуються тільки після Вашого замовленя, тобто Ви отримуєте свіжі страви, які відправлені до Вас "з-під ножа".
Ми любимо свою справу і своє місто Львів - тому готуємо тільки найсмачніші страви.
Доставка Альпіно Львів- онлайн-ресторан з безкоштовною достакою  по Львову!
</p>
</div>
<p><a href="#" class="btn btn-primary btn-lg" > Дізнатись більше &raquo;</a></p>
</div>
</div>


<div class="container">
  <div class="row">
      <div class="col-md-4" ng-repeat="food in foods">
        <div class="row">
              <div class="col-md-6">
                <h2>{{food.name}}</h2>
              </div>
              <div class="col-md-6">

                <a href="#" class="starburst7"><span><span><span><span><span><span><span><span><h1>{{food.price}}грн</h1><br /></span></span></span></span></span></span></span></span></a>
              </div>
      </div>
        <img  id="imgmenu" src="{{food.foodImgUrl}}" alt="{{food.name}}" class="img-responsive">

      <!--  <p><a href="#" class="btn btn-primary btn-lg" data-toogle="tooltip"  data-placement="top" title="Склад"> Дізнатись більше &raquo;</a></p>-->
          <div class="row">
              <div class="col-md-6">
              <p><a href="#"
                class="btn btn-primary btn-lg"
                data-toogle="popover"
                title="{{food.weight}}г"
                data-placement="top"
                data-content="{{food.ingredients}}"
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


  <!--
  <div class="row">
      <div class="col-md-4">
        <h2>МАРГАРИТА</h2>
        <img src="Pizza.jpg" alt="альтернативный текст" class="img-responsive">
        <p>Класична піца із оригінальним соусом з відбірних томатів і орегано, з ніжною моцареллою та сок...</p>
        <p><a href="#" class="btn btn-primary btn-lg"> Дізнатись більше &raquo;</a></p>
    </div>
    <div class="col-md-4">
      <h2>МАРГАРИТА</h2>
      <img src="Pizza.jpg" alt="альтернативный текст" class="img-responsive">
      <p>Класична піца із оригінальним соусом з відбірних томатів і орегано, з ніжною моцареллою та сок...</p>
      <p><a href="#" class="btn btn-primary btn-lg"> Дізнатись більше &raquo;</a></p>
  </div>
  <div class="col-md-4">
    <h2>МАРГАРИТА</h2>
    <img src="Pizza.jpg" alt="альтернативный текст" class="img-responsive">
    <p>Класична піца із оригінальним соусом з відбірних томатів і орегано, з ніжною моцареллою та сок...</p>
    <p><a href="#" class="btn btn-primary btn-lg"> Дізнатись більше &raquo;</a></p>
</div>
<div class="col-md-4">
  <h2>МАРГАРИТА</h2>
  <img src="Pizza.jpg" alt="альтернативный текст" class="img-responsive">
  <p>Класична піца із оригінальним соусом з відбірних томатів і орегано, з ніжною моцареллою та сок...</p>
  <p><a href="#" class="btn btn-primary btn-lg"> Дізнатись більше &raquo;</a></p>
</div>
<div class="col-md-4">
  <h2>МАРГАРИТА</h2>
  <img src="Pizza.jpg" alt="альтернативный текст" class="img-responsive">
  <p>Класична піца із оригінальним соусом з відбірних томатів і орегано, з ніжною моцареллою та сок...</p>
  <p><a href="#" class="btn btn-primary btn-lg"> Дізнатись більше &raquo;</a></p>
</div>
<div class="col-md-4">
  <h2>МАРГАРИТА</h2>
  <img src="Pizza.jpg" alt="альтернативный текст" class="img-responsive">
  <p>Класична піца із оригінальним соусом з відбірних томатів і орегано, з ніжною моцареллою та сок...</p>
  <p><a href="#" class="btn btn-primary btn-lg"> Дізнатись більше &raquo;</a></p>
</div>
-->
  </div>
  <hr>
  <footre>
    <p>&copy; Усі права захищені 2017</p>
  </footer>
</div>
<div class="modal fade" id="modal-1">
  <div class="modal-dialog" >
    <div class="modal-content">
        <div class="modal-header">
          <button class="close" type="button" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Реєстрація</h4>
        </div>
        <div class=modal-body>
          <form class="form-horizontal">
    <div class="form-group">
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
  <!--  <div class="form-group">
      <label class="control-label col-xs-3">Дата народження:</label>
      <div class="col-xs-3">
        <select class="form-control">
          <option>Дата</option>
        </select>
      </div>
      <div class="col-xs-3">
        <select class="form-control">
          <option>Місяць</option>
        </select>
      </div>
      <div class="col-xs-3">
        <select class="form-control">
          <option>Рік</option>
        </select>
      </div>
    </div>-->
    <div class="form-group">
      <label class="control-label col-xs-3" for="inputEmail">Email:</label>
      <div class="col-xs-9">
        <input type="email" class="form-control" id="inputEmail" placeholder="Email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-xs-3" for="inputPassword">Пароль:</label>
      <div class="col-xs-9">
        <input type="password" class="form-control" id="inputPassword" placeholder="Введіть пароль">
      </div>
    </div>
    <div class="form-group">
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
    </div>
    <br />
    <div class="form-group">
      <div class="col-xs-offset-3 col-xs-9">
        <input type="submit" class="btn btn-primary" value="Реєстрація">
        <input type="reset" class="btn btn-default" value="Очистити форму">
      </div>
    </div>
  </form>
        </div>

        <div class="modal-footer">
            <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
        </div>
    </div>
  </div>
</div>



<div class="modal fade" id="modal-2">
  <div class="modal-dialog" >
    <div class="modal-content">
        <div class="modal-header">
          <button class="close" type="button" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Вхід</h4>
        </div>
        <div class=modal-body>
          <form class="form-horizontal">

      <div class="form-group">
        <label for="inputEmail" class="control-label col-xs-2">Email</label>
        <div class="col-xs-10">
          <input type="email" class="form-control" id="inputEmail" placeholder="Email">
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword" class="control-label col-xs-2">Пароль</label>
        <div class="col-xs-10">
          <input type="password" class="form-control" id="inputPassword" placeholder="Пароль">
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
          <button type="submit" class="btn btn-primary">Увійти</button>
        </div>
      </div>

  </form>
        </div>
<!--
        <div class="modal-footer">
            <button class="btn btn-danger" type="button"  data-dismiss="modal">Відмінити</button>
        </div>-->
    </div>
  </div>
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
