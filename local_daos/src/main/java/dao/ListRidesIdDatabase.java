package dao;

import resource.Park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListRidesIdDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT rideid FROM amupark.ride;";
    /**
     * The connection to the database
     */
    private final Connection con;


    public ListRidesIdDatabase(final Connection con) {
        this.con = con;
    }

    public List <Integer> listRidesIdByPark() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created ride
        List<Integer> foundRidesId = new ArrayList<Integer>();

        try {
            pstmt = con.prepareStatement(STATEMENT);

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
