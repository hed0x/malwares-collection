package us.k5n.webcalendar.ui.ControlPanel;


/**
 * Interface for listening for updates to the users.
 * 
 * @author Craig Knudsen
 * @version $Id: UserListener.java,v 1.3.2.1 2007/08/06 00:31:00 umcesrjones Exp $
 */
public interface UserListener {

  /**
   * Notify the listener that the list of users has been modified and needs to
   * be reloaded.
   */
  public void updateUserList ();

}
