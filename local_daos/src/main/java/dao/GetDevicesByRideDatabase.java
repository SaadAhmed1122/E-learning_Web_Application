package dao;

import resource.Device;
import resource.Ride;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetDevicesByRideDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "SELECT * FROM amupark.device WHERE rideid=?;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The ride for which we need to find devices
     */
    Ride ride;

    public GetDevicesByRideDatabase(final Connection con, final Ride r) {
        this.con = con;
        this.ride = r;
    }

    public List<Device> getDevicesByRide() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the found devices
        List<Device> foundDevices = new ArrayList<Device>();

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setInt(1, ride.getRideid());

            rs = pstmt.executeQuery();

            if (rs.next()) {
                foundDevices.add(new Device(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5)));
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

        return foundDevices;
    }
}
