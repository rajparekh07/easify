<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<!DOCTYPE html>
<html>
<head>
 <!--- Custom Css -->
    <link rel="stylesheet" href="../assets/css/styles.css">
    <!-- Awesome Fonts CSS -->
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <!-- MATERIALIZE CSS-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../assets/css/materialize.min.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript" src="../assets/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../assets/js/materialize.min.js"></script>
    <% call contentsofhead %>
</head>
<body>

<div id="content" class="valign-wrapper">
<!-- #include file ="includes\Header.asp" -->
        <% call contentsofdoc %>
<!-- #include file ="includes\Footer.asp" -->
</div>

</body>
<script type="text/javascript">
    $(".button-collapse").sideNav();
</script>
</html>