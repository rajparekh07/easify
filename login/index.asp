<!--#include virtual="/layout.asp"-->
<!--#include virtual="/includes/redirectIFAuthenticated.asp"-->
<% sub contentsofdoc %>

<div class="row valign" id="login-container-row">
			<div class="col s12 m12 l6 offset-l3 valign" id="login-col">
				<div class="card hoverable" id="login-center">	
					<div class="card-content teal " id="login-card">
								<div class="row " id="content-row">
									<div class="col s12 m12 l12 ">
										<h5 class="center-align white-text roboto-thin-text">Good to see you today!</p>
									</div>
								</div>
							</div>
							<div class="card-content">
									<div class="row">
										<form name="loginForm" id="loginForm">
											<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix grey-text">email</i>
													<input id="email" type="text" name="email" autocomplete="off" class="validate"> 
													<label for="email">Email</label>
										</div>
											<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix grey-text roboto-thin-text">fingerprint </i>
													<input id="password" type="password" name="password" autocomplete="off" class="validate">
													<label for="password">Password</label>
										</div>
										<div class="input-field col offset-l6 l6 s12 m12">
										<button class="btn waves-effect waves-light teal white-text " type="submit" name="action">Log in
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
  $("#loginForm").validate({
            rules: {
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
                }
            }, 
            messages: {
                email: {
                    required: "Enter your Email",
                    email : "Invalid Email Address",
                    pattern: "Sorry, this is not a valid Email!"
                },
                password: {
                    required: "Enter your Password"
                }
            },
           submitHandler: function(form){
            	var data = $('#loginForm').serialize();
            	$.ajax("login.asp",{
            		method: 'post',
            		data: data,
            		success: function(data){
            			data = JSON.parse(data);
            			if(data.Success == "Success"){
            				swal({
            					title: "Success",
            					text: "Welcome back to Easify!",
            					type: "success"
            				},function() {
            					window.location.href = '/';
            				});
            			} else {
            				swal({
            					title: "Failed",
            					text: "Sorry! We cannot log in you because " + data.Authenticate,
            					type: "error"
            				});
            			}
            		}
            	});
            }
        });
    </script>
 <% end sub %>