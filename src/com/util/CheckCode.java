package com.util;
/**
 * 验证码生成类
 */
import java.util.Random;
import java.util.UUID;

public class CheckCode {

	public String getCheckCode(){
		Random random = new Random();
		String sRand="";
		for (int i=0;i<6;i++){
	    String rand=String.valueOf(random.nextInt(10));
	    sRand+=rand;
		}
	    return sRand;
	}
	
	public static void main(String[] args) {
System.out.println(UUID.randomUUID().toString().replaceAll("-", ""));
	}
}
