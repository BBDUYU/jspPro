package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;


/*@WebFilter("/CharacterEncodingFilter")*/
public class CharacterEncodingFilter extends HttpFilter implements Filter {

	private String encdoing;
	
    public CharacterEncodingFilter() {
        super();
    }

    public void init(FilterConfig fConfig) throws ServletException {
    	System.out.println("> CharacterEncodingFilter.init()...");
    	this.encdoing=fConfig.getInitParameter("encoding");
    	if(this.encdoing == null)this.encdoing="UTF-8";
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	System.out.println("> CharacterEncodingFilter.doFilter()...");
    	request.setCharacterEncoding(this.encdoing);
    	chain.doFilter(request, response);
    }

	public void destroy() {
		System.out.println("> CharacterEncodingFilter.destroy()...");
	}



}
