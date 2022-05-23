package dao;

import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertParkDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "INSERT INTO amupark.park VALUES(?, ?, ?) RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The user to be inserted
     */
    Park park;

    public InsertParkDatabase(final Connection con, final Park u) {
        this.con = con;
        this.park = u;
    }

    public Park insertPark() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        Park newPark = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, park.getName());
            pstmt.setString(2, park.getEmail());
            pstmt.setString(3, park.getAddress());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                newPark = new Park(rs.getString(1), rs.getString(2), rs.getString(3));
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

        return newPark;
    }

}
