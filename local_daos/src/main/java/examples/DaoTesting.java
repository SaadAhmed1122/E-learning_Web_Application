package examples;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp2.*;

import resource.*;
import dao.*;

public class DaoTesting {

    private static DataSource ds = null;

    public static void main(String[] args){


        try {



            Park p = new GetParkByNameDatabase(getDataSource().getConnection(), new Park("AcroparkNY")).getParkByName();
            System.out.println(p);
            //Park p2 = new Park("MyTemporaryPark", "MTP@domain.com", "The address of this park, 42, Padova");
            //Park p3 = new InsertParkDatabase(getDataSource().getConnection(), p2).insertPark();
            //System.out.println(p3);

            User u = new GetUserByMailDatabase(getDataSource().getConnection(), new User("guglielmo.faggioli@parkville.com")).getUserByMail();
            System.out.println(u);

        } catch (Exception e){
            e.printStackTrace();
        }

    }

    public static DataSource getDataSource() throws NamingException {

        // we don't want to initialize a new datasoruce everytime, so, we check first that ds is null
        if (ds == null) {

            BasicDataSource source = new BasicDataSource();
            source.setDriverClassName("org.postgresql.Driver");
            source.setUrl("jdbc:postgresql://localhost:5432/tutordb");
            source.setUsername("parkadmin");
            source.setPassword("admin");
            ds = source;
        }
        return ds;
    }
}
