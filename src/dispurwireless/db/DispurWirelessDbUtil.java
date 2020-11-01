package dispurwireless.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;


import dispurwireless.connection.DbConnection;
import dispurwireless.entity.Profile;
import dispurwireless.entity.Account;
import dispurwireless.entity.MyPlan;
import dispurwireless.entity.Plan;


public class DispurWirelessDbUtil {
	
	public static int generateRegId() {
		Random rand = new Random();
		int num = rand.nextInt(90000000)+10000000;
		return num;
	}
	
	public static  boolean isExist(int regId) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT regId from Profile");
			while(rs.next()) {
				if(rs.getInt(1)==regId) {
					flag=true;
					break;
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return flag;
		}
		
	}
	public static String verifyLogin(int regId,String password) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String role = null;
		
		try {
			con = DbConnection.getConnection();
			stmt = con.prepareStatement("SELECT * FROM Account WHERE regId = ? and password = ?");
			stmt.setInt(1,regId);
			stmt.setString(2,password);
			rs = stmt.executeQuery();
			if(rs.next()) {
				role = rs.getString("role");
			}
			
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			
			close(con, stmt, rs);
			return role;
		}
	}
	
	public static Profile getProfile(int regId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Profile profile=null;
		try {
			con = DbConnection.getConnection();
			stmt = con.prepareStatement("Select * from Profile where regId = ?");
			stmt.setInt(1,regId);
			rs = stmt.executeQuery();
			if(rs.next()) {
				profile = new Profile(rs.getInt("regId"),rs.getString("FirstName"),
						rs.getString("lastName"),rs.getString("address"),rs.getString("email"),
						rs.getString("contactNumber"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return profile;
		}
	}
	
	public static Profile getProfileByEmail(String email) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Profile profile=null;
		try {
			con = DbConnection.getConnection();
			stmt = con.prepareStatement("Select * from Profile where email = ?");
			stmt.setString(1,email);
			rs = stmt.executeQuery();
			if(rs.next()) {
				profile = new Profile(rs.getInt("regId"),rs.getString("FirstName"),
						rs.getString("lastName"),rs.getString("address"),rs.getString("email"),
						rs.getString("contactNumber"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return profile;
		}
	}
	
	public static Account getAccount(int regId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Account account=null;
		try {
			con = DbConnection.getConnection();
			stmt = con.prepareStatement("Select * from Account where regId = ?");
			stmt.setInt(1,regId);
			rs = stmt.executeQuery();
			if(rs.next()) {
				account = new Account(rs.getInt("regId"),
						rs.getString("password"),rs.getString("role"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return account;
		}
	}
	
	public static void createProfile(Profile profile) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			String sql = "Insert into Profile(regId,firstName,lastName,address,email,contactNumber) Values(?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1,profile.getRegId());
			stmt.setString(2,profile.getFirstName());
			stmt.setString(3,profile.getLastName());
			stmt.setString(4, profile.getAddress());
			stmt.setString(5,profile.getEmail());
			stmt.setString(6,profile.getContactNumber());
			stmt.execute();
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
		
	}
	
	public static void createAccount(Account account) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = DbConnection.getConnection();
			String sql = "Insert into Account(regId,password,role) Values(?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1,account.getRegId());
			stmt.setString(2,account.getPassword());
			stmt.setString(3,account.getRole());
			
			stmt.execute();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
	}
	
	
	public static int registerCustomer(Profile profile,Account account) {
		
		int regId = generateRegId();
		
		while(isExist(regId)) {
			regId = generateRegId();
		}
		
		profile.setRegId(regId);
		account.setRegId(regId);
		
		createProfile(profile);
		createAccount(account);
		
		return regId;
		
	}
	

	
	public static int updateProfile(Profile profile) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int i=-1;
		
		
		try {
			con = DbConnection.getConnection();
			String sql = "Update Profile Set FirstName=?,LastName=?,Address=?,ContactNumber=? Where regId = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,profile.getFirstName());
			stmt.setString(2,profile.getLastName());
			stmt.setString(3, profile.getAddress());
			stmt.setString(4,profile.getContactNumber());
			stmt.setInt(5,profile.getRegId());
			
			i=stmt.executeUpdate();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return i;
		}
		
	}
	
	public static void changePassword(int regId,String newPassword) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			String sql = "Update Account set password = ? Where regId = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,newPassword);
			stmt.setInt(2,regId);
			stmt.execute();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
	}
	
	public static  List<Profile> getCustomerProfiles(){
		
		List<Profile> profiles = new ArrayList<Profile>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("Select * from Profile p INNER JOIN Account a ON p.regId = a.regId AND a.role='Customer'");
			
			while(rs.next()) {
				Profile profile = new Profile(rs.getInt("regId"),rs.getString("FirstName"),
						rs.getString("lastName"),rs.getString("address"),rs.getString("email"),
						rs.getString("contactNumber"));
				profiles.add(profile);
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return profiles;
		}		
	}
	
	public static Profile seacrhCustomerProfile(int regId) {
		Profile profile = getProfile(regId);
		Account account = getAccount(regId);
		if(account.getRole().equalsIgnoreCase("Customer"))
			return profile;
		else
			return null;
	}
	
	public static void deleteCustomer(int regId) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con=DbConnection.getConnection();
			String sql = "Delete from Profile where regId = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1,regId);
			stmt.execute();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
	}
	
	public static void addPlan(Plan plan) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			String sql = "Insert into Plan(name,type,tarrif,validity,rental,price) Values(?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,plan.getName());
			stmt.setString(2,plan.getType());
			stmt.setInt(3,plan.getTarrif());
			stmt.setInt(4,plan.getValidity());
			stmt.setString(5,plan.getRental());
			stmt.setInt(6,plan.getPrice());
			
			stmt.execute();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
	}
	
	public static Plan getPlan(int planId) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Plan plan=null;
		try {
			con = DbConnection.getConnection();
			String sql = "Select * from Plan where PlanId = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1,planId);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				plan = new Plan(rs.getInt("planId"),rs.getString("name"),rs.getString("type"),rs.getInt("tarrif"),rs.getInt("validity"),rs.getString("rental"),rs.getInt("price"));
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return plan;
		}
	}
	
	public static List<Plan> getPlans() {
		Connection con=null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Plan> plans= new ArrayList<Plan>();
		try {
			con = DbConnection.getConnection();
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("Select * from Plan");
			
			while(rs.next()) {
				Plan plan = new Plan(rs.getInt("planId"),rs.getString("name"),rs.getString("type"),rs.getInt("tarrif"),rs.getInt("validity"),rs.getString("rental"),rs.getInt("price"));
				plans.add(plan);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return plans;
		}
	}
	
	public static List<Plan> getPlansForCustomer(String type,String rental) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Plan> plans= new ArrayList<Plan>();
		try {
			con = DbConnection.getConnection();
			
			String sql = "Select * from Plan Where type = ? and rental = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1,type);
			stmt.setString(2,rental);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Plan plan = new Plan(rs.getInt("planId"),rs.getString("name"),rs.getString("type"),rs.getInt("tarrif"),rs.getInt("validity"),rs.getString("rental"),rs.getInt("price"));
				plans.add(plan);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return plans;
		}
	}
	
	public static void updatePlan(Plan plan) {
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			String sql = "Update Plan Set name=?,type=?,tarrif=?,validity=?,price=?,rental=? Where planId=?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, plan.getName());
			stmt.setString(2, plan.getType());
			stmt.setInt(3,plan.getTarrif());
			stmt.setInt(4, plan.getValidity());
			stmt.setInt(5,plan.getPrice());
			stmt.setString(6, plan.getRental());
			stmt.setInt(7,plan.getPlanId());
			
			stmt.execute();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
	}
	
	public static void deletePlan(int planId) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			String sql = "Delete from Plan where PlanId = ?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1,planId);
			
			stmt.execute();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			
		}
	}
	
	public static void buyPlan(int regId,int planId) {
		Connection con=null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			con=DbConnection.getConnection();
			String sql = "Insert Into BuyPlan(regId,planId,subscriptionDate,expireDate) Values(?,?,?,?)";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1,regId);
			stmt.setInt(2,planId);
			

			Calendar calendar = Calendar.getInstance();
			
			java.util.Date subscriptionDate = calendar.getTime();
			
			int validity = getPlan(planId).getValidity();
			
			calendar.add(Calendar.DATE,validity);
			
			java.util.Date expireDate = calendar.getTime();
			
			stmt.setDate(3, new java.sql.Date(subscriptionDate.getTime()));
			
			stmt.setDate(4, new java.sql.Date(expireDate.getTime()));
			
			stmt.execute();
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
		}
	}
	
	public static List<MyPlan> getMyPlans(int regId){
			Connection con = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			List<MyPlan> myplans = new ArrayList<MyPlan>();
			
			try {
				con = DbConnection.getConnection();
				String sql = "Select * From BuyPlan Where regId = ?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, regId);
				rs=stmt.executeQuery();
				
				while(rs.next()) {
					Plan plan = getPlan(rs.getInt(2));
					MyPlan myplan = new MyPlan(plan,rs.getDate(3),rs.getDate(4));
					myplans.add(myplan);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				close(con,stmt,rs);
				return myplans;
			}
	}
	
	
	private static void close(Connection con, Statement stmt, ResultSet rs) {
		 
		try {
			if (rs != null) {
				rs.close();
			}
			
			if (stmt != null) {
				stmt.close();
			}
			
			if (con != null) {
			
				con.close();  
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}
	
}
