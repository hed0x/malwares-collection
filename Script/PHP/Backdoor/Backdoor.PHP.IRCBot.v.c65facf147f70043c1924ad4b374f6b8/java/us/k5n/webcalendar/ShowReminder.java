package us.k5n.webcalendar;

/**
 * Interface for showing a reminders.
 * 
 * @author Craig Knudsen
 * @version $Id: ShowReminder.java,v 1.3.2.1 2007/08/06 00:30:59 umcesrjones Exp $
 */
public interface ShowReminder {

  public void showReminder ( Reminder reminder );

  public void showMessage ( String message );

  public void showError ( String message );

}
