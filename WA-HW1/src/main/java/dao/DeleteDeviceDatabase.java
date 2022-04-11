package dao;

import resource.Device;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteDeviceDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "DELETE FROM amupark.device WHERE deviceid=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The device to be deleted
     */
    Device device;

    public DeleteDeviceDatabase(final Connection con, final Device u) {
        this.con = con;
        this.device = u;
    }

    public Device deleteDevice() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created device
        Device deletedDevice = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setInt(1, device.getDeviceid());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                deletedDevice = new Device(rs.getInt(1), rs.getString(2), rs.getString(3),
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

        return deletedDevice;
    }

}
