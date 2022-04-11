package dao;

import resource.Event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertEventDatabase {

    /**
     * The SQL statement to be executed
     */
    private static final String STATEMENT = "INSERT INTO amupark.event (type, description, rideid, userid, date_performed, planned) VALUES(?::amupark.eventcategories, ?, ?, ?, TO_DATE(?, 'YYYY/MM/DD'), ?) RETURNING *;";
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * The event to be inserted
     */
    Event event;

    public InsertEventDatabase(final Connection con, final Event e) {
        this.con = con;
        this.event = e;
    }

    public Event insertEvent() throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // the created event
        Event newEvent = null;

        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setString(1, event.getType());
            pstmt.setString(2, event.getDescription());
            pstmt.setInt(3, event.getRideid());
            pstmt.setString(4, event.getUserid());
            pstmt.setString(5, event.getDate_performed());
            pstmt.setBoolean(6, event.isPlanned());


            rs = pstmt.executeQuery();

            if (rs.next()) {
                newEvent = new Event(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getBoolean(7));
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

        return newEvent;
    }

}
