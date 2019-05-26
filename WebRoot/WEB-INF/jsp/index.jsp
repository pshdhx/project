<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>tiny netMarket</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/my2.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/my3.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
   <script>
    $(function () {
      
      $(".tab-item").mouseenter(function () {
        //两件事件
        $(this).addClass("active").siblings().removeClass("active");
        var idx = $(this).index();
        $(".main").eq(idx).addClass("selected").siblings().removeClass("selected");
      });


      $(".tab-item").mouseleave(function () {
        //两件事件
        var idx = $(this).index();
        $(".myContainer").mouseleave(function(){
        	 $(".main").eq(idx).addClass("noselected").siblings().removeClass("noselected");
        });
        
       
      });
    });
    </script>
    
<script src="./jquery-1.12.4.js"></script>
	<script>
		$(document).ready(function(){
			var speed = 2600;
			var m = 0;
			var playTimer = setInterval(runPlay,speed);
			//定时函数
			function runPlay(){
				if(m>4){
					m=0;
				}
				console.log(m);
				controlPlay(m);
				m++;
			}
			//控制图片变化 图标变化
			function controlPlay(n){
				$("#imgList a").removeClass("current").eq(n).addClass("current");
				$("#iconList li").removeClass("current").eq(n).addClass("current");
			}

			//给整个轮播图绑定鼠标悬停事件
			$("#playBox").mouseenter(function(){
				//停止时刻
				clearInterval(playTimer);
				//左右控制按钮显示
				$(".slidebar").fadeIn(300);

			}).mouseleave(function(){
				playTimer = setInterval(runPlay,speed);
				$(".slidebar").fadeOut(300);
			})

			//给li 控制图标绑定单击事件
			$("#iconList li").click(function(){
				controlPlay($(this).index());
				m=$(this).index()+1;
			}).hover(function(){
				return false;
			})

			//给左右的控制图标取消 鼠标悬停冒泡
			$(".slidebar").hover(function(){
				return false;
			})
			$(".sliderbar-right").click(function(){
				if(m>4){
					m=0;
				}
				controlPlay(m);
				m++;
			})
			$(".sliderbar-left").click(function(){
				m-=2;
				if(m<0){
					m=4;
				}
				controlPlay(m);
				m++;
			})

		});

	</script>
</head>
<body style="background-color:#f0f3ef;">
<img src="${pageContext.request.contextPath}/image/headerImage.png" style="width:100%; height:80px;"/>
<div class="container header">
				<%@ include file="menu.jsp" %>
</div>

<div class="myContainer" style="height:340px; ">

  
	  <ul class="tab" style="width:162px;float:left;height:340px;margin-left:280px;">
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;家用电器</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;手机/运营商/数码</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;电脑/办公</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;家居/家具/家装</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;男装/内衣</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;美妆/个体护洁</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;男鞋/运动/户外</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;房产/汽车</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;母婴/玩具乐器</li>
	    <li class="tab-item" style="text-align:left;width:162px">&nbsp;食品/酒类/生鲜/特产</li>
	    
	  </ul>
  
		  
			  <div class="products" style="background-color:; margin-right:275px;height:340px;width:800px;float:right;z-index:1;">
			  	<%-- <div style="background-color:red;height:340px;" class="slider">
			  			<ul>
			  				<li><a href="#"><img src="imagesroll/1.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/2.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/3.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/4.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/5.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/6.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/7.jpg" alt=""></a></li>
						    <li><a href="#"><img src="imagesroll/8.jpg" alt=""></a></li>
			  			</ul>
			  			 <div class="arrow">
						    <span class="arrow-left">&lt;</span>
						    <span class="arrow-right">&gt;</span>
						 </div>
			  	</div> --%>
			  	
			  	
			  	
			  		<div id="playBox" class="play-box" style="height:340px;margin-top:0px;margin-right:10px;">
		<div id="imgList">
			<a href="#" class="current">
				<img src="${pageContext.request.contextPath}/myrollImg/1.jpg"/>
			</a>
			<a href="#">
				<img src="${pageContext.request.contextPath}/myrollImg/2.jpg"/>
			</a>
			<a href="#">
				<img src="${pageContext.request.contextPath}/myrollImg/3.jpg"/>
			</a>
			<a href="#">
				<img src="${pageContext.request.contextPath}/myrollImg/4.jpg"/>
			</a>
			<a href="#">
				<img src="${pageContext.request.contextPath}/myrollImg/5.jpg"/>
			</a>
		</div>
		<div id="iconList">
			<ul>
				<li class="current">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
			</ul>
		</div>

		<div class="slidebar sliderbar-left"><</div>
		<div class="slidebar sliderbar-right">></div>
	</div>
			  	
		  	
		  	
		  	
		  	
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/家用电器.png" alt="" height="340px;"/></a>
			  	</div>
			  	
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/手机数码.png" alt="" height="340px;"/></a>
			  	</div>
			  	
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/电脑办公.png" alt="" height="340px;"/></a>
			  	</div>
			  	
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/家居用品.png" alt="" height="340px;"/></a>
			  	</div>
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/男装女装.png" alt="" height="340px;"/></a>
			  	</div>
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/运动户外.png" alt="" height="340px;"/></a>
			  	</div>
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/房产汽车.png" alt="" height="340px;"/></a>
			  	</div>
			  	<div class="main">
			  		<a href="###"><img src="${pageContext.request.contextPath}/images/玩具乐器.png" alt="" height="340px;"/></a>
			  	</div>
			  	<div class="main">
			  		<a href="###"><img src="images/视频酒类.png" alt="" height="340px;"/></a>
			  	</div>
		  	
		  </div>
</div>

<div class="container index">
		

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门商品</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					<ul class="tab">						
					</ul>

						<ul class="tabContent" style="display: block;">
								 <s:iterator var="p" value="hList">
									<li>
										<a href="${ pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank">
										<img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" style="display: block;"></a>
									</li>
								</s:iterator>
						</ul>	
			</div>
		</div>
		
		
		
		
		
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新商品</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab"></ul>					
						 <ul class="tabContent" style="display: block;">
									<s:iterator var="p" value="nList">
									<li>
										<a href="${ pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>	
									</li>
									</s:iterator>
						</ul>	
			</div>
		</div>
		
		
		
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>推荐商品</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab">					</ul>
						<s:if test="#session.existUser == null">
						000000000000000为未登录状态
						 <ul class="tabContent" style="display: block;">
									<%-- <c:forEach var="p" items="RecommendProductList2">
									<li>
										<a href="${ pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>	
									</li>
									</c:forEach> --%>
									<s:iterator var="p" value="maxHit">
									<li>
										<a href="${ pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>	
									</li>
									</s:iterator>
							
						</ul>
						</s:if>
						<s:else>
						 11111111111111登录状态  <br/>
						
							<ul class="tabContent" style="display: block;">
							<c:forEach items="${ RecommendProductList}" var="reProduct">
							<%-- 	${reProduct.pname} <br/> --%>
								<li>
								<a href="${ pageContext.request.contextPath}/product_findByPid.action?pid=${reProduct.pid }" target="_blank">
									<img src="${pageContext.request.contextPath }/${reProduct.image }"/>
								</a>
								</li>
								
							</c:forEach>

							
							
									
							
						</ul>	
						<%-- <s:property value="#session.RecommendProductList.size()"/> --%>
						</s:else>
			</div>
		</div>
		
		
		
		
		
		
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>新手指南</dt>
							<dd>
								<a  target="_blank">支付方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">配送方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">售后服务</a>
								|
							</dd>
							<dd>
								<a  target="_blank">购物帮助</a>
								|
							</dd>
							<dd>
								<a  target="_blank">蔬菜卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">礼品卡</a>
								|
							</dd>
							<dd>
								<a target="_blank">银联卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">亿家卡</a>
								|
							</dd>
							
					<dd class="more">
						<a >更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a>关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2015 网上商城 版权所有</div>
	</div>
</div>
</body></html>
