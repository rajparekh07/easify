<!--#include virtual="/layout.asp"-->
<!--#include virtual="/database.asp"-->
<% sub contentsofdoc %>

	<div class="container" id="data-div">
	<div class="row" style="padding-top:100px;padding-bottom:100px">
	<div id="empty-div" hidden="hidden">
			    <div class="container valign">
			        <div class="row">
			            <div class="card-panel black">
			             <h4 class="roboto-thin-text">NO POSTS YET! HOLD ON TIGHT!</h4>
			            </div>
			        </div>
			    </div>
			</div>
		<div class="col s12 m12 l6 offset-l3">
		<%
		count = 0
		dim rs : set rs = newConnection().execute("SELECT Distinct posts.*, users.ID, users.FullName, users.Email FROM users INNER JOIN (tags INNER JOIN (posts INNER JOIN post_tag ON posts.ID = post_tag.PostID) ON tags.ID = post_tag.TagID) ON users.ID = posts.AuthorID order by posts.CreatedAt desc")
		while not rs.eof
		dim rs2 : set rs2 = newConnection().execute("SELECT tags.* FROM tags where tags.ID in (Select TagID from post_tag where post_tag.PostID = "&rs("posts.ID")&")")
		%>
			<div class="col s12 m12 l12" >
			
				<div class="card hoverable data-card" id="<%=rs("posts.ID")%>">
					<div class="card-content">
						<!-- <p class="roboto-thin-text">By <%=rs("FullName")%>, at <%=rs("CreatedAt")%></p> -->
						<span class="new badge left-align roboto-thin-text" data-badge-caption="By <%=rs("FullName")%>, at <%=rs("CreatedAt")%>"></span>
						<br>
						<span class="card-title large" class="first-title"><%=rs("Title")%></span>
						<p style="font-size: 20px;padding-left: 25px;height: 10vh" class="truncate">
							<%=rs("Content")%>
						</p>
						<p class="first-tags-post">Tags: <span class="first-tags">
							<% while not rs2.eof
								response.write " "&rs2("TagName")
							 	rs2.movenext
							 	wend
							 %>
						</span></p>
					</div>
				</div>	
			</div>
			
	
		<% 	
			count = count + 1
			rs.movenext
			wend 
		%>
		</div>
	</div>
	</div>

	 <a href="/create" class="btn-floating btn-large waves-effect waves-light red" id="create-floating-btn"><i class="material-icons">add</i></a>
 <% end sub %>
 <% sub contentsofhead %>
	
 <% end sub %>
  <% sub contentsofbottom %>
<script type="text/javascript">
			$(document).ready(function(){
			 	$('.card').click(function(){
			 		window.location.href = "/post/?postID="+this.id;
			 	});
			});
 </script>
 <script type="text/javascript">
    $(document).ready(function(){
        if($('.card').length==0){
            $('#empty-div').show().addClass("center-align");
           
        }

    });
</script>
 <% end sub %>