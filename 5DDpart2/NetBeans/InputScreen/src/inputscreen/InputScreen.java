/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inputscreen;

/**
 *
 * @author 001084786
 */
import java.sql.*; 
import java.util.*; 
import java.io.*; 

public class InputScreen {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        try 
	{ 
            System.out.println("Southern Airport DB"); 
            // Get Oracle username and password from user 
            BufferedReader input = 
            new BufferedReader(new InputStreamReader(System.in)); 
            System.out.print("Enter Oracle username: "); 
            String username = input.readLine(); 
            System.out.print("Enter Oracle password: "); 
            String password = input.readLine(); 

            // Connect to database 
            String myConnectionString = new String 
            ("jdbc:oracle:thin:@35.166.130.72:1521:xe"); 
            Class.forName("oracle.jdbc.driver.OracleDriver"); 
            Connection con = 
            DriverManager.getConnection(myConnectionString,username,password); 
            System.out.println("Login Successful"); 

            // The Method
            System.out.println("Airline Codes: ('1', '2' or '3')");
            System.out.print("Input Airline Code: "); 
            String airlineCode = input.readLine(); 
            Statement stmt = con.createStatement(); 
            //ResultSet r = stmt.executeQuery("SELECT AL.Count_planes() FROM Airline_table AL WHERE AL.AirlineCode = '" + airlineCode + "'"); 
            ResultSet r = stmt.executeQuery("SELECT AL.Count_planes() FROM Airline_table AL WHERE AL.AirlineCode = '" + airlineCode + "'"); 

            // Display the data a row at a time 
            while (r.next()) 
            { 
                    //System.out.println("Aircrafts owned  by" + airlineCode + " = " + (r.getString("AL.Count_planes()"))); 
                    System.out.println("Number of aircraft owned: " + r.getString("AL.Count_planes()"));
            } 
            System.out.println("End SQL"); 
            stmt.close(); 
	} 

	// On IO exception, display system error message 
	catch (IOException e) 
	{ 
		System.out.println(e.getMessage()); 
	} 

	// On SQL exception, display SQL error message 
	catch (SQLException e) 
	{ 
		System.out.println(e.getMessage()); 
	} 

	// On ClassNotFound exception, display error message 
	catch (ClassNotFoundException e) 
	{ 
		System.out.println(e.getMessage()); 
	}

    }
    
}
