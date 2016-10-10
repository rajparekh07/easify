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
       <!-- jQuery Validation-->
    <script src="../assets/js/jquery.validate.min.js"></script>
    <script src="../assets/js/additional-methods.min.js"></script>

    <% call contentsofhead %>
</head>
<body>

<div id="content" class="valign-wrapper">
<!-- #include file ="includes\Header.asp" -->
        <% call contentsofdoc %>

<!-- #include file ="includes\Footer.asp" -->
</div>

</body>
<% call contentsofbottom %>
<script type="text/javascript">
    $(".button-collapse").sideNav();
    jQuery.validator.setDefaults({
            errorClass: 'errorMessage invalid',
            validClass: "valid",
            errorElement : 'div',
            errorPlacement: function(error, element) {
                var placement = $(element).data('error');
                if (placement) {
                    $(placement).append(error)
                } else {
                    error.insertAfter(element);
                }
                //Materialize.toast(error, 60000, 'rounded red white-text');
            }
        });

</script>
</html>