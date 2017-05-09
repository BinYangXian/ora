package com.cdsxt.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.cdsxt.utils.DBUtils;

import oracle.jdbc.internal.OracleTypes;

public class Main {
	
	
	public static void testFindAll(){
		
		Connection connection = DBUtils.getConnection();
		String sql = "select * from emp";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			ps = connection.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				System.out.println(rs.getString("ename")+"\t"+rs.getInt("deptno"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(rs,ps,connection);
		}
	}
	
	/**
	 * 测试没有参数的存储过程
	 * 
	 * create or replace procedure p_test
		is
		begin
			 update emp e set e.ename='WARD' where e.empno=7521;
  			 commit;
		     dbms_output.put_line('test'); 
		end;
	 */
	public static void testProcedureWithNoneParam(){
		Connection connection = DBUtils.getConnection();
		CallableStatement cs = null;
		try {
			cs = connection.prepareCall("{call p_test()}");//{call 存储名}  这是规范
			
			// 执行
			cs.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(cs,connection);
		}
		
	}
	
	/**
	 * create or replace procedure p_sal(l_deptno in number,l_avg out number,l_success in out number)
			is
			  v_avg number;
			begin
			
			  l_success :=1;
			  select avg(e.sal) into v_avg from emp e where e.deptno=l_deptno;
			  if v_avg is null then
			    l_avg :=0;
			    raise no_data_found;
			  end if;
			
			  l_avg :=v_avg;
			
			  exception
			    when others then
			      l_success :=0;
			
			
			end;
	 * 
	 * 
	 * 
	 */
	public static void testProcedureWithParam(){
		Connection connection = DBUtils.getConnection();
		CallableStatement cs = null;
		try {
			cs = connection.prepareCall("{call p_sal(?,?,?)}");
			cs.setInt(1, 200);
			cs.setInt(3, 1);
			//注册out参数
			cs.registerOutParameter(2, Types.DOUBLE);
			cs.registerOutParameter(3, Types.INTEGER);
			
			
			cs.execute();
			
			//得到  注册的out参数
			//位置是多少 就用多少去得
			
			int success = cs.getInt(3);
			if(success == 1){
				System.out.println("平均工资:"+cs.getDouble(2));
			}else{
				System.out.println("反正就是错啦!");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(cs,connection);
		}
		
	}
	
	/**
	 * 
	 * 
	 * create or replace procedure p_test_cursor(l_deptno in number,v_cursor out sys_refcursor)
		is
		
		begin
		  open v_cursor for select * from emp e where e.deptno=l_deptno;
		end;
	 */
	public static void testProcedureReturnCursor(){
		Connection connection = DBUtils.getConnection();
		CallableStatement cs = null;
		try {
			cs = connection.prepareCall("{call p_test_cursor(?,?)}");
			cs.setInt(1, 30);
			//注册out参数       注意：注册cursor时须用OracleTypes.CURSOR
			cs.registerOutParameter(2, OracleTypes.CURSOR);
			
			
			cs.execute();
			
			//得到  注册的out参数
			//位置是多少 就用多少去得
			
			ResultSet rs = (ResultSet)cs.getObject(2);
			while(rs.next()){
				System.out.println(rs.getString("ename")+"\t"+rs.getInt("deptno"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(cs,connection);
		}
		
	}
	
	
	
	
	public static void main(String[] args) {
		testFindAll();
//		testProcedureWithNoneParam();
//		testProcedureWithParam();
		
//		testProcedureReturnCursor();
	}
	

}
