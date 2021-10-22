package us.k5n.webcalendar;

/**
 * Defines the API for displaying messages. Typically, a WebCalendar client
 * application will implement this interface and display popup windows for each
 * incoming message.
 * 
 * @author Craig Knudsen
 * @version $Id: MessageDisplayer.java,v 1.3.2.1 2007/08/06 00:30:59 umcesrjones Exp $
 */
public interface MessageDisplayer {

  public void showReminder ( Reminder reminder );

  public void showMessage ( String message );

  public void showError ( String message );

}
