package dao;

import resource.Park;
import resource.Ride;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListRidesIdByParkDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT rideid FROM amupark.ride WHERE parkid=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The park to search the rides
     */
    Park park;

    public ListRidesIdByParkDatabase(final Connection con, final Park p) {
        this.con = con;
        this.park = p;
    }

    public List <Integer> listRidesIdByPark() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created ride
        List<Integer> foundRidesId = new ArrayList<Integer>();

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, park.getName());

            rs = pstmt.executeQuery();

            while (rs.next()) {
                foundRidesId.add(rs.getInt(1));
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

        return foundRidesId;
    }

}
