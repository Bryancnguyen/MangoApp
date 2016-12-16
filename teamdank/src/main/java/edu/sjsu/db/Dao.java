package edu.sjsu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dao {
	public static Connection getConn()
	{
		String driverStr = "com.mysql.jdbc.Driver";
		String urlStr = "jdbc:mysql://localhost:3306/mydb";
		String uid = "root";
		String pwd = "teamdank160";
		try {
		Class.forName(driverStr);
		return DriverManager.getConnection(urlStr, uid, pwd);
		}
		catch (SQLException | ClassNotFoundException ex) { System.err.println("The connection failed because " + ex.getMessage()); ex.printStackTrace();
		return null;
		}
	} // method

    public static String getSlice() throws SQLException
        {
            String output = "";
	    Connection conn = getConn();
	    if (conn == null) return output + "\"connection failed\"}";
	    String sqlStr = "SELECT ideas FROM Slices ORDER BY RAND() LIMIT 1;";
	    ResultSet rs = null;
	    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			//pstmt.setString();
	    rs = pstmt.executeQuery();
	    if (rs == null)
	        output += "\"NO SLICES FOUND\"";
	    else {
	        rs.next();
	        output += "\"" + rs.getString(1) + "\"";
	    }
	    return output;
        } // method


	public static String addUsers(String name) throws SQLException
        {
            String output = "{\"Users\" : ";
	    Connection conn = getConn();
	    if (conn == null) return output + "\"connection failed\"}";
	    String sqlStr = "INSERT INTO Users VALUES (16,"+name+", NULL," +name+"@gmail.com', NULL, NULL);";
	    ResultSet rs = null;
	    PreparedStatement pstmt = conn.prepareStatement(sqlStr); pstmt.setString(2, name);
	    rs = pstmt.executeQuery();
	    if (rs == null)
	        output += "\"NO USERS FOUND\"";
	    else {
	        rs.next();
	        output += "\"" + rs.getString(2) + "\"";
	    }
	    return output + "}";
        } // method


	public static String addSlice(int id, String location, int tourist, int primary_criteria, int secondary_criteria) throws SQLException
        {
            String output = "{\"SliceAdd\" : ";
	    Connection conn = getConn();
	    if (conn == null) return output + "\"connection failed\"}";
	    String sqlStr = "INSERT INTO Matching_criteria VALUES ("+id+","+location+", "+tourist+"," +primary_criteria+","+secondary_criteria+");";
	    ResultSet rs = null;
	    PreparedStatement pstmt = conn.prepareStatement(sqlStr); //pstmt.setString(1, name);
	    rs = pstmt.executeQuery();
	    if (rs == null)
	        output += "\"NO SLICE ADDED\"";
	    else {
	        rs.next();
	        output += "\"" + rs.getString(2) + "\"";
	    }
	    return output + "}";
        } // method

	public static String addCriteria(int id, int alchohol, int number_of_people, int indoors, int sliceID) throws SQLException
        {
            String output = "{\"addCriteria\" : ";
	    Connection conn = getConn();
	    if (conn == null) return output + "\"connection failed\"}";
	    String sqlStr = "INSERT INTO Matching_criteria VALUES ("+id+","+alchohol+", "+number_of_people+"," +indoors+","+sliceID+");";
	    ResultSet rs = null;
	    PreparedStatement pstmt = conn.prepareStatement(sqlStr); //pstmt.setString(1, name);
	    rs = pstmt.executeQuery();
	    if (rs == null)
	        output += "\"Criteria not added\"";
	    else {
	        rs.next();
	        output += "\"" + rs.getString(2) + "\"";
	    }
	    return output + "}";
        } // method


	public static String addReview(int id, int Rating, String Summary , int idSlices, int idUsers) throws SQLException
        {
            String output = "{\"addReview\" : ";
	    Connection conn = getConn();
	    if (conn == null) return output + "\"connection failed\"}";
	    String sqlStr = "INSERT INTO Reviews VALUES ("+id+","+Rating+", "+idSlices+"," +idUsers+");";
	    ResultSet rs = null;
	    PreparedStatement pstmt = conn.prepareStatement(sqlStr); pstmt.setString(3, Summary);
	    rs = pstmt.executeQuery();
	    if (rs == null)
	        output += "\"Review not added\"";
	    else {
	        rs.next();
	        output += "\"" + rs.getString(2) + "\"";
	    }
	    return output + "}";
        } // method


	public static String getSummary() throws SQLException { String output = "{\"phone\" : ";
	Connection conn = getConn();
	if (conn == null) return output + "\"connection failed\"}";
	String sqlStr = "select summary from reviews where review.idslices = slices.idslices";
	ResultSet rs = null;
	PreparedStatement pstmt = conn.prepareStatement(sqlStr); pstmt.setString(1, name);
	rs = pstmt.executeQuery();
	if (rs == null)
	    output += "\"test not found!\"";
	else {
	rs.next();
	output += "\"" + rs.getString(2) + "\"";
	}
	return output + "}"; } // method

}
