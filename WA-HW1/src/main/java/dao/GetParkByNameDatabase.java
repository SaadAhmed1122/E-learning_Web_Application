package dao;

import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetParkByNameDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.park WHERE name=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The park to be searched
     */
    Park park;

    public GetParkByNameDatabase(final Connection con, final Park u) {
        this.con = con;
        this.park = u;
    }

    public Park getParkByName() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created park
        Park searchedPark = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, park.getName());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                searchedPark = new Park(rs.getString(1), rs.getString(2), rs.getString(3));

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

        return searchedPark;
    }

}
