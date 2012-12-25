<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags" %>

<link href = "/static/common/css/common.css" rel = "stylesheet"></link>
<script src="/static/common/scripts/src/menu.js" type="text/javascript"></script>

<div id = "headcontain">
		<div id = mainpage>
			<a href = "#">设为主页  </a>|<a href = "#"> English Version </a>
		<div id = "searchbar">
		<!-- 表单 -->
			<form id="searchForm" name="form1" method="post" action="#" target="_blank">
    			<label>
       				<input type="hidden" id="searchVpath" name="vpath" value="" />
       				<input type="text" class="word" value="Search..." onfocus="this.value=''" 
       					   onBlur="if(this.value==''){this.value='Search...';}"
       					   style = "height: 15px; margin-top: 4px; margin-left: 18px;"/>
       				<input type = "submit" name = "button" class = "button" value = "" />
      			</label>
   			</form>
		</div>
		</div>	
	</div>
	
	<menu id="homemenu">		
    		<li><a href ="#">学院概况</a>
		        <ul id="downlist">
		            <li><a href="/introduce/402881e93b41ec78013b41f8a5cf0008.html">学院简介</a></li>
		            <li><a href="/introduce/leader.jsp">领导简介</a></li>
		            <li><a href="/introduce/view.jsp">校园美景</a></li>
		            <li><a href="/introduce/contact.jsp">联系我们</a></li>
		        </ul>
		    </li>
		    <li><a href="#">部门机构</a>
		        <ul id="downlist">
		            <li><a href="/organization/facultyset.jsp" >系部设置</a></li>
		            <li><a href="/organization/depset.jsp">部门设置</a></li>
		        </ul>
		    </li>
    		<li><a href="/jiaowu/">教学科研</a></li>
		    <li><a href="#">学生工作</a>
		        <ul id="downlist">
		            <li><a href="/xuegong/">学工处</a></li>
		            <li><a href="/tuanwei/">团委</a></li>             
		        </ul>
		    </li>
    		<li><a href="/zuzhi/">组织人事</a></li>
		    <li><a href="#">招生就业</a>
		        <ul id="downlist">
		            <li><a href="/zhaosheng/">招生录取</a></li>
		            <li><a href="/jiuye/">就业指导</a></li>
		        </ul>
		    </li>  
		    <li><a href="#">交流合作</a>
		        <ul id="downlist">
		            <li><a href="/international/international.jsp">海外学习计划</a></li>
		            <!-- <li class = "subMenu"><a href = "/cooperation/ff8081813b7a2ecd013b7a3a0ece000b.html">联合办学</a></li> -->
		        </ul>
		    </li>
		    <li><a href="#">公共服务</a>
		        <ul id="downlist">
		            <li><a href="/service/ff8081813b6fee04013b6fef4b390002.html">校历</a></li>
		            <li><a href="/service/ff8081813b7a2ecd013b7a384fb20008.html">来稿须知</a></li>
		            <li><a href="/service/guide.jsp">办事指南</a></li>
		            <li><a href="/service/ff8081813b6fee04013b6ff2b1d90011.html">作息时间</a></li>
		            <li><a href="/service/ff8081813b6fee04013b6ff3a36c0017.html">办公电话</a></li>
		            <li><a href="/service/ff8081813b6fee04013b6ff158fb0008.html">校园交通</a></li>
		        </ul>
		    </li>
		    <li><a href="#">技术支持</a>
		    	<ul id="downlist">
		    		<!-- <li><a href="/ruanyan/">软件研发与培训中心</a></li> -->
		            <li><a href="/xiandai/">现代教育技术中心</a></li>	
		        </ul>
		    </li>	
	</menu>
		
	<div id = "decoration">
	</div>

<div id="body">
<% if (request.getParameter("displaySideBar").equals("true")) {%>
	<div id="sideBar">
		<div id = "sideBarin">
		<div id = "title_style"><strong>要文回顾</strong><span style= "float: right;"><a href = "/news/more/">更多...</a></span></div>
		<cms:PostList id="ywhgList" cssClass="TextList" categoryId='news' count="9" />
		<div id = "title_style"><strong>新闻排行榜</strong><span style= "float: right;"></span></div>
		<cms:PostList id="ywhgList" cssClass="TextList" categoryId='news' subcategoryId="rank" count="9" />
		</div>
	</div>
	<div id = "bodyContent">
<%}%>