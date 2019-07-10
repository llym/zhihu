<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function deleteIdea(id){
		if(confirm("确认删除？")){
			$.post("deleteIdea.do",{
				id:id
			},function(data){
				alert(data)
				window.location.relaod();
			});
			
		}
		
	}
</script>

<div>
	<h4 class="ml-3 font-weight-bold">我的想法</h4>
</div>
<div id="ideas">
	<c:forEach items="${ideas}" var="idea">
		<div id="ideas-item">
			<div id="item-content">
				<div class="row m-3">
					<img id="${username}" alt="头像" src="common/image/1.jpg"
						class="image1" onload="getPhotoPath(this)">
					<h3 class="ml-3 font-weight-bold pull-right">${username}</h3>
				</div>
				<div class="row m-3">
					<p class="font-weight-bold">${idea.ideacontent}1111</p>
					
					
				</div>
				<div class="row m-3">
					<img id="${idea.ideaid}" alt="想法的图片"
						src="common/image/1.jpg" class="image2"
						onload="getIdeaPhotoPath(this)">
				</div>
				<div class="row ml-3">
				
					<small>发布于<fmt:formatDate value="${idea.createtime}" pattern="yyyy-MM-dd"/></small>
				</div>
				<div class="row m-3">
					<a class="" href="#" onclick="deleteIdea(${idea.ideaid})"><small>删除</small></a>
				</div>
			</div>
		</div>
		<hr>
	</c:forEach>

</div>