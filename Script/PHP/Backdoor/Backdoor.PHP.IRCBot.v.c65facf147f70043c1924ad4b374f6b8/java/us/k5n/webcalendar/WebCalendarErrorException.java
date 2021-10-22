package us.k5n.webcalendar;

/**
 * An error message was returned from WebCalendar server.
 * 
 * @author Craig Knudsen
 * @version $Id: WebCalendarErrorException.java,v 1.3.2.1 2007/08/06 00:30:59 umcesrjones Exp $
 */
public class WebCalendarErrorException extends Exception {

  public WebCalendarErrorException () {
    super ();
  }

  public WebCalendarErrorException ( String msg ) {
    super ( msg );
  }

}
