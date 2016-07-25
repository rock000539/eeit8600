<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="member-header" class="detail-list">
	<div id="memberphoto" class="detail-list-col1">
	   	<img src="/members/show?memberId=${memberId}"/>
	</div>
	<div class="detail-list-col2">
	       <h3>${member.nickname}</h3>
	       <p>${member.gender}, ${member.skinType} skin, from ${member.addr}</p>
	</div>
</div>