/************************************************************************************************************
 * This code is created and maintened only for a research proposal. Please do not use for other proposes.   *
 * Author: Th3 0bservator                                                                                   *
 * Source: https://github.com/guibacellar/BisquillaRansomware                                               *
 * Site: https://www.theobservator.net                                                                      *
 ************************************************************************************************************/

using System;
using System.Diagnostics;
using BisquillaRansomware.Forms;

namespace BisquillaRansomware
{
    internal class UITraceListener : TraceListener
    {
        private FormMain formMain;
        private delegate void SimpleStringDelegate(String text);

        public UITraceListener(FormMain formMain)
        {
            this.formMain = formMain;
        }

        public override void Write(string message)
        {
            formMain.BeginInvoke(new SimpleStringDelegate(formMain.UpdateStatus), message);
        }

        public override void WriteLine(string message)
        {
            formMain.BeginInvoke(new SimpleStringDelegate(formMain.UpdateStatus), message);
        }
    }
}