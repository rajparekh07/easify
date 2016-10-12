<!--#include virtual="/layout.asp"-->
<!--#include virtual="/includes/verifyAuthentication.asp"-->
<% sub contentsofdoc %>
	<div class="container">
		<div class="row" style="padding-top: 100px;padding-bottom: 100px">
			<div class="col s12 m12 l6">
				<div class="card hoverable">
					<div class="card-content teal">
						<h5 class="roboto-thin-text center">
						Here, you can create new a Post!
						</h5>
					</div>
					<div class="card-content">
						<div class="row">
							<form name="newPostForm" id="newPostForm" method="Post">
								<div class="input-field col s12 l12 m12">
									<i class="material-icons prefix grey-text">label</i>
									<input type="text" name="title" id="title" autocomplete="off" class="validate">
									<label for="title">Title</label>
								</div>

					          <!-- <div class="input-field col s12">
					            <textarea id="textarea1"  length="120"></textarea>
					            <label for="textarea1">Textarea</label>
					          </div> -->
								<div class="input-field col s12 l12 m12">
									<i class="material-icons prefix grey-text">content_paste</i>
									<textarea name="post" id="post" autocomplete="off" length="4096" class="materialize-textarea" rows="2" ></textarea>
									<label for="post">Post Content</label>
								</div>
								<div class="input-field col s12 l12 m12">
									<i class="material-icons prefix grey-text">style</i>
									<div class="chips" style="padding-left: 50px"></div>
								</div>
								<div class="input-field col offset-l8">
									<button class="btn waves-effect waves-light teal white-text" id="create-btn" type="submit" name="action">Create
											  <i class="material-icons right">send</i>
									  </button>	
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<div class="col s12 m12 l6">
				<div class="card hoverable">
					<div class="card-content teal">
						<h5 class="roboto-thin-text center">
						Preview!
						</h5>
					</div>
					<div class="card-content">
						<p class="roboto-thin-text">By <%=Session("UserName")%>, at <%=NOW()%></p>
						<span class="card-title large" id="preview-title">Some Title</span>
						<p style="font-size: 20px;padding-left: 25px;min-height: 30vh;min-width: 30vh" id="preview-post" class="data-card">
						Some dummy text!
						</p>
						<p id="preview-tags-post">Tags: <span id="preview-tags"></span></p>
					</div>
				</div>
				
			</div>
		</div>
	</div>
 <% end sub %>
 <% sub contentsofhead %>
 <% end sub %>
 <% sub contentsofbottom %>
 	<script type="text/javascript">
    $('.chips').material_chip({
	    placeholder: 'Enter a tag',
	    secondaryPlaceholder: '+Tag',
	});
	$('#title').keyup(function () {
		var textEntered = $('#title').val();
		$('#preview-title').text(textEntered);
		if($('#title').val()=="") $('#preview-title').text('Some Title');
	});
	$('#post').keyup(function () {
		$('#preview-post').html($('#post').val());
		if($('#post').val()=="") $('#preview-post').text('Some dummy text!');
	});
	 $('.chips').on('chip.add', function(e, chip){
	 	if($('#preview-tags').text()!="")
    	$('#preview-tags').text($('#preview-tags').text()+ ", " + chip.tag);
    	else $('#preview-tags').text(chip.tag);
  	});
	 $('.chips').on('chip.delete', function(e, chip){
    	$('#preview-tags').text($('#preview-tags').text().replace(", "+chip.tag,""));
    	$('#preview-tags').text($('#preview-tags').text().replace(chip.tag,""));
 	 });
 	 $('#newPostForm').validate({
 	 	rules:{
 	 		title:{
 	 			required: true,
 	 			minlength: 4,
 	 			maxlength: 16
 	 		},
 	 		post:{
 	 			required: true,
 	 			minlength: 12,
 	 			
 	 			maxlength: 4096
 	 		},
 	 	},
 	 	message:{
 	 		title:{
 	 			required: "Please enter the title of your post.",
 	 			minlength: "Your title is too short.",
 	 			maxlength: "Your title is too long.",
 	 		},
 	 		post:{
 	 			required: "Please enter the content of your post.",
 	 			minlength: "Your content for the post is too short.",
 	 			maxlength: "Your content for the post is too long.",
 	 		},
 	 	},
 	 	submitHandler: function(form){
 	 		var dataArray = $('#newPostForm').serializeArray();
 	 		var tags = $('.chips').material_chip('data');
 	 		$.each(tags,function(i,e){
			    dataArray.push({name:"tags",value:tags[i].tag})
			});
 	 		console.log(dataArray);
 	 			$.ajax("create.asp",{
 	 				method: "post",
 	 				data : dataArray,
 	 				success: function(data){
 	 					data = JSON.parse(data);
 	 					if(data.Success=="Success"){
 	 						swal({
 	 							title: "New Post Created",
            					text: "Congratulations! Your post was added!",
            					type: "success"
 	 						},function () {
 	 							window.location.href = "../post/?postID="+data.PostID;
 	 						});
 	 					}else{
 	 						var message = " ";
                            if(data.Title!=undefined)
                                message = data.Title;
                            if(data.Content!=undefined)
                                message = message + data.Content;
            				swal({
            					title: "Failed",
            					text: "Sorry! We cannot create your post because " + message,
            					type: "error"
            				});
 	 					} 
 	 				}
 	 			});
 	 	}	
 	 });
 	</script>
 <% end sub %>