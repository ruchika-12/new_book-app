package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**/
import dto.Book;

public class BookD {

	public BookD() {
		// TODO Auto-generated constructor stub
	}
	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	public static int save(Book u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into bookdata values(?,?,?,?)");
			ps.setInt(1,u.getId());
			ps.setString(2,u.getTitle());
			ps.setString(3,u.getAuthor());
			ps.setFloat(4,u.getPrice());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	public static int update(Book u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("update bookdata set title=?, author=?, price=? where id=?");
			
			ps.setString(1,u.getTitle());
			ps.setString(2,u.getAuthor());
			ps.setFloat(3,u.getPrice());
			ps.setInt(4,u.getId());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	public static int delete(Book u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from bookdata where id=?");
			ps.setInt(1,u.getId());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
	public static List<Book> getAllRecords(){
		List<Book> list=new ArrayList<Book>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from bookdata");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Book u=new Book();
				u.setId(rs.getInt("id"));
				u.setTitle(rs.getString("title"));
				u.setAuthor(rs.getString("author"));
				u.setPrice(rs.getFloat("price"));
				
				list.add(u);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	public static Book getRecordById(int id){
		Book u=null;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from bookdata where id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				u=new Book();
				u.setId(rs.getInt("id"));
				u.setTitle(rs.getString("title"));
				u.setAuthor(rs.getString("author"));
				u.setPrice(rs.getFloat("price"));
				
			}
		}catch(Exception e){System.out.println(e);}
		return u;
	}

}
