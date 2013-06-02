/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

/**
 *
 * @author Marzena
 */


import java.sql.*;
import java.util.Scanner;

public class BazaDanych {

public static void main(String[] args) {
Connection conn = null;
String url = "jdbc:mysql://mysql3.ph-hos.osemka.pl:3306/";
String dbName = "761934_dania";
String driver = "com.mysql.jdbc.Driver";
String userName = "1359043908_f";
String password = "123qwe";
try {
Class.forName(driver).newInstance();
conn = DriverManager.getConnection(url+dbName,userName,password);
System.out.println("Połączony z bazą");


Scanner sc = new Scanner (System.in);
String i="",autor, title, index, date,id;
int pom;


	while (!i.equals("exit"))
		{
			i = sc.next();
			if (i.equals("Add")) {
				System.out.println("Podaj autora");
				autor = sc.next();
				System.out.println("Podaj tytuł");
				title = sc.next();
				System.out.println("Index");
				index = sc.next();
				System.out.println("Datę wydania");
				date = sc.next();
				
				Statement st = conn.createStatement();
				
				Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						ResultSet rs = stmt.executeQuery("SELECT id FROM ksiazki");
						rs.last();
						pom=rs.getInt("Id")+1;
						id=""+pom;
				st.executeUpdate("INSERT INTO `Biblioteka`.`ksiazki` ( `Id` , `Autor` , `Tytul`,`Index` ,`Data-wyd`)VALUES ('"+id+"','"+autor+"','"+title+"','"+index+"','"+date+"')");		
				}
			
			if (i.equals("remove")) {
				System.out.println("Podaj numer rekordu");
				i = sc.next();
				Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						ResultSet rs2 = stmt1.executeQuery("SELECT id FROM ksiazki");
						 while (rs2.next()) {
						      if (i.equals(""+rs2.getInt("Id"))) {
							     rs2.deleteRow();
							     System.out.println("Usuniete");
						        }
				
			               }
	             }
			
			
			if (i.equals("show")){
				Statement st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ResultSet rs=st.executeQuery("SELECT * FROM danie");
				while(rs.next()){
					int id2 = rs.getInt("ID_Dania");
					String autor2 = rs.getString("przepis");
					//String tytul = rs.getString("tytul");
					//String index2 = rs.getString("index");
					//String datew = rs.getString("Data-wyd");
					System.out.println(id2 + " " + autor2); //+ " " + tytul + " " + index2 + " " + datew);	
				}}
			
			
			
			if (i.equals("search")){
				Statement st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ResultSet rs=st.executeQuery("SELECT * FROM ksiazki");
				System.out.println("Podaj poszukiwanego autora");
				i = sc.next();
				while(rs.next()){
					if (i.equals(rs.getString("autor"))) {
						int id2 = rs.getInt("id");
						String autor2 = rs.getString("autor");
						String tytul = rs.getString("tytul");
						String index2 = rs.getString("index");
						String datew = rs.getString("Data-wyd");
						System.out.println(id2 + " " + autor2 + " " + tytul + " " + index2 + " " + datew);	
				        }
					
				
				}
				
				
			 }
		}
conn.close();
System.out.println("Rozłączony z bazą");

}
	catch (Exception e) {
  e.printStackTrace();
    }
}
}