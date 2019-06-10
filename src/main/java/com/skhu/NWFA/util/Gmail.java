package com.skhu.NWFA.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {



    @Override

    protected PasswordAuthentication getPasswordAuthentication() {

        return new PasswordAuthentication("newwordgame1234@gmail.com","ahendmltlswhdj1");

    }

    

}