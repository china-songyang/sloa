package com.saturn.sldb;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ITransaction;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Temporary {
	private String id;
	private String identify;
	private String type;
	private String name;
	private String sex;
	private String permanent;
	private String home;
	private String contact;
	private String address;
	private String cause;
	private String audit;
	private String money;
	private String files;
	private String photo;

	private String createTime;
	private String creater;
	private String createrName;
	private String createrDepartment;
	private String state;
	private String inputType;
	private String numberNO;

	private String tempNumber; // 暂住证号
	private String diagnosisOrg; // 确诊机构
	private String diseaseKind; // 病种
	private String healthCareType; // 医保类型
	private String peopleType; // 对象类别
	private String sysId; // 系统ID

	private String beginTime;
	private String endTime;

	private static ORMapping<Temporary> mapping = new ResultORMapping<Temporary>();
	private static Map<String, String> stateMap = new HashMap<String, String>();

	static {
		stateMap.put("创建", "审核");
		stateMap.put("审核", "核对");
		stateMap.put("核对", "初审");
		stateMap.put("初审", "抽查");
		stateMap.put("抽查", "决议");
		stateMap.put("决议", "通过");
	}

	public static int add(Temporary vo) {
		return SimpleDaoTemplate
				.update("INSERT INTO sldb_tmp_person("
						+ "identify, type, name, "
						+ "sex, permanent, nodeType, "
						+ "home, contact, address, cause, "
						+ "audit, money, files, createTime, creater, "
						+ "createrName, state, createrDepartment, inputType, photo) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.identify, vo.type, vo.name, vo.sex, vo.permanent,
						vo.home, vo.contact, vo.address, vo.cause, vo.audit,
						vo.money, vo.files, vo.createTime, vo.creater,
						vo.createrName, vo.state, vo.createrDepartment,
						vo.inputType, vo.photo);
	}

	public static int add(final Temporary vo, final List<Sub> subs) {
		return SimpleDaoTemplate.update(new ITransaction() {
			@Override
			public int execute(Connection connection) {
				int maxid = SimpleDaoTemplate.queryCount(
						"SELECT max(id) FROM sldb_tmp_person",
						new DymaticCondition()) + 1;
				SimpleDaoTemplate
						.update(connection,
								"INSERT INTO sldb_tmp_person("
										+ "id, identity, type, name, sex, permanent, home, contact, address, cause, "
										+ "audit, money, files, createTime, creater, createrName, createrDepartment, state, "
										+ "inputType, photo, numberNO, tempNumber, diagnosisOrg, diseaseKind, healthCareType, "
										+ "peopleType)"
										+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
								"" + maxid, vo.identify, vo.type, vo.name,
								vo.sex, vo.permanent, vo.home, vo.contact,
								vo.address, vo.cause, vo.audit, vo.money,
								vo.files, vo.createTime, vo.creater,
								vo.createrName, vo.createrDepartment, vo.state,
								vo.inputType, vo.photo, vo.numberNO,
								vo.tempNumber, vo.diagnosisOrg, vo.diseaseKind,
								vo.healthCareType, vo.peopleType);
				for (Sub sub : subs) {
					sub.setPid("" + maxid);
					Sub.add(sub, connection);
				}
				return 1;
			}
		});
	}

	public static int addAuto(Temporary vo) {
		return SimpleDaoTemplate
				.update("INSERT INTO sldb_tmp_person("
						+ "identify, name, sex, address, creater, createrName, createrDepartment, state, createTime,"
						+ " home, cause, contact, permanent, type,inputType, nodeType, photo, numberNO) VALUES(?, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						vo.getIdentify(), vo.getName(), vo.getSex(),
						vo.getAddress(), vo.getCreater(), vo.getCreaterName(),
						vo.getCreaterDepartment(), vo.getState(),
						vo.getCreateTime(), vo.getHome(), vo.getCause(),
						vo.getContact(), vo.getPermanent(), vo.getType(),
						vo.getInputType(), vo.getPhoto(), vo.getNumberNO());
	}

	public static int edit(Temporary vo) {
		return SimpleDaoTemplate
				.update("UPDATE sldb_tmp_person SET "
						+ "identify = ?, type = ?, name = ?, "
						+ "sex = ?, permanent = ?, nodeType = ?, "
						+ "home = ?, contact = ?, address = ?, cause = ?, "
						+ "audit = ?, money = ?, files = ?, createTime = ?, creater = ?, "
						+ "createrName = ?, state = ?, createrDepartment = ?, inputType = ?, numberNO = ? "
						+ "WHERE id = ?", vo.identify, vo.type, vo.name,
						vo.sex, vo.permanent, vo.home, vo.contact, vo.address,
						vo.cause, vo.audit, vo.money, vo.files, vo.createTime,
						vo.creater, vo.createrName, vo.state,
						vo.createrDepartment, vo.inputType, vo.numberNO, vo.id);
	}

	public static int editFiles(String id, String files) {
		return SimpleDaoTemplate.update("UPDATE sldb_tmp_person SET "
				+ " files = ? " + "WHERE id = ?", files, id);
	}

	public static Temporary get(String id) {
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM sldb_tmp_person WHERE 1 = 1 and id = '" + id
						+ "'", null, mapping, Temporary.class);
	}

	public static List<Temporary> getAllPersonByIdcard(String identify) {
		return (List<Temporary>) SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_person WHERE 1 = 1 and identify = '"
						+ identify + "'", null, mapping, Temporary.class);
	}

	public static Temporary getIdWithTime(String createTime) {
		return SimpleDaoTemplate.queryOne(
				"SELECT id FROM sldb_temporary WHERE 1 = 1 and createTime = '"
						+ createTime + "'", null, mapping, Temporary.class);
	}

	public static ListData<Temporary> getAll(Temporary vo, String start,
			String offset, String orderBy, String order) {
		return SimpleDaoTemplate.query(
				"select t.* from  sldb_tmp_person t WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "identify",
						"name")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Temporary.class, start, offset);
	}

	public static ListData<Temporary> getAllWithOutCreater(Temporary vo,
			String start, String offset, String orderBy, String order) {
		return SimpleDaoTemplate
				.query("select distinct (s.pid), t.* from  sldb_tmp_person t ,"
						+ "sldb_person_state s where 1 = 1 and t.id = s.pid",
						new DymaticCondition().addSimpleCondition(vo, "state",
								"identify", "name", "sex", "createrName",
								"createTime"), mapping, Temporary.class, start,
						offset);
	}

	public static ListData<Temporary> getAllWithoutCreater(Temporary vo,
			String start, String offset, String orderBy, String order) {
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_person WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "state",
						"identify", "name", "gender", "createrName",
						"createTime", "creater", "numberNO").addCondition(
						"ORDER BY {0} {1}", orderBy, order), mapping,
				Temporary.class, start, offset);
	}

	public static int replay(String id, String state) {
		return SimpleDaoTemplate.update(
				"UPDATE sldb_temporary SET state = ? where id = ?", state, id);
	}

	@SuppressWarnings("unused")
	private static int state(Connection connection, String id, String state) {
		return SimpleDaoTemplate.update(connection,
				"UPDATE sldb_temporary SET state = ? WHERE id = ?", state, id);
	}

	public static int UpdateState(String id, String state) {
		return SimpleDaoTemplate.update(
				"UPDATE sldb_temporary SET state = ? WHERE id = ?", state, id);
	}

	public static int remove(final String id) {
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update(
				"DELETE FROM sldb_tmp_person WHERE id = ?", id);
	}

	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}

	/*
	 * public static ListData<Temporary> getAllOld(Temporary vo, String start,
	 * String offset, String orderBy, String order) { //
	 * 指定值对象类型(VOClass)。例子VOClass=User //
	 * 指定插入表名称(tableName)。例子：如user表，tableName=user // 指定O-R映射规则对象。默认mapping
	 * return SimpleDaoTemplate .query(
	 * "select distinct (s.pid), p.* from  sldb_temporary p ,sldb_temporary_state s where 1 = 1 and p.id = s.pid"
	 * , new DymaticCondition().addCondition( "and userId = '?' ",
	 * vo.getUserId()), mapping, Temporary.class, start, offset); }
	 */
	public static ListData<Temporary> getAllOldWithOutUserId(Temporary vo,
			String start, String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate
				.query("select distinct (s.pid), p.* from  sldb_temporary p ,sldb_temporary_state s where 1 = 1 and p.id = s.pid",
						new DymaticCondition(), mapping, Temporary.class,
						start, offset);
	}

	public static ListData<Temporary> getAllWithSelect(Temporary vo,
			String start, String offset, String orderBy, String order) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_person WHERE 1 = 1",
				new DymaticCondition()
						.addSimpleCondition(vo, "identify", "name", "sex",
								"type", "createrDepartment", "createTime",
								"state", "money", "nodeType", "creater")
						.addCondition(
								"and createTime BETWEEN \'{0}\' and \'{1}\'",
								vo.getBeginTime(), vo.getEndTime())
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Temporary.class, start, offset);
	}

	// 导出 excel jyb
	public static List<Temporary> getAllWithSelectExcel(Temporary vo) {
		// 指定值对象类型(VOClass)。例子VOClass=User
		// 指定插入表名称(tableName)。例子：如user表，tableName=user
		// 指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query(
				"SELECT * FROM sldb_tmp_person WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "identify",
						"name", "sex", "type", "createrDepartment",
						"createTime", "state", "money", "nodeType", "creater")
						.addCondition(
								"and createTime BETWEEN \'{0}\' and \'{1}\'",
								vo.getBeginTime(), vo.getEndTime()), mapping,
				Temporary.class);
	}

	public Temporary(String id, String identify, String type, String name,
			String sex, String permanent, String nodeType, String home,
			String contact, String address, String cause, String audit,
			String money, String files, String createTime, String creater,
			String createrName, String state, String createrDepartment,
			String inputType, String numberNO) {
		super();
		this.id = id;
		this.identify = identify;
		this.type = type;
		this.name = name;
		this.sex = sex;
		this.permanent = permanent;
		this.home = home;
		this.contact = contact;
		this.address = address;
		this.cause = cause;
		this.audit = audit;
		this.money = money;
		this.files = files;
		this.createTime = createTime;
		this.creater = creater;
		this.createrName = createrName;
		this.state = state;
		this.createrDepartment = createrDepartment;
		this.inputType = inputType;
		this.numberNO = numberNO;
	}

	public Temporary() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getPermanent() {
		return permanent;
	}

	public void setPermanent(String permanent) {
		this.permanent = permanent;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getAudit() {
		return audit;
	}

	public void setAudit(String audit) {
		this.audit = audit;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreaterDepartment() {
		return createrDepartment;
	}

	public void setCreaterDepartment(String createrDepartment) {
		this.createrDepartment = createrDepartment;
	}

	public String getInputType() {
		return inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public String getNumberNO() {
		return numberNO;
	}

	public void setNumberNO(String numberNO) {
		this.numberNO = numberNO;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getTempNumber() {
		return tempNumber;
	}

	public void setTempNumber(String tempNumber) {
		this.tempNumber = tempNumber;
	}

	public String getDiagnosisOrg() {
		return diagnosisOrg;
	}

	public void setDiagnosisOrg(String diagnosisOrg) {
		this.diagnosisOrg = diagnosisOrg;
	}

	public String getDiseaseKind() {
		return diseaseKind;
	}

	public void setDiseaseKind(String diseaseKind) {
		this.diseaseKind = diseaseKind;
	}

	public String getHealthCareType() {
		return healthCareType;
	}

	public void setHealthCareType(String healthCareType) {
		this.healthCareType = healthCareType;
	}

	public String getPeopleType() {
		return peopleType;
	}

	public void setPeopleType(String peopleType) {
		this.peopleType = peopleType;
	}

	public String getSysId() {
		return sysId;
	}

	public void setSysId(String sysId) {
		this.sysId = sysId;
	}

	public static ORMapping<Temporary> getMapping() {
		return mapping;
	}

	public static void setMapping(ORMapping<Temporary> mapping) {
		Temporary.mapping = mapping;
	}

	public static Map<String, String> getStateMap() {
		return stateMap;
	}

	public static void setStateMap(Map<String, String> stateMap) {
		Temporary.stateMap = stateMap;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}

}
