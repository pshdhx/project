<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网上商城管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="${pageContext.request.contextPath }/css/style2.css" rel="stylesheet" type="text/css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.js"></script>
<script src="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  location.href="index.html";
	  });
});
</script>
</head>
<body style="background: #278296">
<center><s:actionerror /></center>
<form method="post" action="${pageContext.request.contextPath }/adminUser_login.action" target="_parent" name='theForm' onsubmit="return validate()">
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tr>
    <td style="padding-left: 50px">
      <table>
	      <tr>
	        <dl class="admin_login" style="background-color:#278296;">
	        	<dt>
		  			<strong>商品推荐系统后台</strong>
		  			<em>Management System</em>
				 </dt>
	        		<dd class="user_icon">
	        			<input type="text" name="username" class="login_txtbx" />
	        		</dd>
	        		<dd class="pwd_icon">
	        			<input type="password" name="password" class="login_txtbx" />
	        		</dd>
	        		<dd>
		 		 		<input type="submit" value="立即登录" class="submit_btn"/>
		 			</dd>
	        </dl>
	        
	      </tr>
      </table>
    </td>
  </tr>
  
  </table>
</form>

</body>