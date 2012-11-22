<%@ tag import="platinum.common.util.DateUtil"%>
<%@ tag import="java.util.ArrayList"%>
<%@ tag import="java.util.List"%>
<%@ tag import="platinum.common.util.StringUtil"%>
<%@ tag import="platinum.cms.common.entity.PostEntity"%>
<%@ tag import="platinum.cms.runtime.service.PostRuntimeManager"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="id" required="true" rtexprvalue="true"%>
<%@ attribute name="categoryId" rtexprvalue="true"%>
<%@ attribute name="subcategoryId" rtexprvalue="true"%>
<%@ attribute name="where" rtexprvalue="true"%>
<%@ attribute name="displayPhoto" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="count" required="true" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="cssClass" rtexprvalue="true"%>
<%
if (displayPhoto == null)
{
	displayPhoto = false;
}

PostRuntimeManager manager = new PostRuntimeManager();
List<PostEntity> posts = null;
if (StringUtil.notNullOrEmpty(subcategoryId))
{
	posts = manager.loadLatestPostBySubcategory(subcategoryId, displayPhoto, where, count);
}
else if (StringUtil.notNullOrEmpty(categoryId))
{
	posts = manager.loadLatestPostByCategory(categoryId, displayPhoto, where, count);
}
%>
<ul id="${id}" class="PhotoSlide ${cssClass}">
<% for (PostEntity post : posts) {%>
<li>
	<div class = "slide">
    	<a href="<%= post.getLink()%>">
      	  <% if (displayPhoto) {%>
       	  <img src='<%= post.getPhotoURL()%>' />
      	  <% } %>
      	  <div class = "caption">
      	  	<p class ="title"><%= post.getTitle()%></p>
          </div>
    	</a>
    </div>
</li>
<% } %>
</ul>
