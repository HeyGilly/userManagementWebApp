package com.heygilly.usermanagementwebapp.dao;

import com.heygilly.usermanagementwebapp.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public UserDAO() {}

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Config config = new Config();
        Connection connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
        );
        return connection;
    }


    //-- Create a static SQL statement to insert users
    private static final String INSERT_USERS_SQL ="INSERT INTO users"+" (first_name,last_name, email, username, city, state) VALUES (?,?,?,?,?,?);";
    //-- SQL statement to Select user by ID
    private static final String SELECT_USER_BY_ID = "select id,first_name,last_name, email, username, city, state from users where id=?;";
    //-- SQL statement to Select all users
    private static final String SELECT_ALL_USERS = "select * from users;";
    //--SQL statement to Delete user by ID
    private static final String DELETE_USERS_SQL = "delete from users where id=?;";
    // SQL statement to update users by ID
    private static final String UPDATE_USERS_SQL = "update users set first_name=?, last_name=?, email=?, username=?, city=?, state=? where id=?;";

    //--  Create or Insert user
    public void insertUser(User user) throws SQLException{
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_USERS_SQL)){
            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getUsername());
            statement.setString(5, user.getCity());
            statement.setString(6, user.getState());
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    //-- Update user
    public boolean updateUser(User user) throws SQLException{
        boolean rowUpdated;
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);){
            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getUsername());
            statement.setString(5, user.getCity());
            statement.setString(6, user.getState());
            statement.setInt(7, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    //-- select user by id
    public User selectUser(int id) throws SQLException {
        User user = null;
        // Step 1: Establishing a Connection & a statement using connection object
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_USER_BY_ID);){
            statement.setInt(1, id);
            System.out.println(statement);
            // Step 2: Execute the query or update query
            ResultSet rs = statement.executeQuery();
            // Step 3: Process the Result Set Object
            while(rs.next()){
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String city = rs.getString("city");
                String state = rs.getString("state");
                user = new User(id, first_name, last_name, email, username, city, state);
            }
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return user;
    }

    //-- select users
    public List<User> selectAllUsers(){
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection & a statement using connection object
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USERS)){
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String city = rs.getString("city");
                String state = rs.getString("state");
                users.add(new User(id, first_name, last_name, email, username, city, state));

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return users;
    }

    //-- delete user
    public boolean deleteUser(int id) throws SQLException, ClassNotFoundException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }



    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }



}

