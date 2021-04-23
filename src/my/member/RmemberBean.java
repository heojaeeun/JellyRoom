package my.member;

public class RmemberBean {
	private int no;
	private String name;
	private String id;
	private String password;
	private String gender;
	private String age;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email;
	private String country;
	private String pref;
	
	public RmemberBean() {
		
	}
	
	public RmemberBean(int no, String name, String id, String password, String gender,
			String age, String hp1, String hp2, String hp3, String email, String country,
			String pref) {
		super();
		this.no=no;
		this.name=name;
		this.id=id;
		this.password=password;
		this.gender= gender;
		this.age=age;
		this.hp1=hp1;
		this.hp2=hp2;
		this.hp3=hp3;
		this.email=email;
		this.country=country;
		this.pref=pref;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPref() {
		return pref;
	}
	public void setPref(String pref) {
		this.pref = pref;
	}
	
	
}
