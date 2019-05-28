package com.skhu.NWFA.user.userModel;

public class userModel {

   private int user_id;
   private String login_id;
   private String password;
   private String name;
   private int age;
   private String sex;
   private String email;
   
   public int getUser_id() {
      return user_id;
   }
   public void setUser_id(int user_id) {
      this.user_id = user_id;
   }
   public String getLogin_id() {
      return login_id;
   }
   public void setLogin_id(String login_id) {
      this.login_id = login_id;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }
   public String getSex() {
      return sex;
   }
   public void setSex(String sex) {
      this.sex = sex;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   @Override
   public String toString() {
      return "userModel [user_id=" + user_id + ", login_id=" + login_id + ", password=" + password + ", name=" + name
            + ", age=" + age + ", sex=" + sex + ", email=" + email + "]";
   }



}