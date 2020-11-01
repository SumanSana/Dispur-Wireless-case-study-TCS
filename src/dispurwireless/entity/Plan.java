package dispurwireless.entity;

public class Plan {
	
	private int planId;
	private String name;
	private String type;
	private int tarrif;
	private int validity;
	private String rental;
	private int price;
	
	public Plan(int planId, String name, String type, int tarrif, int validity, String rental, int price) {
		super();
		this.planId = planId;
		this.name = name;
		this.type = type;
		this.tarrif = tarrif;
		this.validity = validity;
		this.rental = rental;
		this.price = price;
	}
	
	public Plan(String name, String type, int tarrif, int validity, String rental, int price) {
		super();
		this.name = name;
		this.type = type;
		this.tarrif = tarrif;
		this.validity = validity;
		this.rental = rental;
		this.price = price;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTarrif() {
		return tarrif;
	}

	public void setTarrif(int tarrif) {
		this.tarrif = tarrif;
	}

	public int getValidity() {
		return validity;
	}

	public void setValidity(int validity) {
		this.validity = validity;
	}

	public String getRental() {
		return rental;
	}

	public void setRental(String rental) {
		this.rental = rental;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Plan [planId=" + planId + ", name=" + name + ", type=" + type + ", tarrif=" + tarrif + ", validity="
				+ validity + ", rental=" + rental + ", price=" + price + "]";
	}
	
	
	
	
	
}
