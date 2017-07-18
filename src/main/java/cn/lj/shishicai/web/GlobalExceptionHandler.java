package cn.lj.shishicai.web;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import cn.lj.shishicai.service.ServiceException;


/***
 * 统一异常拦截、异常模型返回。
 */
@ControllerAdvice
public final class GlobalExceptionHandler extends ABaseController{

	protected static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
	@Resource
	RequestMappingHandlerMapping requestMappingHandlerMapping;

	@Resource
	MessageSource messageSource;
	

	
	@ExceptionHandler(ServiceException.class)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Map serviceException(ServiceException e) {
		logger.error("异常",e);
		return getReturnMap(ERROR_CODE,e.getMessage(),null);
	}
}
