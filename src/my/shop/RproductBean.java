package my.shop;

public class RproductBean {
	private int pno;
	private String pname;
	private String pcategory;
	private String pcompany;
	private String pimage;
	private int pqty;
	private int price;
	private String pcontents;
	private int point;
	private String pref;
	private int totalPrice;
	private int salePrice;
	private int totalPoint;
	
	
	public RproductBean(int pno, String pname, String pcategory, String pcompany, String pimage, int pqty,
			int price, String pcontents, String pref, int point, int totalPrice, int salePrice,
			int totalPoint) {
		super();
		this.pno=pno;
		this.pname = pname;
		this.pcategory = pcategory;
		this.pcompany = pcompany;
		this.pimage = pimage;
		this.pqty = pqty;
		this.price = price;
		this.pcontents = pcontents;
		this.pref = pref;
		this.point = point;
		this.totalPrice = totalPrice;
		this.salePrice = salePrice;
		this.totalPoint = totalPoint;
		
	}
	
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPref() {
		return pref;
	}
	public void setPref(String pref) {
		this.pref = pref;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
}
