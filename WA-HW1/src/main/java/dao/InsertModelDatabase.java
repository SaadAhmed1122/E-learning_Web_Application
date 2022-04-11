package dao;

import resource.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertModelDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "INSERT INTO amupark.model VALUES(?, ?) RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The model to be inserted
     */
    Model model;

    public InsertModelDatabase(final Connection con, final Model m) {
        this.con = con;
        this.model = m;
    }

    public Model insertModel() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created model
        Model newModel = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, model.getName());
            pstmt.setString(2, model.getDescription());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                newModel = new Model(rs.getString(1), rs.getString(2));
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

        return newModel;
    }

}
