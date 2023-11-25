/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;


public class Account {
    private int maAccount;
    private String username;
    private String password;
    private int isAdmin;
    private String email;

    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
    public int getMaAccount() {
        return maAccount;
    }

    public void setId(int maAccount) {
        this.maAccount = maAccount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String user) {
        this.username = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String pass) {
        this.password = pass;
    }

    public Account(int maAccount, String user, String pass, int isAdmin, String email) {
		
		this.maAccount = maAccount;
		this.username = user;
		this.password = pass;
		this.isAdmin = isAdmin;
		this.email = email;
	}

	public Account() {
		
	}

	@Override
	public String toString() {
		return "Account [id=" + maAccount + ", user=" + username + ", pass=" + password + ", isAdmin=" + isAdmin
				+ ", email=" + email + "]";
	}

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

   
   

    
}
