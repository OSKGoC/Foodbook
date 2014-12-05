package Helper;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class reqHelper {
	
	public static String pathDir="D://FoodBookDB//";
	public static String defPic="D://FoodBookDB//image.jpg";
	//web default image = "http://placehold.it/240x160"

	public static ArrayList<String> getRequestParam(HttpServletRequest request,String[] paramsName){
		ArrayList<String> vals=null;
		for (String name : paramsName){
			vals.add(request.getParameter(name));
		}
		return vals;
	}
}
