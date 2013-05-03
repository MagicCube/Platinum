﻿<%@page import="platinum.platform.web.HttpClientCache"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags" %>
  
<%
HttpClientCache clientCache = new HttpClientCache(request, response);
clientCache.setMaxAge(60);
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<cms:Meta/>
<title>南京师范大学中北学院欢迎您</title>

<link href="/static/common/css/basic.css" rel = "stylesheet"></link>
<link href="/static/home/css/home.css" rel = "stylesheet"></link> 

</head>
<body>
		<img src="/static/common/images/spring1.jpg" width="100%" height="814" style="position:absolute;margin:0;padding:0;z-index:-1;">
		<cms:Header/>
		 
		<!-- <div id="code">-->
		<!--  	<a href="http://211.65.211.222:8080/" ><img src="/static/common/images/code.png" title="扫描二维码 体验中北学院移动门户" height="117px" width="90px"/></a>-->
		<!--  </div>-->
	
		<div id="middle">
			<div id="photoslider">
				<ul id="select">
						<li class="selectC" id="sel1">1</li>
						<li class="selectC" id="sel2">2</li>
						<li class="selectC" id="sel3">3</li>
						<li class="selectC" id="sel4">4</li>
				</ul>
				<div id="tpxwMorelabel"><a href="/news/sc000000000000000000000000000207/more/">更多</a></div>
				<cms:PhotoSlide id="tsztList" cssClass="bxslider" subcategoryId="sc000000000000000000000000000207" displayPhoto="true" count="4" />	
			</div>
			
			<div id="news">
				<div id="newslabel"><span id="text">新闻动态</span></div>	
				<!--<cms:PostList id="xwdtList1" cssClass="PhotoList" subcategoryId="sc000000000000000000000000000006" displayPhoto="true" pageIndex="4" pageSize="1" displayPageNavigationBar="false" />-->
				<cms:PostList id="xwdtList1"  cssClass="PhotoList" subcategoryId="sc000000000000000000000000000006"  displayPhoto="true"  count="1" />
				<cms:PostList id="textContent" subcategoryId="sc000000000000000000000000000006"   where="photoURL is null"  count="8" />
				<div id="morelabel"><a href="/news/sc000000000000000000000000000006/more/">更多</a></div>
			</div>
			
			<div id="jgzj">
				<div id="jgzjlabel">
					<span id="text">教工之家</span>
				</div>
				<ul id="jgzjContent">
				<form name="Login" action="http://zbvip.njnu.edu.cn/vip/Admin_ChkLogin.asp" method="post" target="_parent">	
					<li id="jgzjLeft">
						<ul>
							<li class="biaodan">
								<span>用户:</span>
								<input name="UserName" type="text" />
							</li>
							<li class="biaodan">
								<span>密码:</span>
								<input name="Password" type="password" />
							</li>
							<li class="biaodan">
								<span style="width:70px">验证码:</span>
								<input name="CheckCode" style="width:65px"/>
							</li>
						</ul>
					</li>
					<li id="jgzjRight">
						<ul>
							<li class="button">
								<input name="Submit"  id="submit" type="submit"  value="" style="background: url(static/home/images/denglu.png) no-repeat;">
							</li>
							<li class="button">
								<input name="reset" type="reset" id="quit" value="" style="margin-top:7px;background: url(static/home/images/quit.png) no-repeat;">
							</li>
							<li class="button" style="margin-top:13px;">
								<img src="http://zbvip.njnu.edu.cn/vip/inc/code.asp" width="77" height="25" border="0" align="absmiddle" onclick="javascript:this.src='http://zbvip.njnu.edu.cn/vip/inc/code.asp?'+Math.random();">
							</li>
						</ul>
					</li>
				</form>
				</ul>
			</div>
			
			<div id="school">
				<div id="schoollabel"><span id="text">校园动态</span></div>
				<!--<cms:PostList id="xydtList1" cssClass="PhotoList" subcategoryId="sc000000000000000000000000000020" displayPhoto="true" count="1" />-->
				<cms:PostList id="text_school" subcategoryId="sc000000000000000000000000000020" where="photoURL is null" count="5" />
				<div id="morelabel"><a href="/news/sc000000000000000000000000000020/more/">更多</a></div>
			</div>
			
			<div id="inform">
				<div id="labellong"><span id="text">通知公告</span></div>
				<cms:PostList id="text_inform" subcategoryId="sc000000000000000000000000000008" where="photoURL is null" count="6" />
				<div id="morelabel"><a href="/news/sc000000000000000000000000000008/more/">更多</a></div>
			</div>
			
			<div id="usedlink">
				<div id="linklabel"><span id="text">常用链接</span></div>
				 <ul id="left">
					<li><a href="http://zbvip.njnu.edu.cn/" target="_blank">教工之家</a></li>
					<li><a href="http://222.192.5.246/(khvomn45dim5kn3kj4t0gh55)/default2.aspx" target="_blank">教务系统</a></li>
					<li><a href="http://web.mobset.com/index.html" target="_blank">短信平台</a></li>
				</ul>
				
				<ul id="right" style="left: 140px;">
					<li><a href="/service/ff8081813b6fee04013b6ff3a36c0017.html">办公电话</a></li>
					<li><a href="/service/ff8081813b6fee04013b6ff158fb0008.html">校园交通</a></li>
					<li><a href="https://mail.njnu.edu.cn/" target="_blank">邮件在线</a></li>
				</ul>
				
				<div id="morelabel"><a href="/service/ff8081813be18002013be18e03250002.html">更多</a></div>
			</div>
		</div> 
	</div> 
	<cms:Footer1/>
</body>
</html>
