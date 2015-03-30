package com.saturn.sldb;

import java.sql.Connection;
import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Sub {
	private String id;
	private String name;
	private String sex;
	private String identify;
	private String relation;
	private String marry;
	private String ill;
	private String disability;
	private String labor;
	private String pid;
	
	private String inputType;
	
	private static ORMapping<Sub> mapping = new ResultORMapping<Sub>();
	
	public static int add(Sub vo, Connection connection) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		if(connection!=null){
			return SimpleDaoTemplate
					.update(connection, "INSERT INTO sldb_sub("
							+ "name, sex, identify, "
							+ "relation, marry, ill, "
							+ "disability, labor,inputType, pid)" +
							" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
							vo.name, vo.sex, vo.identify, vo.relation, vo.marry,
							vo.ill, vo.disability, vo.labor, vo.inputType,
							vo.pid);
		}else{
			return SimpleDaoTemplate
					.update("INSERT INTO sldb_sub("
							+ "name, sex, identify, "
							+ "relation, marry, ill, "
							+ "disability, labor, inputType, pid)" +
							" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
							vo.name, vo.sex, vo.identify, vo.relation, vo.marry,
							vo.ill, vo.disability, vo.labor,vo.inputType,
							vo.pid);
		}
		
	}
	
	public static List<Sub> getByPid(String pid) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_sub WHERE 1 = 1 and pid = '" + pid + "'",
				null, mapping, Sub.class);
	}
	
	public static Sub getPid(String id) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定表主键(key)。例子:key=id
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_sub WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Sub.class);
	}
	
	public static int removeByPid(String pid, Connection connection) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		if(connection!=null){
			return SimpleDaoTemplate.update(connection,"DELETE FROM sldb_sub WHERE pid = ?",
					pid);
		}else{
			return SimpleDaoTemplate.update("DELETE FROM sldb_sub WHERE pid = ?",
					pid);
		}
		
	}
	
	public Sub() {
		super();
	}
	
	public Sub(String id, String name,String sex,String identify,String relation,String marry,String ill,
			String disability,String labor, String inputType, String pid) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.identify = identify;
		this.relation= relation;
		this.marry= marry;
		this.ill= ill;
		this.disability= disability;
		this.labor= labor;
		this.pid = pid;
		this.inputType = inputType;

	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdentify() {
		return identify;
	}
	public void setIdentify(String identify) {
		this.identify = identify;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	public String getIll() {
		return ill;
	}
	public void setIll(String ill) {
		this.ill = ill;
	}
	public String getDisability() {
		return disability;
	}
	public void setDisability(String disability) {
		this.disability = disability;
	}
	public String getLabor() {
		return labor;
	}
	public void setLabor(String labor) {
		this.labor = labor;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	public String getInputType() {
		return inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
