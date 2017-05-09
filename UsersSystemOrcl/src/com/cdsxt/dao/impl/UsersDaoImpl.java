package com.cdsxt.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cdsxt.dao.UsersDao;
import com.cdsxt.po.Users;
import com.cdsxt.utils.DBUtils;

public class UsersDaoImpl implements UsersDao {

	
	/**
	 * create table test_users(
	       id number(10) primary key,
	       username varchar2(50),
	       password varchar2(50),
	       age number(3),
	       email varchar2(50),
	       constraint age_ck1 check(age>=0 and age<=120)
	);
	 * 
	 */
	@Override
	public List<Users> findAll() {
		List<Users> result = new ArrayList<>();
		
		Connection connection = DBUtils.getConnection();
		if(connection!=null){
			
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = connection.prepareStatement("select * from test_users");
				rs = ps.executeQuery();
				while(rs.next()){
					Users users = new Users();
					users.setId(rs.getInt("id"));
					users.setAge(rs.getInt("age"));
					users.setEmail(rs.getString("email"));
					users.setUsername(rs.getString("username"));
					users.setPassword(rs.getString("password"));
					result.add(users);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBUtils.close(rs,ps,connection);
			}
		}
		return result;
	}

	@Override
	public Users findOne(int id) {
		Users users = null;
		Connection connection = DBUtils.getConnection();
		if(connection!=null){
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = connection.prepareStatement("select * from test_users where id=?");
				ps.setInt(1, id);
				rs = ps.executeQuery();
				while(rs.next()){
					users = new Users();
					users.setId(rs.getInt("id"));
					users.setAge(rs.getInt("age"));
					users.setEmail(rs.getString("email"));
					users.setUsername(rs.getString("username"));
					users.setPassword(rs.getString("password"));
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBUtils.close(rs,ps,connection);
			}
		}
		return users;
	}
	
	@Override
	public void update(Users users) {
		Connection connection = DBUtils.getConnection();
		if(connection!=null){
			PreparedStatement ps = null;
			try {
				ps = connection.prepareStatement("update test_users set username=?,email=?,password=?,age=? where id=?");
				ps.setString(1, users.getUsername());
				ps.setString(2, users.getEmail());
				ps.setString(3, users.getPassword());
				ps.setInt(4, users.getAge());
				ps.setInt(5, users.getId());
				ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBUtils.close(ps,connection);
			}
		}
	}
	
	@Override
	public void save(Users user) {
		Connection connection = DBUtils.getConnection();
		if(connection!=null){
			PreparedStatement ps = null;
			try {
				ps = connection.prepareStatement("insert into test_users(id,username,email,password,age) values (seq_test_users.nextval,?,?,?,?)");
				ps.setString(1, user.getUsername());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getPassword());
				ps.setInt(4, user.getAge());
				ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBUtils.close(ps,connection);
			}
		}
	}

}
