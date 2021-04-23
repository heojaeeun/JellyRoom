package my.shop.mall;

import java.sql.SQLException;
import java.util.ArrayList;

import my.shop.RproductBean;
import my.shop.RproductDao;

public class RcartBean {
	
	private ArrayList<RproductBean> rclist;
	
	public RcartBean() {
		System.out.println("RcartBean 생성자");
		rclist = new ArrayList<RproductBean>();
	}//
	
	public void addRproduct(String pno, String oqty) throws SQLException {
		RproductDao rpdao = RproductDao.getInstance();
		RproductBean rpbean = rpdao.selectByPno(pno);
		
		int pno_new = Integer.parseInt(pno);
		int oqty_new = Integer.parseInt(oqty);
		
		for(int i=0; i<rclist.size(); i++) {
			
			int rcPno = rclist.get(i).getPno();
			System.out.println("rcPno:"+rcPno);
			if(rcPno == pno_new) {
				System.out.println("번호 같음");
				int rcPqty = rclist.get(i).getPqty();
				rclist.get(i).setPqty(rcPqty + oqty_new);
				rclist.get(i).setTotalPoint(rclist.get(i).getPoint()*(rcPqty + oqty_new));
				rclist.get(i).setTotalPrice(rclist.get(i).getPrice()*(rcPqty + oqty_new));
				return;
			}
			else {
				System.out.println("번호 안같음");
			}
		}
		
		rpbean.setPqty(oqty_new);
		int totalPrice = rpbean.getPrice() * oqty_new;
		int totalPoint = rpbean.getPoint() * oqty_new;
		rpbean.setTotalPrice(totalPrice);
		rpbean.setTotalPoint(totalPoint);
		rclist.add(rpbean);
		
		System.out.println("rclist 갯수: "+ rclist.size());
		
		
	}
	
	public ArrayList<RproductBean> getAllRproducts(){
		return rclist;
	}
	
	
	public void setEdit(String pno, String oqty) {
		
		int oqty_int = Integer.parseInt(oqty);
		for(RproductBean rpbean : rclist) {
			if(rpbean.getPno()==Integer.parseInt(pno)) {
				rpbean.setPqty(oqty_int);
				int totalPrice = rpbean.getPrice() * rpbean.getPqty();
				int totalPoint = rpbean.getPoint() * rpbean.getPqty();
				rpbean.setTotalPrice(totalPrice);
				rpbean.setTotalPoint(totalPoint);
			}
			
		}
	}
	
	public void removeProduct(String pno) {
		int pno_int = Integer.parseInt(pno);
		for(RproductBean rpbean : rclist) {
			if(rpbean.getPno() == pno_int) {
				rclist.remove(rpbean);
				break;
			}
		}
	}
	
	public void removeAllProduct() {
		rclist.removeAll(rclist);
	}
	
	
	
	
	
}
