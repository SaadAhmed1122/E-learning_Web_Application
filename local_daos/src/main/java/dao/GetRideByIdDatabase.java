package dao;

import resource.Ride;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetRideByIdDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.ride WHERE rideid=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The ride to be searched
     */
    Ride ride;

    public GetRideByIdDatabase(final Connection con, final Ride r) {
        this.con = con;
        this.ride = r;
    }

    public Ride getRideById() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created ride
        Ride searchedRide = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setInt(1, ride.getRideid());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                searchedRide = new Ride(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4));
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

        return searchedRide;
    }

}
