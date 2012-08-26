package edu.berkeley.calcentral.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HandlerLoggerInterceptor extends HandlerInterceptorAdapter {
    
    
	private static final Logger logger = Logger.getLogger(HandlerLoggerInterceptor.class);
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
            String handlerClassName = new StringBuffer()
                .append("Handler: ")
                .append(handler.toString()).toString();
            String httpMethod = new StringBuffer()
                .append("Request Type: ")
                .append(request.getMethod()).toString();
            String path = new StringBuffer()
                .append("Path: ")
                .append(request.getPathInfo()).toString();
            String servletPath = new StringBuffer()
                .append("Servlet: ")
                .append(request.getContextPath()).toString();
            String userUid = "<anonymous>";
            if (request.getUserPrincipal() != null) {
                userUid = request.getUserPrincipal().getName();
            }
            String uid = new StringBuffer()
                .append("UID: ")
                .append(userUid).toString();
            StringBuffer logMessage = new StringBuffer()
                .append("Found Handler - ")
                .append(httpMethod).append("; ")
                .append(uid).append("; ")
                .append(servletPath).append("; ")
                .append(path).append("; ")
                .append(handlerClassName).append("; ");
            logger.warn(logMessage);
            return true;
    }
}