// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CerberusTestRunner.java

package org.cerberus.test;

import android.test.ActivityInstrumentationTestCase2;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.robotium.solo.Solo;

// Referenced classes of package org.cerberus.test:
//            CerberusActivityInstrumentation, CerberusTestRunner

public class CerberusRunner_2 extends CerberusActivityInstrumentation
{

    public CerberusRunner_2()
    {
        super(launcherActivityClass);
    }

    public void setUp()
        throws Exception
    {
        solo = new Solo(getInstrumentation(), getActivity());
        super.setUp();
    }

    public void testRun()
        throws Exception
    {
        View view = solo.getView(0x7f040087);
        if(view instanceof Button)
            solo.clickOnView(view);
        else
        if(view instanceof TextView)
            solo.clickOnText(((TextView)view).getText().toString());
        else
            solo.clickOnView(view);
        Thread.sleep(6070L);
        view = solo.getView(0x7f040088);
        if(view instanceof Button)
            solo.clickOnView(view);
        else
        if(view instanceof TextView)
            solo.clickOnText(((TextView)view).getText().toString());
        else
            solo.clickOnView(view);
        Thread.sleep(5304L);
        view = solo.getView(0x7f040088);
        if(view instanceof Button)
            solo.clickOnView(view);
        else
        if(view instanceof TextView)
            solo.clickOnText(((TextView)view).getText().toString());
        else
            solo.clickOnView(view);
        Thread.sleep(4802L);
        solo.setDatePicker(0, 2014, 5, 12);
        solo.sleep(1500);
        solo.clickOnText("\uC124\uC815");
        Thread.sleep(2655L);
        view = solo.getView(0x7f040088);
        if(view instanceof Button)
            solo.clickOnView(view);
        else
        if(view instanceof TextView)
            solo.clickOnText(((TextView)view).getText().toString());
        else
            solo.clickOnView(view);
        Thread.sleep(4782L);
        view = solo.getView(0x7f040088);
        if(view instanceof Button)
            solo.clickOnView(view);
        else
        if(view instanceof TextView)
            solo.clickOnText(((TextView)view).getText().toString());
        else
            solo.clickOnView(view);
    }

    public void tearDown()
    {
        super.tearDown();
    }

    private static final String LAUNCHER_ACTIVITY_CLASSNAME = "com.autoschedule.proto.SplashActivity";
    private static Class launcherActivityClass;
    Solo solo;

    static 
    {
        try
        {
            launcherActivityClass = Class.forName("com.autoschedule.proto.SplashActivity");
        }
        catch(ClassNotFoundException classnotfoundexception)
        {
            throw new RuntimeException(classnotfoundexception);
        }
    }
}
