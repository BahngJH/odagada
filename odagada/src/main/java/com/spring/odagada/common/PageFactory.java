package com.spring.odagada.common;

public class PageFactory {
	
	public static String getPageBar(int totalCon, int cPage, int numPerPage,String url)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		int totalPage = (int)Math.ceil((double)totalCon/numPerPage);
		
		pageBar="<ul class='pagination justify-content-center pagination'>";
		if(pageNo==1)
		{
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'> < </a>";
			pageBar+="</li>";
		}
		else 
		{
			pageBar+="<li class='page-itme'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'> < </a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(pageNo==cPage)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage)
		{
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#'> > </a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'> > </a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		//paging 처리 script작성
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	public static String getPageBar(int totalCon, int cPage, int numPerPage,String url,String searchType,String keyword)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		int totalPage = (int)Math.ceil((double)totalCon/numPerPage);
		
		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1)
		{
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'> < </a>";
			pageBar+="</li>";
		}
		else 
		{
			pageBar+="<li class='page-itme'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'> < </a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(pageNo==cPage)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage)
		{
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#'> > </a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'> > </a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		//paging 처리 script작성
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&searchType="+searchType+"&keyword="+keyword+"'";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
	
	public static String getPageBar(int totalCon, int cPage, int numPerPage,String url, int qnaNum)
	{
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		int totalPage = (int)Math.ceil((double)totalCon/numPerPage);
		
		pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1)
		{
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'> < </a>";
			pageBar+="</li>";
		}
		else 
		{
			pageBar+="<li class='page-itme'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'> < </a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(pageNo==cPage)
			{
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			else
			{
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage)
		{
			pageBar+="<li class='page-item' disabled>";
			pageBar+="<a class='page-link' href='#'> > </a>";
			pageBar+="</li>";
		}
		else
		{
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'> > </a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		//paging 처리 script작성
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&qnaNum="+qnaNum+"'";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}

}