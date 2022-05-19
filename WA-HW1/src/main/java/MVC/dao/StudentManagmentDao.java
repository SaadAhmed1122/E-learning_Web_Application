package MVC.dao;



import MVC.Bean.StudentBean;
import MVC.Controller.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentManagmentDao {
//    public static List list() {
//        ArrayList list=new ArrayList();
//
//        try {
//            Connection con = DatabaseConnection.initializeDatabase();
//            PreparedStatement pstmt=con.prepareStatement("Select * from students");
//            ResultSet rs= pstmt.executeQuery();
//            while (rs.next()) {
//                StudentsBean std=new StudentsBean();
//                std.setName(rs.getString("name"));
//                std.setEmail_id(rs.getString("email_id"));
//                std.setEmail_id(rs.getString("approval"));
//
//                list.add(std);
//                con.close();
//            }
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }finally {
//
//        }
//        return list;
//    }

    //    public boolean insertStudent(StudentsBean book) throws SQLException {
//        String sql = "INSERT INTO student (ssf, fd, fd) VALUES (?, ?, ?)";
//        connect();
//
//        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//        statement.setString(1, std.getTitle());
//        statement.setString(2, std.getAuthor());
//        statement.setFloat(3, std.getPrice());
//
//        boolean rowInserted = statement.executeUpdate() > 0;
//        statement.close();
//        disconnect();
//        return rowInserted;
//    }
    private String jdbcURL = "jdbc:postgresql://localhost:5432/web_tore";
    private String jdbcUsername = "postgres";
    private String jdbcPassword = "root";



    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public List<StudentBean> listAllstudents(){
        List<StudentBean> liststd = new ArrayList<>();

        String sql = "SELECT * FROM students";

        try {
            //Connection con = DatabaseConnection.initializeDatabase();
            Connection con =getConnection();

            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String name = resultSet.getString("name");
                Boolean approval = resultSet.getBoolean("approval");

                // StudentBean std = new StudentBean(name, email, approval, id);
                //liststd.add(std);
            }

            resultSet.close();
            statement.close();

            con.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return liststd;
    }

    public boolean deleteStudent(StudentBean std) throws SQLException {
        String sql = "DELETE FROM students where id = ?";
        boolean rowDeleted = false;

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement statement = con.prepareStatement(sql);
            //statement.setInt(1, std.getId());
            rowDeleted = statement.executeUpdate() > 0;
            statement.close();
            con.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }


    public boolean updatestudent(StudentBean std) throws SQLException {
        String sql = "UPDATE students SET name = ?, email = ?, approval = ?";
        sql += " WHERE id = ?";
        boolean rowUpdated = false;

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement statement = con.prepareStatement(sql);
            // statement.setString(1, std.getName());
            //statement.setString(2, std.getEmail_id());
            //statement.setBoolean(3, std.getApproval());
            // statement.setInt(4, std.getId());
            rowUpdated = statement.executeUpdate() > 0;
            statement.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }

    public StudentBean getstd(int id) throws SQLException {
        StudentBean std = null;
        String sql = "SELECT * FROM students WHERE id = ?";
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email_id");
                Boolean approval = resultSet.getBoolean("approval");

                //   std = new StudentBean(name, email, approval, id);
            }

            resultSet.close();
            statement.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return std;
    }

}
