package cn.lj.shishicai.web;

import java.util.HashMap;
import java.util.Map;

public abstract class ABaseController {
	protected static final int PAGE_SIZE = 20;
	protected static final int SUCCESS_CODE=200;
	protected static final int FORBIDDEN_CODE=403;
	protected static final int ERROR_CODE=500;
	protected static final int NOT_FOUND_CODE=404;
	protected static final int NOT_LOGIN_CODE=100;
protected Map<String,Object> getReturnMap(int code,String message,Object data){
	Map<String,Object> map=new HashMap<String,Object>();
	map.put("code",code);
	map.put("message", message);
	map.put("data", data);
	return map;
}
}
