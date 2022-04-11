package dao;

import resource.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateModelDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT =  "UPDATE amupark.model SET description=? WHERE name=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The model to be updated
     */
    Model model;

    public UpdateModelDatabase(final Connection con, final Model m) {
        this.con = con;
        this.model = m;
    }

    public Model updateModel() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        Model updatedModel = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, model.getDescription());
            pstmt.setString(2, model.getName());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                updatedModel = new Model(rs.getString(1), rs.getString(2));
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

        return updatedModel;
    }

}
