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
    <script src="../assets/js/sweetalert.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="../assets/css/sweetalert.css">
    <% call contentsofhead %>
</head>
<body>
  <div id="preloader" class="cs-loader">
        <div id="loader" class="cs-loader-inner">
            <label> E</label>
            <label> A</label>
            <label> S</label>
            <label> I</label>
            <label> F</label>
            <label> Y</label>
        </div>
    </div>

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
    /*---------------------------------------------------- */
    /* Preloader
     ------------------------------------------------------ */
    $(window).on('load', function() {

        $(document).ready(function() {
            setTimeout(function(){
                var l = document.getElementById('loader').style;
            l.opacity = 1;
            (function fade(){(l.opacity-=.1)<0?l.display="none":setTimeout(fade, 50)})();

            var p = document.getElementById('preloader').style;
            p.opacity = 1;
            (function fade(){(p.opacity-=.1)<0?p.display="none":setTimeout(fade, 50)})();
            },2000);
        });

    });


</script>
</html>