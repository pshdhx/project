package cn.itcast.shop.utils;

import java.net.Authenticator;
import java.net.PasswordAuthentication;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.xml.internal.fastinfoset.sax.Properties;

public class MailUtils {
	public static void sendMail(String to,String code){
		/**
		 * 获得一个session对象
		 * 创建一个代表邮件的对象message
		 * 发送邮件 Transport
		 */
		java.util.Properties props = new java.util.Properties();
		props.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {

			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new javax.mail.PasswordAuthentication("service@shop.com", "111");
			}
		});
		//创建邮件对象
		Message message = new MimeMessage(session);
		//设置发件人
		try {
			message.setFrom(new InternetAddress("service@shop.com"));
			//设置收件人
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			//抄送cc：密送bcc
			message.setSubject("来自购物商城的激活邮件！");
			//设置邮件的正文
			message.setContent("<h1>来自购物商城的激活邮件，点击下方的链接进行账户激活操作</h1><br/><h3><a href='http://192.168.0.104/shop/user_active.action?code="+code+"'>http://192.168.0.104/shop/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
			//发送邮件
			Transport.send(message);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	public static void main(String[] args) {
		sendMail("aaa@shop.com", "1111111111111");
	}
}
