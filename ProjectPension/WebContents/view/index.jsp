<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Green Stay</title>
<style>
</style>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
   integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
   integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
   crossorigin="anonymous"></script>
<style>
   img {
      size: 80px;
   }
</style>

</head>

<body>

   <!--    <div class="container py-3" id ="header">  -->

  <%@ include file = "/view/header.jsp" %>
   <h1 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">View</h1>
   <h3 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">Busan Emotional Stay</h3>
  
   <div id="carouselExampleIndicators" class="carousel slide"
      data-bs-ride="carousel">
      <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="0" class="active" aria-current="true"
            aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="2" aria-label="Slide 3"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="3" aria-label="Slide 4"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="4" aria-label="Slide 5"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="5" aria-label="Slide 6"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="6" aria-label="Slide 7"></button>

      </div>
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img src="image/main/01.jpg" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="image/main/02.jpg" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="image/main/03.jpg" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="image/main/04.jpg" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="image/main/05.jpg" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="image/main/06.jpg" class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="image/main/07.jpg" class="d-block w-100" alt="...">
         </div>
      </div>
      <button class="carousel-control-prev" type="button"
         data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Next</span>
      </button>
   </div>

  <%@ include file = "/view/bottom.jsp" %>
</body>
</html>