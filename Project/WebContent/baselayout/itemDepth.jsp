<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.ItemDataBeans"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<ul class="kijisize">
	<% ItemDataBeans item = (ItemDataBeans)request.getAttribute("item"); %>
	<% if(item.getDepth() == 1){ %>
		<li class="add">薄い</li>
		<li>やや薄い</li>
		<li>普通</li>
		<li>やや厚い</li>
		<li>厚い</li>
	<% }else if(item.getDepth() == 2){ %>
		<li class="add">薄い</li>
		<li class="add">やや薄い</li>
		<li>普通</li>
		<li>やや厚い</li>
		<li>厚い</li>
	<% }else if(item.getDepth() == 3){ %>
		<li class="add">薄い</li>
		<li class="add">やや薄い</li>
		<li class="add">普通</li>
		<li>やや厚い</li>
		<li>厚い</li>
	<% }else if(item.getDepth() == 4){ %>
	<li class="add">薄い</li>
		<li class="add">やや薄い</li>
		<li class="add">普通</li>
		<li class="add">やや厚い</li>
		<li>厚い</li>
	<% }else if(item.getDepth() == 5){ %>
	<li class="add">薄い</li>
		<li class="add">やや薄い</li>
		<li class="add">普通</li>
		<li class="add">やや厚い</li>
		<li class="add">厚い</li>
	<% }%>
</ul>