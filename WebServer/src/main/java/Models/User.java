package Models;

public class User {
    private String surname;
    private String name;
    private String mail;
    private String password;
    private String companyName;
    private boolean admin;

    public User(String surname, String name, String mail, String password, String companyName, boolean admin) {
        this.surname = surname;
        this.name = name;
        this.mail = mail;
        this.password = password;
        this.companyName = companyName;
        this.admin = admin;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

}
