
package dao;

import resource.Device;

import java.sql.*;


public class InsertDeviceDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT =  "INSERT INTO amupark.device(name, description, type, rideid) VALUES(?, ?, ?::amupark.devicetypes, ?) RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The user to be inserted
     */
    Device device;

    public InsertDeviceDatabase(final Connection con, final Device d) {
        this.con = con;
        this.device = d;
    }

    public Device insertDevice() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created device
        Device newDevice = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, device.getName());
            pstmt.setString(2, device.getDescription());
            pstmt.setString(3, device.getType());
            pstmt.setInt(4, device.getRideid());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                newDevice = new Device(rs.getInt(1), rs.getString(2), rs.getString(3),
                                       rs.getString(4), rs.getInt(5));
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

        return newDevice;
    }

}
