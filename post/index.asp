<!--#include virtual="/layout.asp"-->
<!--#include virtual="/database.asp"-->
<% sub contentsofdoc %>
	<div class="container">
	<div class="row" style="padding-top:100px;padding-bottom:100px">
		<div class="col s12 m12 l8 offset-l2">
		<%
		postId = request("postID")
		if len(postID)=0 then
			response.redirect("/")
		end if
		dim rs : set rs = newConnection().execute("SELECT posts.*, users.ID, users.FullName, users.Email FROM users INNER JOIN (tags INNER JOIN (posts INNER JOIN post_tag ON posts.ID = post_tag.PostID) ON tags.ID = post_tag.TagID) ON users.ID = posts.AuthorID where posts.ID = "&postID&"")
		dim rs2 : set rs2 = newConnection().execute("SELECT tags.* FROM tags where tags.ID in (Select TagID from post_tag where post_tag.PostID = "&rs("posts.ID")&")")
		%>
			<div class="col s12 m12 l12" >
				<div class="card hoverable data-card" id="<%=rs("posts.ID")%>">
					<div class="card-content">
						<!-- <p class="roboto-thin-text">By <%=rs("FullName")%>, at <%=rs("CreatedAt")%></p> -->
						<span class="new badge left-align roboto-thin-text" data-badge-caption="By <%=rs("FullName")%>, at <%=rs("CreatedAt")%>"></span>
						<span class="card-title large" class="first-title"><%=rs("Title")%></span>
						<p style="font-size: 20px;padding-left: 25px;min-height: 50vh" class="data-card">
							<%=rs("Content")%>
						</p>
						<p class="first-tags-post">Tags: <span class="first-tags">
							<% while not rs2.eof
								response.write " "&rs2("TagName")
							 	rs2.movenext
							 	wend
							 	rs2.close
							 %>
						</span></p>
					</div>
					<div class="divider"></div>
					<div class="card-content">
							<span class="roboto-thin-text card-title" style="font-size: 25px;color:teal">Comments:</span>
							<div class="row">

								<!-- <div class="col l1">
									<i class="material-icons prefix grey-text center">comment</i>
								</div>
								<div class="input-field col l10">
									<input type="text" name="comment" id="newcomment" autocomplete="off" class="validate">
									<label for="comment">Comment</label>
								</div>
								<div class="col l1">
									<a href="/create" class="btn-floating btn-small waves-effect waves-light red"><i class="material-icons">add</i></a>
								</div> -->
							<form name="newCommentForm" id="newCommentForm" method="post">
								<div class="input-field col s11 l11 m11">
									<i class="material-icons prefix grey-text">comment</i>
									<input type="text" name="comment" id="comment" autocomplete="off" class="validate">
									<label for="comment">Comment</label>
									<input type="hidden" id="postID" name="postID" value="<%=rs("posts.ID")%>">

								</div>
								<div class="col l1 s1 m1">
									<button type="submit" name="action" class="btn-floating btn-large waves-effect waves-light teal"><i class="material-icons">send</i></button>
								</div>
								</div>
							</form>
							<ul class="collection">
						    <% 
						    	rs.close
						    	set rs = newConnection().execute("Select * from comments inner join users on comments.AuthorID=users.ID where PostID="&postId&"")
						    	while not rs.eof
						    %>
						    <li class="collection-item avatar">
						      <i class="material-icons circle">&#xE853;</i>
			
						      <span class="title"><%=rs("FullName")%></span>
						      <p><%=rs("Content")%><br>
						    	</p>
						      <span class="new badge" data-badge-caption="<%=rs("comments.CreatedAt")%>"></span>
						      <br>
						    </li>
						    <% 
						    	rs.movenext
						    	wend
						     %>
						  
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
  <% sub contentsofbottom %>
 <script>
 	$('#newCommentForm').validate({
 		rules:{
 			comment:{
 				required: true,
 			}
 		},
 		message:{
 			required: "Please enter the comment",
 		},
 		submitHandler: function(form) {
 			var data = $('#newCommentForm').serialize();
 			console.log()
 			$.ajax("newcomment.asp",{
 				method: 'post',
 				data: data,
 				success: function(data) {
	 				data = JSON.parse(data);
	 				if(data.Success="Success"){
	 					swal({
	 						title: "Success",
	 						text: "New Comment added successfully at <%Time()%>",
	 						type: "success"
	 					},function() {
	 						window.location.reload();
	 					});
	 				} else {
	 					swal({
	 						title: "Failed",
	 						text: "Comment could not be added because "+data.Message,
	 						type: "error"
	 					});
	 				}
 				}	
 			});
 		}
 	});
 </script>
 <% end sub %>