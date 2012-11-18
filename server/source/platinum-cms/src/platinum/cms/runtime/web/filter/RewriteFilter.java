package platinum.cms.runtime.web.filter;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RewriteFilter implements Filter
{
	private static Pattern _postURLPattern = null;
	private static Pattern _moreCategoryURLPattern = null;
	private static Pattern _moreSubcategoryURLPattern = null;
	
	@Override
	public void init(FilterConfig p_config) throws ServletException
	{
		if (_postURLPattern == null)
		{
			_postURLPattern = Pattern.compile("/([a-z]+)/([a-f0-9]{32}).html");
		}
		if (_moreCategoryURLPattern == null)
		{
			_moreCategoryURLPattern = Pattern.compile("/([a-z]+)/more");
		}
		if (_moreSubcategoryURLPattern == null)
		{
			_moreSubcategoryURLPattern = Pattern.compile("/([a-z]+)/([A-Za-z0-9]{32})/more");
		}
	}
	

	
	
	@Override
	public void doFilter(ServletRequest p_request, ServletResponse p_response,
			FilterChain p_chain) throws IOException, ServletException
	{
		HttpServletRequest request = (HttpServletRequest)p_request;
		HttpServletResponse response = (HttpServletResponse)p_response;
		String uri = request.getRequestURI();
		
		Matcher matcher = null;
		if ((matcher = _postURLPattern.matcher(uri)).find())
		{
			String categoryId = matcher.group(1);
			String postId = matcher.group(2);
			
			request.getRequestDispatcher("/post.jsp?id=" + postId + "&categoryId=" + categoryId).forward(request, response);
		}
		else if ((matcher = _moreCategoryURLPattern.matcher(uri)).find())
		{
			String categoryId = matcher.group(1);
			
			request.getRequestDispatcher("/more.jsp?categoryId=" + categoryId).forward(request, response);
		}
		else if ((matcher = _moreSubcategoryURLPattern.matcher(uri)).find())
		{
			String categoryId = matcher.group(1);
			String subcategoryId = matcher.group(2);
			request.getRequestDispatcher("/more.jsp?categoryId=" + categoryId + "&subcategoryId=" + subcategoryId).forward(request, response);
		}
		else
		{
			p_chain.doFilter(request, response);
		}
	}
	
	
	
	
	@Override
	public void destroy()
	{

	}
}