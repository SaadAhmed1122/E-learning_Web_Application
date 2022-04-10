package dao;

import resource.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetModelByNameDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.model WHERE name=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The model to be searched
     */
    Model model;

    public GetModelByNameDatabase(final Connection con, final Model m) {
        this.con = con;
        this.model = m;
    }

    public Model getModelByName() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created model
        Model searchedModel = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, model.getName());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                searchedModel = new Model(rs.getString(1), rs.getString(2));
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

        return searchedModel;
    }

}
