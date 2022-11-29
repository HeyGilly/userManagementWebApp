package com.heygilly.usermanagementwebapp.model;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "User_ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "First Name",nullable = false, length = 45)
    private String first_name;
    @Column(name = "Last Name", nullable = false, length = 45)
    private String last_name;
    @Column(name = "Email", nullable = false, length = 50)
    private String email;
    @Column(name = "Username", nullable = false, length = 25, unique = true)
    private String username;
    @Column(name = "City", nullable = false, length = 50)
    private String city;
    @Column(name = "State", nullable = false, length = 24)
    private String state;

    //--- Constructors
    //With all
    public User(int id, String first_name, String last_name, String email, String username, String city, String state) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.username = username;
        this.city = city;
        this.state = state;
    }
    //Without ID
    public User(String first_name, String last_name, String email, String username, String city, String state) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.username = username;
        this.city = city;
        this.state = state;
    }
    // Empty
    public User() {
    }

    //--- Getters & Setters
    public int getId() {return id;}
    public void setId(int id) {this.id = id;}

    public String getFirst_name() {return first_name;}
    public void setFirst_name(String first_name) {this.first_name = first_name;}

    public String getLast_name() {return last_name;}
    public void setLast_name(String last_name) {this.last_name = last_name;}

    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}

    public String getUsername() {return username;}
    public void setUsername(String username) {this.username = username;}

    public String getCity() {return city;}
    public void setCity(String city) {this.city = city;}

    public String getState() {return state;}
    public void setState(String state) {this.state = state;}
}
