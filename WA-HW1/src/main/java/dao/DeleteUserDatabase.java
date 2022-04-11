package dao;

import resource.User;

import java.sql.*;

public class DeleteUserDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "DELETE FROM amupark.account WHERE email=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The user to be deleted
     */
    User user;

    public DeleteUserDatabase(final Connection con, final User u) {
        this.con = con;
        this.user = u;
    }

    public User deleteUser() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        User deletedUser = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, user.getEmail());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                deletedUser = new User(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5));
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

        return deletedUser;
    }

}
