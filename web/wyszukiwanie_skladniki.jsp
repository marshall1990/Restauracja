<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %>

<%--<sql:setDataSource var="danias" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://sql09.freemysql.net:3306/dania" user="hariseldon" password="123qwe"
scope="session" /> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="wyszukiwanie_skladniki1.css" />
        <title>JSP Page</title>
    </head>
    <body>

<%
Connection conn = null;
ResultSet rst=null;

try {
    Class.forName((String)session.getAttribute( "driver" )).newInstance();
    conn = DriverManager.getConnection((String)session.getAttribute( "url" )+(String)session.getAttribute( "dbName" ),(String)session.getAttribute( "userName" ),(String)session.getAttribute( "password" ));   
           
    String sql="SELECT skladnik FROM skladniki";
    //String dania_nazwy[]= request.getParameterValues("skladnik");
    
    //if(dania_nazwy != null) for(int i=0; i<dania_nazwy.length; i++)
       // { 
      //     sql=sql+"SELECT `ID_dania` FROM `daniaskladniki` where `ID_skladnika` in (SELECT `ID_skladnika` from `skladniki` where `Skladnik`=?)";
     //      if (i<dania_nazwy.length-1) sql=sql+" UNION ";
       //           }        
     //   { 
       //    sql=sql+"SELECT `Nazwa` FROM danie where `ID_dania` in (SELECT `ID_dania` FROM `daniaskladniki` where `ID_skladnika` in (SELECT `ID_skladnika` from `skladniki` where `Skladnik`=?))";
      //     if (i<dania_nazwy.length-1) sql=sql+" UNION ";
           
           
    //    }
    PreparedStatement statement=conn.prepareStatement( sql );
    
    //for(int i=0; i<dania_nazwy.length; i++) {
   //     statement.setString(i+1,dania_nazwy[i]);
   //   }
    
   // out.println(statement);
            rst=statement.executeQuery();
 %>
 <h1>Składniki</h1>
                   
 <form name="form1" onsubmit="checkBoxValidation()" action="podaj_dania.jsp">
 
 <table><%             
while (rst.next()) {
            %>
    
                                <tr>
                                    <td><input type="checkbox" name="skladnik" value="<%=rst.getString(1)%>" /></td> <td><%=rst.getString(1)%></td>
                                </tr>
                            
      <%  } %>
    </table> 
    <p><input type="submit" value="submit"/>
    </form>   
     <%
           
            conn.close();
           // out.println("Rozłączony z bazą");
    
    }
	catch (Exception e) {
  e.printStackTrace();
  out.println("błąd rejestracji użytkownika");
    }
%>        


        
           
          <%--  <sql:query var="result" dataSource="${danias}">
                SELECT skladnik FROM skladniki
            </sql:query>
            
         
           
                <!-- column data -->
                <c:forEach var="row" items="${result.rowsByIndex}">
              
                        <c:forEach var="column" items="${row}">
                            <%--  <td><c:out value="${column}"/></td> --%>
              <%--              <table> 
                                <tr>
                                    <td><input type="checkbox" name="skladnik" value="${column}" /></td> <td>${column}</td>
                                </tr>
                            </table>
                        </c:forEach>
    
                </c:forEach>--%>
                
                        
     
                         
    </body>
</html>
