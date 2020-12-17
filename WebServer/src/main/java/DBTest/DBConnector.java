package DBTest;

import Models.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class DBConnector {

    private final Statement st;
    private ResultSet rs;
    private int result;

    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ivent?useUnicode=true&useJDBCCompliant" +
                "TimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");

        st = con.createStatement();

    }

    public ArrayList<User> getAllUsers() throws SQLException {
        ArrayList<User> allUsers = new ArrayList<>();
        String query = "SELECT * FROM user";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String surname = rs.getString("surname");
            String name = rs.getString("name");
            String mail = rs.getString("mail");
            String password = rs.getString("password");
            String companyName = rs.getString("companyName");
            boolean admin = rs.getBoolean("admin");
            allUsers.add(new User(surname, name, mail, password, companyName,admin));
        }
        return allUsers;
    }

    public ArrayList<Trick> getAllTricks() throws SQLException {
        ArrayList<Trick> allTrick = new ArrayList<>();
        String query = "SELECT * FROM trick";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("name");
            String description = rs.getString("description");
            allTrick.add(new Trick(name, description));
        }
        return allTrick;
    }

    public ArrayList<Requisite> getAllRequisite() throws SQLException {
        ArrayList<Requisite> allRequisite = new ArrayList<>();
        String query = "SELECT * FROM requisite";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("name");
            String description = rs.getString("description");
            String picturePath = rs.getString("picturePath");
            allRequisite.add(new Requisite(name, description,picturePath));
        }
        return allRequisite;
    }

    public ArrayList<Performance> getAllPerformance() throws SQLException {
        ArrayList<Performance> allPerformance = new ArrayList<>();
        String query = "SELECT * FROM performance";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("name");
            String description = rs.getString("description");
            boolean shared = rs.getBoolean("shared");
            Date publicationDate = rs.getDate("publicationDate");

            allPerformance.add(new Performance(name, description,shared,publicationDate));
        }
        return allPerformance;
    }

    public ArrayList<BookedPerformance> getAllBookedPerformance() throws SQLException {
        ArrayList<BookedPerformance> bookedPerformance = new ArrayList<>();
        String query = "SELECT * FROM booked_performance";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            int idIllusionist = rs.getInt("idIllusionist");
            int idCompany = rs.getInt("idCompany");
            Date performanceDate = rs.getDate("performanceDate");
            int idPerformace = rs.getInt("idPerformace");

            bookedPerformance.add(new BookedPerformance( getUserById(idIllusionist), getUserById(idCompany),performanceDate,getPerformanceById(idPerformace)));
        }
        return bookedPerformance;
    }

    public ArrayList<RequisiteList> getAllRequisiteList() throws SQLException {
        ArrayList<RequisiteList> requisiteList = new ArrayList<>();
        String query = "SELECT * FROM requisite_list";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            int idRequisite = rs.getInt("idRequisite");
            int idTrick = rs.getInt("idTrick");

            requisiteList.add(new RequisiteList(getRequisiteById(idRequisite), getTrickById(idTrick)));
        }
        return requisiteList;
    }

    public ArrayList<TrickList> getAllTrickList() throws SQLException {
        ArrayList<TrickList> trickList = new ArrayList<>();
        String query = "SELECT * FROM trick_list";
        rs=st.executeQuery(query);
        while(rs.next())
        {
            int idTrick = rs.getInt("idTrick");
            int idPerformance = rs.getInt("idPerformance");

            trickList.add(new TrickList(getTrickById(idTrick), getPerformanceById(idPerformance)));
        }
        return trickList;
    }

    private User getUserById(int id) throws SQLException {
        String query = "SELECT * FROM user WHERE user.id ="+id;
        User user = null;
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String surname = rs.getString("surname");
            String name = rs.getString("name");
            String mail = rs.getString("mail");
            String password = rs.getString("password");
            String companyName = rs.getString("companyName");
            boolean admin = rs.getBoolean("admin");

            user = new User(surname, name, mail, password, companyName,admin);
        }
        return user;
    }

    private Trick getTrickById(int id) throws SQLException {
        String query = "SELECT * FROM trick WHERE trick.id ="+id;
        Trick trick = null;
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("name");
            String description = rs.getString("description");
            trick = new Trick(name, description);
        }
        return trick;
    }

    private Requisite getRequisiteById(int id) throws SQLException {
        String query = "SELECT * FROM requisite WHERE requisite.id ="+id;
        Requisite requisite = null;
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("name");
            String description = rs.getString("description");
            String picturePath = rs.getString("picturePath");
            requisite = new Requisite(name, description,picturePath);
        }
        return requisite;
    }

    private Performance getPerformanceById(int id) throws SQLException {
        String query = "SELECT * FROM `performance` WHERE performance.id ="+id;
        Performance performance = null;
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("name");
            String description = rs.getString("description");
            boolean shared = rs.getBoolean("shared");
            Date publicationDate = rs.getDate("publicationDate");

            performance = new Performance(name, description,shared,publicationDate);
        }
        return performance;
    }

    public int insertUser(User user) throws SQLException {
        String query = "INSERT INTO `user` (`id`, `surname`, `name`, `mail`, `password`, `companyName`, `admin`)" +
                " VALUES (NULL, '" + user.getSurname() + "', '" + user.getName() + "', '" + user.getMail() + "', '" +
                user.getPassword() + "', '" + user.getCompanyName() + "', '" + user.isAdmin() + "')";
        result = st.executeUpdate(query);
        return result;
    }

    public int insertTrick(Trick trick) throws SQLException {
        String query = "INSERT INTO `trick` (`id`, `name`, `description`)" +
                " VALUES (NULL, '" + trick.getName() + "', '" + trick.getDescription() + "', '" + "')";
        result = st.executeUpdate(query);
        return result;
    }

    public int insertRequisite(Requisite requisite) throws SQLException {
        String query = "INSERT INTO `trick` (`id`, `name`, `description`, `picturePath`)" +
                " VALUES (NULL, '" + requisite.getName() + "', '" + requisite.getDescription() +
                "', '" + requisite.getPicturePath() + "')";
        result = st.executeUpdate(query);
        return result;
    }

    public int insertPerformance(Performance performance) throws SQLException {
        String query = "INSERT INTO `performance` (`id`, `name`, `decsription`, `shared`, `publicationDate`)" +
                " VALUES (NULL, '" + performance.getName() + "', '" + performance.getDescription() + "', '" +
                performance.isShared() + "', '" + performance.getPublicationDate() + "')";
        result = st.executeUpdate(query);
        return result;
    }

    public int insertBookedPerformance(User illusionist, User company, Performance performance) throws SQLException {
        String query = "INSERT INTO `performance` (`id`, `name`, `decsription`, `shared`, `publicationDate`)" +
                " VALUES (NULL, '" + performance.getName() + "', '" + performance.getDescription() + "', '" +
                performance.isShared() + "', '" + performance.getPublicationDate() + "')";
        result = st.executeUpdate(query);
        return result;
    }
}
