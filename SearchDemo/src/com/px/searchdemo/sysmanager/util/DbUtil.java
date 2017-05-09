package com.px.searchdemo.sysmanager.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 
 * @ClassName: DbUtil
 * @Description: 数据库工具类
 * @author: Bardon
 * @date: 2017年4月30日 下午9:56:52
 * @version1.0
 */
public class DbUtil {

	/**
	 * 获取驱动方法
	 * @Title: getConnection
	 * @Author: Bardon
	 * @Time: 2017年4月30日 下午10:02:16
	 * @params: @return
	 * @return: Connection
	 * @throws
	 */
	public static Connection getConnection(){
		Connection connection=null;
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/bigdata";
		String user="sa";
		String password="4545**";
		try {
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	/**
	 * 数据库查询方法
	 * @Title: queryForList
	 * @Author: Bardon
	 * @Time: 2017年5月9日 上午11:02:04
	 * @params: @param sql
	 * @params: @param args
	 * @params: @return
	 * @return: List<Map<String,Object>>
	 * @throws
	 */
	public static List<Map<String,Object>> queryForList(String sql,String...args){
		//多态
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		PreparedStatement ps=null;
		ResultSet resultSet=null;
		if(sql==null||sql.equals("")){
			return null;
		}		
		Connection connection=getConnection();
		try {
			ps=connection.prepareStatement(sql);
			if(args!=null){
				for(int i=0;i<args.length;i++){
					ps.setObject(i+1, args[i]);
				}
				resultSet=ps.executeQuery();
				ResultSetMetaData metaData=resultSet.getMetaData();
				int columnCount = metaData.getColumnCount();
				while(resultSet.next()){
					Map<String, Object> map=new HashMap<String, Object>();
					for(int i=0;i<columnCount;i++){
						Object val=resultSet.getObject(i+1);
						String name=metaData.getColumnLabel(i+1);
						map.put(name, val);
					}
					list.add(map);
				}
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				if(resultSet!=null){
					resultSet.close();
				}
				if(ps!=null){
					ps.close();
				}
				if(connection!=null){
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public static void main(String[] args) {
		String sql="select * from library where spell like '%ni%'";
		List<Map<String,Object>> queryForList=queryForList(sql);
		for(Map<String, Object> map :queryForList){
			System.out.println(map.get("text"));
		}
	}
}
