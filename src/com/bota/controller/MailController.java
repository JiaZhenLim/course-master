package com.bota.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * 邮件发送核心类
 * @author LIN
 * @version 1.0
 * 2019.02.21
 * Created by LIN on 2019/2/21.
 */

@Controller
public class MailController {

    /***
     * 发送邮件
     */
    @RequestMapping(value = "sendMail", method = RequestMethod.POST)
    @ResponseBody
    public String sendEmail(@RequestParam(value = "receivers[]") String[] receivers,
                            @RequestParam(value = "names[]") String[] names,
                            @RequestParam(value = "courseNames[]") String[] courseNames){
        //发送人邮箱
       final String from = "821788582@qq.com";


        //指定服务器主机为smtp.qq.com
        String host = "smtp.qq.com";

        //获取系统配置
        Properties properties = System.getProperties();

        //设置邮件服务器
        properties.setProperty("mail.smtp.host", host);

        //设置自动检查错误？
        properties.put("mail.smtp.auth","true");

        //获取默认session
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            //新建一个密码验证器
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "wkbtgwbdqimsbeac");
            }
        });

        try {
            //设置默认的邮件对象
            MimeMessage mimeMessage = new MimeMessage(session);

            //设置发送人
            mimeMessage.setFrom(new InternetAddress(from));

            //设置接收人
            int num = receivers.length;
            InternetAddress internetAddress = null;
            for(int i= 0; i < num; i++){
                internetAddress = new InternetAddress(receivers[i]);
                mimeMessage.setRecipient(Message.RecipientType.TO,
                        internetAddress);

                //设置主题
                mimeMessage.setSubject(courseNames[i] + "参加提醒");

                //设置正文
                mimeMessage.setText("亲爱的" +names[i]+ "同学：" +
                        "\n你好，" +
                        "\n欢迎参加"+courseNames[i]+
                        "\n收到请回复");

                //发送消息
                Transport.send(mimeMessage);
                System.out.println("sending success" + names[i]);

            }
        } catch (MessagingException e) {
            e.printStackTrace();
            return "sending error";
        }
        return "sending success";
    }
}

