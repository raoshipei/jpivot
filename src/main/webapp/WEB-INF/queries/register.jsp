<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="mondrian" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>

<jp:mondrianQuery id="query01" catalogUri="/WEB-INF/queries/register.xml"
                  jdbcDriver="com.mysql.jdbc.Driver"
                  jdbcUrl="jdbc:mysql://localhost:3306/jsct"
                  jdbcUser="root"
                  jdbcPassword="123456"

>


    select
    {([报名区县].[所有区县],[学生户籍类型].[所有户籍类型],[学生民族].[所有民族],[政策优抚类型].[所有优抚类型],[学生类型].[所有学生类型], [学生性别].[所有性别])} ON rows,

    {[Measures].[报名人数],[Measures].[报名录取人数],[Measures].[报名录取率]} on columns

    from [register and enroll]
</jp:mondrianQuery>
<c:set var="title01" scope="session">报名统计</c:set>