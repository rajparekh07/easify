<!--#include virtual="/layout.asp"-->
<% sub contentsofdoc %>
		<div class="row valign" id="register-container-row">
			<div class="col s12 m12 l6 offset-l3 valign" id="register-col">
				<div class="card hoverable" id="register-center">	
					<div class="card-content teal" id="register-card">
						<div class="row " id="content-row">
							<div class="col s12 m12 l12 ">
								<h5 class="center-align white-text roboto-thin-text">Register with us now!</h5>
							</div>
						</div>
					</div>
					<div class="card-content">
							<div class="row">
								<form name="registerForm" id="registerForm" action="register.asp" method="POST">
									<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">&#xE853;</i>
												<input id="name" type="text" name="name" autocomplete="off">
												<label for="name">Name</label>
									</div>
									<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">email</i>
												<input id="email" type="text" name="email" autocomplete="off">
												<label for="email">Email</label>
									</div>
										<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">fingerprint</i>
												<input id="password" type="password" name="password" autocomplete="off">
												<label for="password">Password</label>
									</div>	
									<div class="input-field col s12 m12 l12">
											<i class="material-icons prefix grey-text">fingerprint</i>
												<input id="confirmPassword" type="password" name="confirmPassword" autocomplete="off">
												<label for="confirmPassword">Confirm Password</label>
									</div>	
									<div class="input-field col offset-l6 l6 s12 m12">
									<button class="btn waves-effect waves-light teal white-text" type="submit" name="action">Register
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
 <script>
	$(window).on("load",function(){
		if($(window).width()<1025){
		  $("#register-col").removeClass("l6");
		  $("#register-col").removeClass("offset-l3");
		  $("#register-col").addClass("l8");
		  $("#register-col").addClass("offset-l2");
	 	}
	});
 </script>
 <% end sub %>