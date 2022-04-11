package dao;

import resource.Ride;
import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.*;

public class ListRidesByParkDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.ride WHERE parkid=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The park to search the rides
     */
    Park park;

    public ListRidesByParkDatabase(final Connection con, final Park p) {
        this.con = con;
        this.park = p;
    }

    public List <Ride> getRidesByPark() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created ride
        List<Ride> foundRides = new ArrayList<Ride>();

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, park.getName());

            rs = pstmt.executeQuery();

            while (rs.next()) {
                foundRides.add(new Ride(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4)));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (pstmt != null) {
                pstmt.close();
            }

            con.close();
        }

        return foundRides;
    }

}
