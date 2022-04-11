package dao;

import resource.Event;
import resource.Ride;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ListEventsDatabase {

    private final String STATEMENT;
    /**
     * The connection to the database
     */
    private final Connection con;

    /**
     * Creates a new object for list all the roles in the database
     *
     * @param con
     *            the connection to the database.
     */
    private final Integer rideid;

    public ListEventsDatabase(final Connection con, Integer rideid, boolean planned, boolean notPlanned, String start_date, String  end_date) {
        this.con = con;
        String qry = "SELECT * FROM amupark.event WHERE rideid=?";
        if (!planned) {
            qry += " AND planned=FALSE";
        }
        if(!notPlanned){
            qry += " AND planned=TRUE";
        }
        if (start_date!=null&&!start_date.equals("")){
            qry += " AND date_performed>=TO_DATE(?, 'YYYY/MM/DD')";
        }

        if (end_date!=null&&!end_date.equals("")){
            qry += " AND date_performed<=TO_DATE(?, 'YYYY/MM/DD')";
        }
        
        this.STATEMENT = qry;
        this.rideid = rideid;
    }

    /**
     * List all the roles in the database.
     *
     * @return the List of {@code String} corresponding to the roles in the database.
     *
     * @throws SQLException
     *             if any error occurs while reading the roles.
     */
    public List<Event> listEvents() throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Event> events = new ArrayList<>();


        try {
            pstmt = con.prepareStatement(STATEMENT);
            pstmt.setInt(1, rideid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                events.add(new Event(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getBoolean(7)));
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

        return events;
    }

}
