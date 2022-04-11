package dao;

import resource.Device;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetDeviceByIdDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.device WHERE deviceid=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The device to be found
     */
    Device device;

    public GetDeviceByIdDatabase(final Connection con, final Device u) {
        this.con = con;
        this.device = u;
    }

    public Device getDeviceById() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created device
        Device foundDevice = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setInt(1, device.getDeviceid());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                foundDevice = new Device(rs.getInt(1), rs.getString(2), rs.getString(3),
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

        return foundDevice;
    }

}
