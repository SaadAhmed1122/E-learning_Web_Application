package dao;

import resource.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteModelDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "DELETE FROM amupark.model WHERE name=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The model to be deleted
     */
    Model model;

    public DeleteModelDatabase(final Connection con, final Model m) {
        this.con = con;
        this.model = m;
    }

    public Model deleteModel() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created model
        Model deletedModel = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, model.getName());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                deletedModel = new Model(rs.getString(1), rs.getString(2));
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

        return deletedModel;
    }

}
