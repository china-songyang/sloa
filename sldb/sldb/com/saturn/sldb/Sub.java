package com.saturn.sldb;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Sub {
	private String id; // 主键
	private String name; // 姓名
	private String sex; // 性别
	private String identify; // 身份证号
	private String pid; // 户主ID
	private String healthCareType; // 医保类型
	private String contact; // 联系方式
	private String createTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人姓名
	private String createrDepartment; // 创建人部门
	private String state; // 付款状态
	private String inputType; // 输入类型
	private String personRelation; // 与户主关系
	private String pname; // 户主姓名
	private String tempNumber; // 暂住证号
	private String diseaseKind; // 病种
	private String diagnosisOrg; // 确诊机构

	private static ORMapping<Sub> mapping = new ResultORMapping<Sub>();
	private static Map<String, String> stateMap = new HashMap<String, String>();

	public Sub() {

	};

	public Sub(String id, String name, String sex, String identify, String pid,
			String healthCareType, String contact, String createTime,
			String creater, String createrName, String createrDepartment,
			String state, String inputType, String personRelation,
			String pname, String tempNumber, String diseaseKind,
			String diagnosisOrg) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.identify = identify;
		this.pid = pid;
		this.healthCareType = healthCareType;
		this.contact = contact;
		this.createTime = createTime;
		this.creater = creater;
		this.createrName = createrName;
		this.createrDepartment = createrDepartment;
		this.state = state;
		this.inputType = inputType;
		this.personRelation = personRelation;
		this.pname = pname;
		this.tempNumber = tempNumber;
		this.diseaseKind = diseaseKind;
		this.diagnosisOrg = diagnosisOrg;
	}

	public static int add(Sub vo, Connection connection) {
		if (connection != null) {
			return SimpleDaoTemplate.update(connection, "INSERT INTO sldb_sub("
					+ "name, sex, identify, " + "relation, marry, ill, "
					+ "disability, labor,inputType, pid)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", vo.name, vo.sex,
					vo.identify, vo.inputType, vo.pid);
		} else {
			return SimpleDaoTemplate.update("INSERT INTO sldb_sub("
					+ "name, sex, identify, " + "relation, marry, ill, "
					+ "disability, labor, inputType, pid)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", vo.name, vo.sex,
					vo.identify, vo.inputType, vo.pid);
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
		if (connection != null) {
			return SimpleDaoTemplate.update(connection,
					"DELETE FROM sldb_sub WHERE pid = ?", pid);
		} else {
			return SimpleDaoTemplate.update(
					"DELETE FROM sldb_sub WHERE pid = ?", pid);
		}

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

	public String getHealthCareType() {
		return healthCareType;
	}

	public void setHealthCareType(String healthCareType) {
		this.healthCareType = healthCareType;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public String getCreaterDepartment() {
		return createrDepartment;
	}

	public void setCreaterDepartment(String createrDepartment) {
		this.createrDepartment = createrDepartment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPersonRelation() {
		return personRelation;
	}

	public void setPersonRelation(String personRelation) {
		this.personRelation = personRelation;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getTempNumber() {
		return tempNumber;
	}

	public void setTempNumber(String tempNumber) {
		this.tempNumber = tempNumber;
	}

	public String getDiseaseKind() {
		return diseaseKind;
	}

	public void setDiseaseKind(String diseaseKind) {
		this.diseaseKind = diseaseKind;
	}

	public String getDiagnosisOrg() {
		return diagnosisOrg;
	}

	public void setDiagnosisOrg(String diagnosisOrg) {
		this.diagnosisOrg = diagnosisOrg;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
