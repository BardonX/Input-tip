<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Java大数据篇之零基础开发搜索框自动补全系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="utf-8" />
	<style type="text/css">
	     *{margin: 0 ;padding: 0;}
	     body{background: url(img/855.jpg) no-repeat;}
	     #head{width: 100%;height: 60px; background: rgba(0,0,0,.2); text-align: center; line-height: 60px;
	           color: #fff;font-size: 24px;}
	     #logo{text-align:center; margin-top: 124px;}
	     #search{width: 640px; height: 40px; margin: 20px auto 0;}
	     #text{width: 538px; height: 34px; outline:none; border: 1px solid #ccc; text-indent: 8px; float: left;}
	     #btn{ width: 100px; height: 34px;float: left; border: none; outline: none;cursor: pointer;}/*margin-left: -6px*/
	     #more{ width: 534px;text-indent: 10px;height: ; float: left; border: 1px solid #ccc; border-top: none;}
	     #more ul li{list-style: none; width: ; height: 34px; line-height: 34px; background: #fff}
	     #more ul li:hover{background: #e3e3e3;}
	</style>
  </head>
  
  <body>
  <!-- 任务：：  选中值----   鼠标移开输入框，提示栏关闭 -->
    <div id="head"> Java大数据篇之零基础开发搜索框自动补全系统</div>
    
    <div id="logo">
        <img alt="" src="img/logo(1).png" width="270" height="129" />
    </div>
    
    <div id="search">
        <input type="text" id="text"  onkeyup="query();" />
        <input type="button" id="btn" value="百度一下"/> 
        <div id="more">
            <!-- <ul>
               <li>a</li>
               <li>a</li>
               <li>a</li>
               <li>a</li>
            </ul> -->
        </div>
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript">
               function query(){
            	   var content =$("#text").val();
            	   if(content==""){
            		   clearContent();
            		   return;
            	   }
            	   $.ajax({
            		   type:"post",
            		   url:"search",
            		   data:{"text":content},
            		   success:function(data){
            			  data=eval(data);
            			  clearContent();
            			  var ul=$("<ul></ul>")
            			  for(var i=0;i<data.length;i++){
            				  var li=$("<li>"+data[i].text+"</li>");
            				  ul.append(li);
            			  }
            			  $("#more").append(ul);
            		   }
            	   });
               }
               function clearContent(){
            	   $("#more ul").remove();
            	   //$("#more").hide();
               }
        </script>
    </div>
  </body>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
</html>
