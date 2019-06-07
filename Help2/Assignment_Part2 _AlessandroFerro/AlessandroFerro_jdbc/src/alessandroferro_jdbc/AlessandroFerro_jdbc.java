/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alessandroferro_jdbc;

/**
 *
 * @author aleferro
 */

import java.sql.*; 
import java.util.*; 
import java.io.*; 
import java.util.logging.Logger;

public class AlessandroFerro_jdbc {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.println("AIRPORT MAINTENANCE");
        try
       {
       // Get username and password from the user 
	BufferedReader input = new BufferedReader(new InputStreamReader(System.in)); 
        
	System.out.println("username: "); 
	String username = input.readLine(); 
	System.out.println("password: "); 
	String password = input.readLine();
        
        // Connect to the database 
	String myConnectionString = "jdbc:oracle:thin:@35.166.130.72:1521:xe"; 
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	Connection con = 
	DriverManager.getConnection(myConnectionString,username,password);
        System.out.println("You successfully logged in!");
        
        //input the code of the airline
    System.out.println("Enter one of the following Airline codes to display how many aircrafts it owns:\nQFA (QANTAS)\nRYA (Ryan Air)\nSIA (Singapore Airlines)");
	System.out.println("Airline: "); 
	String airline_code = input.readLine();
        
        // Select all data from table Airline
	Statement stmt; 
        stmt = con.createStatement();
	ResultSet r = stmt.executeQuery("SELECT AL.count_airplanes() FROM airline_table AL WHERE AL.airline_code = '" + airline_code + "'");

        // Display the data a row at a time 
	while (r.next()) 
	{ 
		System.out.println("Number of aircraft owned: " + r.getString("AL.count_airplanes()")); 
	}  
	stmt.close();
       }
        
        // Catch the exception
       catch (IOException | ClassNotFoundException | SQLException ex) 
       { 
            System.out.println(ex.getMessage()); 
       }
      
    }
    
}
