<!--#include virtual="/layout.asp"-->
<% sub contentsofdoc %>
<div class="val">
	<div class="container" id="register-container" style="">
		<div class="row" id="register-container-row">
			<div class="container">
				<div class="row">
					<div class="col s12 m12 l6 offset-l3 valign-wrapper">
						<div class="card hoverable" id="register-center">	
							<div class="card-content indigo " id="register-card">
								<div class="row " id="content-row">
									<div class="col s12 m12 l12 ">
										<h5 class="center-align white-text">Sign Up!</p>
									</div>
								</div>
							</div>
							<div class="card-content">
									<div class="row">
										<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix grey-text">&#xE853;</i>
													<input id="name" type="text" name="name" >
													<label for="name">Name</label>
										</div>
										<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix grey-text">&#xE853;</i>
													<input id="email" type="text" name="email" >
													<label for="email">Email</label>
										</div>
											<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix grey-text">&#xE8D2;</i>
													<input id="password" type="password" name="password" >
													<label for="password">Password</label>
										</div>	
										<div class="input-field col s12 m12 l12">
												<i class="material-icons prefix grey-text">&#xE8D2;</i>
													<input id="confirmPassword" type="password" name="confirmPassword" >
													<label for="confirmPassword">Confirm Password</label>
										</div>	
										<div class="input-field col offset-l6 l6 s12 m12">
										<button class="btn waves-effect waves-light pink white-text" type="submit" name="action">Register
												  <i class="material-icons right">send</i>
										  </button>
										</div>
									</div>
							 </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 <% end sub %>
 <% sub contentsofhead %>
 
 <% end sub %>