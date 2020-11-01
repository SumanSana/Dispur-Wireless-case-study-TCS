package dispurwireless.entity;

public class Profile {
	private int regId;
	private String firstName;
	private String lastName;
	private String address;
	private String email;
	private String contactNumber;
	public Profile(int regId, String firstName, String lastName, String address, String email,
			String contactNumber) {
		super();
		this.regId = regId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.email = email;
		this.contactNumber = contactNumber;
	}
	public Profile(String firstName, String lastName, String address, String email, String contactNumber) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.email = email;
		this.contactNumber = contactNumber;
	}
	public int getRegId() {
		return regId;
	}
	public void setRegId(int regId) {
		this.regId = regId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	@Override
	public String toString() {
		return "Profile [regId=" + regId + ", firstName=" + firstName + ", lastName=" + lastName + ", address="
				+ address + ", email=" + email + ", contactNumber=" + contactNumber + "]";
	}
	
	
	
}
