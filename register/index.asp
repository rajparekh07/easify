<!--#include virtual="/layout.asp"-->
<!--#include virtual="/includes/redirectIFAuthenticated.asp"-->
<% sub contentsofdoc %>
		<div class="row valign" id="register-container-row" style="padding-top:50px;">
			<div class="col s12 m12 l6 offset-l3 valign" id="register-col">
				<div class="card hoverable" id="register-center" >	
					<div class="card-content teal" id="register-card">
						<div class="row " id="content-row">
							<div class="col s12 m12 l12 ">
								<h5 class="center-align white-text roboto-thin-text">Register with us now!</h5>
							</div>
						</div>
					</div>
					<div class="card-content">
							<div class="row">
								<form name="registerForm" id="registerForm" method="post">
									<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">&#xE853;</i>
												<input id="name" type="text" name="name" autocomplete="off" class="validate">
												<label for="name">Name</label>
									</div>
									<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">email</i>
												<input id="email" type="text" name="email" autocomplete="off" >
												<label for="email">Email</label>
									</div>
										<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">fingerprint</i>
												<input id="password" type="password" name="password" autocomplete="off" class="validate">
												<label for="password">Password</label>
									</div>	
									<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">fingerprint</i>
												<input id="confirmPassword" type="password" name="confirmPassword" autocomplete="off" class="validate">
												<label for="confirmPassword">Confirm Password</label>
									</div>	
									<div class="input-field col offset-l6 l6 s12 m12">
									<button class="btn waves-effect waves-light teal white-text" id="register-btn" type="submit" name="action">Register
											  <i class="material-icons right">send</i>
									  </button>
									</div>
								</form>
							</div>
					 </div>
				</div>
			</div>
		</div>
 <% end sub %>
 <% sub contentsofhead %>
 <% end sub %>
  <% sub contentsofbottom %>
   <script>
	$(window).on("load",function(){
		if($(window).width()<1025){
		  $("#register-col").removeClass("l6");
		  $("#register-col").removeClass("offset-l3");
		  $("#register-col").addClass("l8");
		  $("#register-col").addClass("offset-l2");
	 	}
	});
	 $("#registerForm").validate({
            rules: {
                name:  {
                    required: true,
                    pattern: /^[a-zA-Z ]+$/,
                    minlength:4,
                    maxlength: 32
                },
                email: {
                    required: true,
                    email: true,
                    pattern: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
                    maxlength: 64
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 32
                },
                confirmPassword: {
                	required: true,
                    minlength: 6,
                    maxlength: 32
                }
            }, 
            messages: {
                name:  {
                    required: "Please enter your Full Name",
                    pattern: "Sorry, this is not a valid Name!"
                },
                email: {
                    required: "Enter your Email",
                    email : "Invalid Email Address",
                    pattern: "Sorry, this is not a valid Email!"
                },
                password: {
                    required: "Enter your Password"
                },
                confirmPassword: {
                	required: "Enter your Password again!"
                }
            },
           submitHandler: function(form){
            	$('.toast').remove();
            	if($('#password').val()!=($('#confirmPassword').val())){
            		Materialize.toast('Your password does not match', 10000, 'rounded red white-text');
            		return;
            	}
            	var data = $('#registerForm').serialize();
            	$.ajax("register.asp",{
            		method: 'post',
            		data: data,
            		success: function(data){
            			data = JSON.parse(data);
            			console.log(data.success);
            			if(data.Success == "success"){
            				swal({
            					title: "Success",
            					text: "Welcome to Easify! Your registration is complete!",
            					type: "success"
            				},function() {
            					window.location.href = '/';
            				});
            			} else {
                            var message = " ";
                            if(data.Title!=undefined)
                                message = data.Title;
                            if(data.Content!=undefined)
                                message = message + data.Content;
            				swal({
            					title: "Failed",
            					text: "Sorry! We cannot create your post because " + ,
            					type: "error"
            				});
            			}
            		}
            	});
            }
        });
 </script>
 <% end sub %>