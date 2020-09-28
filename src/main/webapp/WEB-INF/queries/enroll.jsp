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
    {([录取区县].[所有区县],[学校级别].[所有中小学校],[学校性质].[所有公办民办学校],[学生户籍类型].[所有户籍类型],[学生民族].[所有民族],[政策优抚类型].[所有优抚类型],[学生类型].[所有学生类型], [学生性别].[所有性别])} ON rows,

    {[Measures].[计划总数], [Measures].[录取人数]} on columns

    from [register and enroll]
</jp:mondrianQuery>
<jp:mondrianQuery id="query02" catalogUri="/WEB-INF/queries/register.xml"
                  jdbcDriver="com.mysql.jdbc.Driver"
                  jdbcUrl="jdbc:mysql://localhost:3306/jsct"
                  jdbcUser="root"
                  jdbcPassword="123456"

>

    select
    {[Measures].[录取人数]} on columns,
    {([录取区县].[所有区县],[学校级别].[所有中小学校],[学校性质].[所有公办民办学校],[学生户籍类型].[所有户籍类型],[学生民族].[所有民族],[政策优抚类型].[所有优抚类型],[学生类型].[所有学生类型], [学生性别].[所有性别])} ON rows
    from [enroll]
</jp:mondrianQuery>
<c:set var="title01" scope="session">录取统计</c:set>