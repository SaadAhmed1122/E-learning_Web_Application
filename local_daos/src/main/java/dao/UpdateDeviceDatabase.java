package dao;

import resource.Device;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateDeviceDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "UPDATE amupark.device SET name=?, description=?, type=?::amupark.devicetypes, rideid=?  WHERE deviceid=? RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The device to be updated
     */
    Device device;

    public UpdateDeviceDatabase(final Connection con, final Device m) {
        this.con = con;
        this.device = m;
    }

    public Device updateDevice() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created user
        Device updatedDevice = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, device.getName());
            pstmt.setString(2, device.getDescription());
            pstmt.setString(3, device.getType());
            pstmt.setInt(4, device.getRideid());
            pstmt.setInt(4, device.getDeviceid());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                updatedDevice = new Device(rs.getInt(1), rs.getString(2), rs.getString(3),
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

        return updatedDevice;
    }

}
