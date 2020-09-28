<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN"
     "http://www.w3.org/TR/REC-html40/strict.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib uri="http://www.tonbeller.com/wcf" prefix="wcf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>【数据挖掘分析工具】首页</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="shortcut icon" href="images/favicon.ico"/>
 <%-- <link rel="stylesheet" type="text/css" href="css/mdxtable.css">
  <link rel="stylesheet" type="text/css" href="css/mdxnavi.css">--%>
  <link rel="stylesheet" type="text/css" href="css/footer.css">
    <style type="text/css">
        ul{
            list-style-type: circle;
        }
        html, body {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body  style="margin: 0" bgcolor="#d3d3d3">
    <div style="height: 100%;" >
        <div style="background: #38a0f5;padding: 10px;margin: 0px;height: 80px;vertical-align: middle">
            <%--<h2>JPivot Demonstration</h2>--%>
            <%--<h2>数据挖掘</h2>--%>
                <span style="color: white;font-size: 16px;">|数据挖掘</span>

               <%-- <h2><img style=" vertical-align: middle" class="title" src="images/logo2.png" alt="数据挖掘"/> 数据挖掘</h2>--%>

            <c:if test="${query01 != null}">
              <jp:destroyQuery id="query01"/>
            </c:if>
        </div>
        <hr style="color: grey"/>
    <%--<h3>Using the Mondrian OLAP engine</h3>--%>
        <div style="height: 64%;bactkground-image: url('images/home-bg.png');margin: 20px;">
            <ul>
             <%-- <li><a href="testpage2.jsp?query=mondrian">Slice and Dice with two hierarchies</a></li>
              <li><a href="testpage2.jsp?query=fourhier">...and with four hierachies</a></li>
              <li><a href="test/param3.jsp?query=mondrian">Dynamic parameters with Mondrian</a></li>
              <li><a href="testpage2.jsp?query=arrows">Arrows in Cells</a></li>
              <li><a href="testpage2.jsp?query=colors">Colors in Cells</a></li>--%>
              <li><a href="showpage.jsp?query=testquery">Test data</a></li>
                 <li><a href="testpage2.jsp?query=tezz">Test data2</a></li>
                 <%--<li><a href="testpage2.jsp?query=qiuschema">Test data3</a></li>--%>
              <li><a href="showpage.jsp?query=register">报名情况</a></li>
              <li><a href="showpage.jsp?query=enroll">录取情况</a></li>
             <%-- <li><a href="test/param1.jsp?query=testquery">Dynamic parameters with test data</a></li>--%>
            </ul>
        </div>
        <%--<jsp:include page="_footer.html"></jsp:include>--%>
    </div>
<%--<p/>

<h3>Using XML/A</h3>
<p/>
XML/A is a Web services protocol and standard that allows JPivot to connect to Microsoft 
Analysis Services and Mondrian on other machines. This example connects to Mondrian via
XML/A where you are running JPivot.
<p/>
<ul>
  <li><a href="testpage2.jsp?query=mondrianXMLA">Slice and Dice with two hierarchies</a></li>
</ul>
<p/>--%>




</body>
</html>
