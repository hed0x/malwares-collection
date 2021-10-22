package us.k5n.webcalendar;

/**
 * Defines the API for receiving an event list once it is returned from the
 * server.
 * 
 * @author Craig Knudsen
 * @version $Id: EventDisplayer.java,v 1.3.2.1 2007/08/06 00:30:59 umcesrjones Exp $
 */
public interface EventDisplayer {

  public void storeEvents ( EventList events );

}
