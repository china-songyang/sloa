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
import com.saturn.app.utils.DateUtils;

public class Society {
	private String id;
	private String name;
	private String sex;
	private String identify;
	private String photo;
	private String marry;
	private String ill;
	private String disability;

	private String family;
	private String labor;
	private String familyClass;
	private String total;
	private String income;

	
	private String spending;
	private String purpose;
	private String accountType;
	private String address;
	private String cause;
	private String money;

	private String type;
	private String state;
	private String createTime;
	private String creater;
	private String createrName;
	private String createrDepartment;
	private String files;
	private String note;
	
	private String cxState;
	private String cxTime;
	private String hbState;
	
	private String beginTime;
	private String endTime;
	
	private String numberNO;
	
	private static ORMapping<Society> mapping = new ResultORMapping<Society>();
	private static Map<String, String> stateMap = new HashMap<String, String>();
	
	public static int add(final Society vo, final List<Sub> subs) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(new ITransaction() {
			@Override
			public int execute(Connection connection) {
				// TODO Auto-generated method stub
				int maxid = SimpleDaoTemplate.queryCount(
						"SELECT max(id) FROM sldb_society_person",new DymaticCondition())+1;
				SimpleDaoTemplate
				.update(connection,"INSERT INTO sldb_society_person("
						+ "id, name, sex, identify, "
						+ "photo, marry, ill, "
						+ "disability, family, labor, familyClass, "
						+ "total, income, spending, purpose, accountType, "
						+ "address, cause, money, createTime, creater, createrName, createrDepartment, state, type)" +
						" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						""+maxid, vo.name, vo.sex, vo.identify, vo.photo, vo.marry,
						vo.ill, vo.disability, vo.family, vo.labor,
						vo.familyClass, vo.total, vo.income, vo.spending,
						vo.purpose, vo.accountType, vo.address, vo.cause,
						vo.money, vo.createTime, vo.creater, vo.createrName,
						vo.createrDepartment, vo.state, vo.type);
					for(Sub sub : subs){
						sub.setPid(""+maxid);
						Sub.add(sub, connection);
					}
					
				return 1;
			}
		});
	}

	public static int addAuto(final Society vo, final List<Sub> subs) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		// 根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(new ITransaction() {
			@Override
			public int execute(Connection connection) {
				// TODO Auto-generated method stub
				int maxid = SimpleDaoTemplate.queryCount(
						"SELECT max(id) FROM sldb_society_person",new DymaticCondition())+1;
				SimpleDaoTemplate
				.update(connection,"INSERT INTO sldb_society_person("
						+ "id, name, sex, identify, "
						+ "photo, marry, ill, "
						+ "disability, family, labor, familyClass, "
						+ "total, income, spending, purpose, accountType, "
						+ "address, cause, money, createTime, creater, " +
						"createrName, createrDepartment, state, type, numberNO)" +
						" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						""+maxid, vo.name, vo.sex, vo.identify, vo.photo, vo.marry,
						vo.ill, vo.disability, vo.family, vo.labor,
						vo.familyClass, vo.total, vo.income, vo.spending,
						vo.purpose, vo.accountType, vo.address, vo.cause,
						vo.money, vo.createTime, vo.creater, vo.createrName,
						vo.createrDepartment, vo.state, vo.type, vo.numberNO);
					for(Sub sub : subs){
						sub.setPid(""+maxid);
						Sub.add(sub, connection);
					}
					
				return 1;
			}
		});
	}
	
	public static int editToState(Society vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE sldb_society_person SET "
						+ "name = ?, sex = ?, identify = ?, photo = ?, marry = ?, ill = ?, disability = ?," +
						" family = ?, labor = ?, familyClass = ?, total = ?, income = ?, spending = ?, purpose = ?, " +
						"accountType = ?, address = ?, cause = ?, money = ?, createTime = ?, creater = ?, createrName = ?," +
						" createrDepartment = ?, state = ?, type = ? " + "WHERE id = ?",
						vo.name, vo.sex, vo.identify, vo.photo, vo.marry,
						vo.ill, vo.disability, vo.family, vo.labor,
						vo.familyClass, vo.total, vo.income, vo.spending,
						vo.purpose, vo.accountType, vo.address, vo.cause,
						vo.money, vo.createTime, vo.creater, vo.createrName,
						vo.createrDepartment, vo.state, vo.type, vo.id);
	}
	
	public static int edit(final Society vo, final List<Sub> subs) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(new ITransaction() {
			@Override
			public int execute(Connection connection) {
				// TODO Auto-generated method stub
				SimpleDaoTemplate
				.update("UPDATE sldb_society_person SET "
						+ "name = ?, sex = ?, identify = ?, photo = ?, marry = ?, ill = ?, disability = ?," +
						" family = ?, labor = ?, familyClass = ?, total = ?, income = ?, spending = ?, purpose = ?, " +
						"accountType = ?, address = ?, cause = ?, money = ?, createTime = ?, creater = ?, createrName = ?," +
						" createrDepartment = ?, state = ?, type = ?, numberNO = ? " + "WHERE id = ?",
						vo.name, vo.sex, vo.identify, vo.photo, vo.marry,
						vo.ill, vo.disability, vo.family, vo.labor,
						vo.familyClass, vo.total, vo.income, vo.spending,
						vo.purpose, vo.accountType, vo.address, vo.cause,
						vo.money, vo.createTime, vo.creater, vo.createrName,
						vo.createrDepartment, vo.state, vo.type, vo.numberNO, vo.id);
				Sub.removeByPid(vo.getId(), connection);
					for(Sub sub : subs){
						sub.setPid(vo.getId());
						Sub.add(sub, connection);
					}
					
				return 1;
			}
		});
	}
	public static int editByPerson(Society vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update("UPDATE sldb_society_person SET "
						+ "name = ?, sex = ?, identify = ?, photo = ?, marry = ?, ill = ?, disability = ?," +
						" family = ?, labor = ?, familyClass = ?, total = ?, income = ?, spending = ?, purpose = ?, " +
						"accountType = ?, address = ?, cause = ?, money = ?, createTime = ?, creater = ?, createrName = ?," +
						" createrDepartment = ?, state = ?, type = ?, numberNO = ? " + "WHERE id = ?",
						vo.name, vo.sex, vo.identify, vo.photo, vo.marry,
						vo.ill, vo.disability, vo.family, vo.labor,
						vo.familyClass, vo.total, vo.income, vo.spending,
						vo.purpose, vo.accountType, vo.address, vo.cause,
						vo.money, vo.createTime, vo.creater, vo.createrName,
						vo.createrDepartment, vo.state, vo.type, vo.numberNO, vo.id);
			}
	public static int editByApprove(Society vo) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update("UPDATE sldb_society_person SET "
				+ "money = ?, creater = ? " + "WHERE id = ?",
				vo.money, vo.creater,  vo.id);
	}
	public static int editFiles(String id, String files) {
		// 指定值对象类型(VOClass)。例子：User
		// 指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		// 指定修改列信息(modify)。例子：name=?, value=?
		// 根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate
				.update("UPDATE sldb_society_person SET "
						+ " files = ? "
						+ "WHERE id = ?",
						files, id);
	}

		public static Society get(String id) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定表主键(key)。例子:key=id
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.queryOne(
					"SELECT * FROM sldb_society_person WHERE 1 = 1 and id = '" + id + "'",
					null, mapping, Society.class);
		}
		
		public static List<Society> getAllPersonByIdcard(String id) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定表主键(key)。例子:key=id
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE 1 = 1 and identify = '" + id + "'",
					null, mapping, Society.class);
		}

		public static Society getIdWithTime(String createTime) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定表主键(key)。例子:key=id
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.queryOne(
					"SELECT id FROM sldb_society_person WHERE 1 = 1 and createTime = '"+ createTime +"'",
					null, mapping, Society.class);
		}
		
		public static ListData<Society> getAll(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE 1 = 1",
					new DymaticCondition().addSimpleCondition(vo,
							"identify", "name", "sex", "type", "createrDepartment",
							"createTime","state", "creater", "inputType", "numberNO")
							.addCondition("ORDER BY {0} {1}", orderBy,
							order), mapping, Society.class, start, offset);
		}
		
		//查询数据
		public static ListData<Society> getAllWithSelect(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE 1 = 1",
					new DymaticCondition().addSimpleCondition(vo,
							"identify","name", "sex", "type", "createrDepartment",
							"createTime","state", "money","familyClass", "accountType", "creater")
							.addCondition("and createTime BETWEEN \'{0}\' and \'{1}\'", vo.getBeginTime(), vo.getEndTime())
							.addCondition("ORDER BY {0} {1}", orderBy,
							order), mapping, Society.class, start, offset);
		}
		//抽取数据
		public static ListData<Society> getAllByRandom(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE cxState!=2 and hbState!=2",
					new DymaticCondition().addSimpleCondition(vo,
							"identify", "name", "sex", "type", "createrDepartment",
							"createTime","state", "creater", "inputType")
							.addCondition("ORDER BY {0} {1}", orderBy,
							order), mapping, Society.class, start, offset);
		}
		//抽取数据
		public static List<Society> getAllByRandom(Society vo, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE cxState!=2 and hbState!=2",
					new DymaticCondition().addSimpleCondition(vo,
							"identify", "name", "sex", "type", "createrDepartment",
							"createTime","state", "creater", "inputType")
							.addCondition("ORDER BY {0} {1}", orderBy,
							order), mapping, Society.class);
		}
		
		//最后状态1
		public static List<Society> getAllByRandomBy1(String cxTime, String cxState) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE state='待抽查'",
					new DymaticCondition().addCondition(" and cxTime='{0}' and cxState='{1}'", cxTime,
							cxState), mapping, Society.class);
		}
		
		public static void updateSociety(String time, String cxState) {
			List<Society> data = getAllByRandomBy1(time, "1");
			updateSociety(data, cxState);
		}
		
		//修改当前数据抽取状态
		public static String updateSociety(final List<Society> datas, final String cxState) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			final String time = DateUtils.getSystemTime();
			
			SimpleDaoTemplate.update(new ITransaction() {
				@Override
				public int execute(Connection connection) {
					// TODO Auto-generated method stub
					for (Society s : datas) {
						return SimpleDaoTemplate
								.update(connection, "UPDATE sldb_society_person SET "
										+ " cxState = ? "
										+ ", cxTime = ? "
										+ "WHERE id = ?",
										cxState, time, s.getId());
					}
					return 1;
				}
			});
			
			return time;
		}


		public static ListData<Society> getAllWithOutCreater(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_society_person WHERE 1 = 1",
					new DymaticCondition().addSimpleCondition(vo, "state",
							"identify", "name", "sex", "createrName",
							"createTime")
							.addCondition("ORDER BY {0} {1}", orderBy,
							order), mapping, Society.class, start, offset);
		}
		
		public static ListData<Society> getAllWithoutCreater(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate.query(
					"SELECT * FROM sldb_Society WHERE 1 = 1",
					new DymaticCondition().addSimpleCondition(vo, "state",
							"identify", "name", "gender", "createrName",
							"createTime")
							.addCondition("ORDER BY {0} {1}", orderBy,
							order), mapping, Society.class, start, offset);
		}
		/*
		public static int confirm(final String id, final String userId,
				final String note, final String department) {
			return SimpleDaoTemplate.update(new ITransaction() {
				public int execute(Connection connection) {
					
					User user = User.get(userId);
					Society Society = Society.get(id);

					String nextState = stateMap.get(Society.getState());
					
					SocietyState SocietyState = new SocietyState(null, id, userId,
							user.getName(), DateUtils.getSystemTime(), Society
									.getName(), Society.getIdentify(), nextState,
							note, department);

					state(connection, id, nextState);
					SocietyState.add(connection, SocietyState);

					return 1;
				}
			});
		}
		
		public static int confirm(final String[] ids, final String userId,
				final String note, final String department) {
			for (String id : ids) {
				confirm(id, userId, note, department);
			}

			return 1;
		}*/

	/*	public static int refuse(final String id, final String userId,
				final String note, final String department) {
			return SimpleDaoTemplate.update(new ITransaction() {
				public int execute(Connection connection) {

					User user = User.get(userId);
					Society Society = Society.get(id);

					String nextState = "驳回";

					SocietyState SocietyState = new SocietyState(null, id, userId,
							user.getName(), DateUtils.getSystemTime(), Society
									.getName(), Society.getIdentify(), nextState,
							note, department);

					state(connection, id, nextState);
					SocietyState.addRefuse(connection, SocietyState);

					return 1;
				}
			});
		}*/

		/*public static int refuse(final String[] ids, final String userId,
				final String note) {
			
			Organization organization = Organization.getOneOrganizationByUser(userId);
			String department = organization.getName();
			
			for (String id : ids) {
				refuse(id, userId, note, department);
			}

			return 1;
		}*/

		public static int replay(String id, String state) {
			return SimpleDaoTemplate.update(
					"UPDATE sldb_Society SET state = ? where id = ?", state,id);
		}
		
		private static int state(Connection connection, String id, String state) {
			return SimpleDaoTemplate.update(connection,
					"UPDATE sldb_Society SET state = ? WHERE id = ?", state, id);
		}

		public static  int UpdateState(String id, String state) {
			return SimpleDaoTemplate.update(
					"UPDATE sldb_society_person SET state = ? WHERE id = ?", state, id);
		}
		
		public static int remove(String id,Connection connection) {
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			if(connection!=null){
				Sub.removeByPid(id, connection);
				return SimpleDaoTemplate.update(connection,"DELETE FROM sldb_society_person WHERE id = ?",
						id);
			}else{
				return 0;
			}
		}

		public static void removes(final String[] ids) {
			if (ids != null) {
				SimpleDaoTemplate.update(new ITransaction() {
					@Override
					public int execute(Connection connection) {
						// TODO Auto-generated method stub
						for (String id : ids) {
							remove(id, connection);
						}
						return 1;
					}
				});
			}
		}

		public static ListData<Society> getSocietyStates(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate
					.query("select distinct (s.pid), p.* from  sldb_society_person p ,sldb_person_state s where 1 = 1 and p.id = s.pid and p.state != '创建' and s.type='社会化救助'",
							new DymaticCondition().addCondition("and s.userId = '?' ", vo.getCreater()), mapping,
							Society.class, start, offset);
		}

		public static ListData<Society> getAllOldWithOutUserId(Society vo, String start,
				String offset, String orderBy, String order) {
			// 指定值对象类型(VOClass)。例子VOClass=User
			// 指定插入表名称(tableName)。例子：如user表，tableName=user
			// 指定O-R映射规则对象。默认mapping
			return SimpleDaoTemplate
					.query("select distinct (s.pid), p.* from  sldb_society_person p ,sldb_society_person_state s where 1 = 1 and p.id = s.pid",
							new DymaticCondition(), mapping,
							Society.class, start, offset);
		}
		
		//导出  excel  jyb
				public static List<Society> getAllWithSelectExcel(Society vo) {
					// 指定值对象类型(VOClass)。例子VOClass=User
					// 指定插入表名称(tableName)。例子：如user表，tableName=user
					// 指定O-R映射规则对象。默认mapping
					return SimpleDaoTemplate.query(
							"SELECT * FROM sldb_society_person WHERE 1 = 1",
							new DymaticCondition().addSimpleCondition(vo,
									"identify","name", "sex", "type", "createrDepartment",
									"createTime","state","money", "nodeType","creater")
									.addCondition("and createTime BETWEEN \'{0}\' and \'{1}\'", vo.getBeginTime(), vo.getEndTime()),
									mapping, Society.class);
				}
				
	public Society(String id, String name,String sex,String identify,String photo,String marry,String ill,
			String disability,String family,String labor,String familyClass,String total,String income,
			String spending,String purpose,String accountType,String address,String cause,String money,
			String createTime,String creater,String createrName,String createrDepartment,String state,
			String type,String files,  String note) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.identify = identify;
		this.photo= photo;
		this.marry= marry;
		this.ill= ill;
		this.disability= disability;
		this.family= family;
		this.labor= labor;
		this.familyClass= familyClass;
		this.total= total;
		this.income= income;
		this.spending= spending;
		this.purpose= purpose;
		this.accountType= accountType;
		this.address= address;
		this.cause= cause;
		this.money= money;
		this.createTime= createTime;
		this.creater= creater;
		this.createrName= createrName;
		this.createrDepartment= createrDepartment;
		this.state= state;
		this.type= type;
		this.files= files;
		this.note = note;
	}
	
	public Society() {
		super();
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	public String getLabor() {
		return labor;
	}
	public void setLabor(String labor) {
		this.labor = labor;
	}
	public String getFamilyClass() {
		return familyClass;
	}
	public void setFamilyClass(String familyClass) {
		this.familyClass = familyClass;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getSpending() {
		return spending;
	}
	public void setSpending(String spending) {
		this.spending = spending;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
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
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	
	
	
	public String getCxState() {
		return cxState;
	}

	public void setCxState(String cxState) {
		this.cxState = cxState;
	}

	public String getCxTime() {
		return cxTime;
	}

	public void setCxTime(String cxTime) {
		this.cxTime = cxTime;
	}

	public String getHbState() {
		return hbState;
	}

	public void setHbState(String hbState) {
		this.hbState = hbState;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	public String getBeginTime() {
		return beginTime;
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

	
	public String getNumberNO() {
		return numberNO;
	}

	public void setNumberNO(String numberNO) {
		this.numberNO = numberNO;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
