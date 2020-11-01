package dispurwireless.entity;

import java.util.Date;

public class MyPlan {

	private Plan plan;
	private Date subscriptionDate;
	private Date expireDate;
	public MyPlan(Plan plan, Date subscriptionDate, Date expireDate) {
		super();
		this.plan = plan;
		this.subscriptionDate = subscriptionDate;
		this.expireDate = expireDate;
	}
	public Plan getPlan() {
		return plan;
	}
	public void setPlan(Plan plan) {
		this.plan = plan;
	}
	public Date getSubscriptionDate() {
		return subscriptionDate;
	}
	public void setSubscriptionDate(Date subscriptionDate) {
		this.subscriptionDate = subscriptionDate;
	}
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	@Override
	public String toString() {
		return "MyPlan [plan=" + plan + ", subscriptionDate=" + subscriptionDate + ", expireDate=" + expireDate + "]";
	}
	
	
	
	
	
	
	
}
