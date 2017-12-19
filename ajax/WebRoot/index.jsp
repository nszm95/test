<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/ajax/css/style.css">
	<script>
		var httpRequest;
		function createXMLHttp(){
			if(window.XMLHttpRequest){
				httpRequest=new XMLHttpRequest();
			}else{
				httpRequest=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
		}
		
		function callback(){
			if(httpRequest.readyState==4){
				if(httpRequest.status==200){
					var result=httpRequest.responseXML;
					
					var contentArr =result.getElementsByTagName("content");
					
					var table=document.getElementById("bodyTable");
					for(var i=0;i<contentArr.length;i++){
						var content =contentArr[i];
						var contentText=content.childNodes[0].firstChild.nodeValue;
						var num=content.childNodes[1].firstChild.nodeValue;
						var row= table.insertRow(-1);
						var cell=row.insertCell(-1);
						cell.innerHTML=contentText;
						var cell=row.insertCell(-1);
						cell.innerHTML=num;
						cell.align="right";
					}
				}
			}
		}
		
		function detial(){
			var table=document.getElementById("bodyTable");
			if(table.rows.length>1){
				var len=table.rows.length;
				for(var i=1;i<len;i++){
					table.deleteRow(1);
				}
			}
			createXMLHttp();
			var input=document.getElementsByTagName("input")[0].value;
			httpRequest.open("get","Glv?input="+input,true);
			httpRequest.onreadystatechange=callback;
			httpRequest.send(null);
		}
	</script>
  </head>
  
  <body>
  	<div class="head">
   	 <table>
    	<tr>
    		<td><a href="">首页</a></td>
    		<td><a href="">图片</a></td>
    		<td><a href="">视频</a></td>
    		<td><a href="">新闻</a></td>
    		<td><a href="">地图显示</a></td>
    	</tr>
   	 </table>
    </div>
    <div class="body">
    	<img src="/ajax/img/1.PNG"/><br/>
    	<table id="bodyTable">
    		<tr>
    			<td colspan="2">
    				<input type="text" onkeyup="detial()" class="inputArea"  name="input">
    			</td>
    			<td>
					<input type="button" value="搜索" class="check"/>
				</td>
    		</tr>
    	</table>
    </div>
  </body>
</html>
