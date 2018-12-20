package aijingjing.utils;

public class MyUtils {
	
	public String withDouhao(String a,String b) {
		if(a==null||a=="") {
			return b;
		}
		return a+","+b;
	}
}
