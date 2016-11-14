<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" data-name="skins">
<link rel="stylesheet" href="../css/layout/wide.css" data-name="layout">
<link rel="stylesheet" href="../css/fractionslider.css"/>
<link rel="stylesheet" href="../css/style-fraction.css"/>
<link rel="stylesheet" href="../css/animate.css"/> 

<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
</script>

<br>
<fieldset>
<FORM name='frm' method='POST' action='./update.do'>
  <input type="hidden" id='cm_no' name='cm_no' value="${commuReplyVO.cm_no }">
  <input type="hidden" id='rno' name="rno" value="${commuReplyVO.rno }"> 
  <input type="hidden" name="rnick" value="nick"> <!-- 임시값 -->
    <div class="span3 offset1">
      <label for='rnick'><i class="fa fa-leaf"> nick </i></label> 
    </div>
    <br>
    <textarea  rows="5" class="form-control" name='rcontent' id='rcontent' required="required">
    ${commuReplyVO.rcontent }</textarea>
    <ul>
    <li class='right'>
    <button type="submit" id='submit' class="btn btn-success btn-xs" style='float:right; margin: 5px;'>
    <i class="fa fa-edit"></i> 수정</button>
    <button type="button" class="btn btn-info btn-xs" style='float:right; margin: 5px;' onclick="location.href='./commuReplylist.do?cm_no=${commuReplyVO.cm_no}'">
    <i class="fa fa-list"></i> 목록</button>
    </li>
    </ul>  
 </FORM>
</fieldset>

 