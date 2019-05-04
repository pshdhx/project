<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style type="text/css">
		.se{float: left;width:100%;}
		.se .lf{width: 454px;height: 32px;border: 2px solid #b61d1d;float: left;}
		.se .clik{width: 77px;height: 36px;float: left;border:none;background:#b61d1d;color: #fff}
		.se a{padding:5px;float:left;font-size: 10px;}
		
			#searchpid{
				border: medium double #ff0000;
				height:30px;
				width:500px;
				border-style: solid;
				
			}
			#search{
				height:38px;
				background:red;
				border-color:red;
				margin-left:-8px;
				width:60px
				
			}
		input::-webkit-input-placeholder {
          /* placeholder颜色  */
       color: #aab2bd;
        /* placeholder字体大小  */
        font-size: 15px;
       /* placeholder位置  */}
</style>
<div class="span10 last" style="width:100%">
		<div class="topNav clearfix" style="width:100%">
			<ul>
			<s:if test="#session.existUser == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a>|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>|
			</li>
			</s:if>
			<s:else>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<s:property value="#session.existUser.name"/>
				|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a>
			|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>|
			</li>
			</s:else>
		
			<li><a>会员中心</a> |</li>
			<li><a>购物指南</a> |</li>
			<li><a>关于我们</a></li>
		</ul>
		<hr style="solid;width:100%;color:#dfdfdf;">	
		</div>
		<div class="cart" style="float:right;position:absolute;z-index:3;margin-top:6px;right:23%;" id="cart">
			<a  href="${pageContext.request.contextPath }/cart_myCart.action">购物车</a>
		</div>
		
		<%-- 
			<div class="phone">
				客服热线:
				<strong>96008/53277764</strong>
			</div> --%>
	</div>
	<div id="searchDiv" style="float:left;width:100%">

		<form name="searchform" action="product_searchform.action?page=1" method="get" accept-charset="utf-8" class="se">
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input id="searchpid" name="searchpname" style="font-size: 10pt; color: rgb(85, 85, 85);" value="<s:property value='#session.searchpname'/>"
	    	 onfocus="this.value=' '"  size="25" maxlength="30" type="text" placeholder="主机处理器  i9" />
	    	
			<input id="search" name="search" type="submit" value="搜索" />
			<input type="text" value="1" name="page" hidden="true"/>
	    </form>
	    
	    <br/>
	    <span style="margin-left:190px;" id="recommendSpan">
	    		<a href="#"> <font style="color:#a7a7a7;font-size:13px;">爱车出游记 &nbsp;&nbsp;&nbsp;&nbsp;</font></a> 
	    		 <a href="#"><font style="color:#a7a7a7;font-size:13px;">五一嗨购 &nbsp;&nbsp;&nbsp;&nbsp; </font></a>
	    	 	 <a href="#"><font style="color:#a7a7a7;font-size:13px;">出游防晒&nbsp;&nbsp;&nbsp;&nbsp;</font> </a>
	    	 	<a href="#"> <font style="color:#a7a7a7;font-size:13px;">五一满减 &nbsp;&nbsp;&nbsp;&nbsp;</font></a>
	    	 	<a href="#"> <font style="color:#a7a7a7;font-size:13px;">世园会 &nbsp;&nbsp;&nbsp;&nbsp;</font></a>
	    	 	<a href="#"> <font style="color:#a7a7a7;font-size:13px;">9.9元拼 &nbsp;&nbsp;&nbsp;&nbsp;</font></a>
	    	 	<a href="#"> <font style="color:#a7a7a7;font-size:13px;">家装节 &nbsp;&nbsp;&nbsp;&nbsp;</font></a>	 	
	    </span>
	    
	    
</div>
	
	
	
	<div class="span24">
		<ul class="mainNav">
					<li><a href="${pageContext.request.contextPath}/index.action ">首页</a>|</li>
					<s:iterator var="c" value="#session.cList">
			<li>
				<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1">
				<s:property value="#c.cname"/></a> |
			</li>
		</s:iterator>
					
		</ul>
	</div>
