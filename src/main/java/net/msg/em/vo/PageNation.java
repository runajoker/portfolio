package net.msg.em.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import net.msg.em.community.CommunityService;

@Component
@Scope("prototype")
public class PageNation implements Serializable {
	
	private PageVO pageVO = new PageVO();
	
	private int pageSize = 10;
	private int blockSize = 10;
	
	private long pg;
	private long totalCount;
	private long pageCount;
	private long startPage;
	private long endPage;
	private StringBuffer display;
	
	private List<ArticleVO> list;
	
	@Autowired
	private CommunityService communityService;
	
	public void process(int b_no, long pg) throws Exception {
		this.pg = pg;
		
		pageVO.setStartnum((pg - 1) * pageSize + 1);
		pageVO.setEndnum(pg * pageSize);
		pageVO.setB_no(b_no);
		 
		setList(communityService.getArticlePageList(pageVO));
		setTotalCount(communityService.getTotalCount(b_no));
		setPageCount((long)Math.ceil((double)getTotalCount() / getPageSize()));
		setStartPage((pg - 1) / getBlockSize() * getBlockSize() + 1);
		setEndPage((pg - 1) / getBlockSize() * getBlockSize() + getBlockSize());
		
		if (getEndPage() > getPageCount()) {
			setEndPage(getPageCount());
		}
		
		display = new StringBuffer();
			display.append("<div class='paginate'>");
		
		if (getStartPage() == 1) {
			display.append(" ");
		} else {
			display.append("<a href='../" + (getStartPage() - 1) + "/' class='pre'>[이전블럭]</a>");
		}

		for(long p=getStartPage(); p<=getEndPage(); p++) {
			if (p == getPg()) {
				display.append(" <strong>" + p + "</strong> ");
			} else {
				display.append(" <a href='../" + p + "/'>" + p + "</a> ");
			}
		}
		
		if (getEndPage() == getPageCount()) {
			display.append(" ");
		} else {
			display.append("<a href='../" + (getEndPage() + 1) + "/' class='next'>[다음블럭]</a>");
		}

	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public long getPg() {
		return pg;
	}

	public void setPg(long pg) {
		this.pg = pg;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public long getPageCount() {
		return pageCount;
	}

	public void setPageCount(long pageCount) {
		this.pageCount = pageCount;
	}

	public long getStartPage() {
		return startPage;
	}

	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}

	public long getEndPage() {
		return endPage;
	}

	public void setEndPage(long endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getDisplay() {
		return display;
	}

	public void setDisplay(StringBuffer display) {
		this.display = display;
	}

	public List<ArticleVO> getList() {
		return list;
	}

	public void setList(List<ArticleVO> list) {
		this.list = list;
	}

	public PageVO getPageVO() {
		return pageVO;
	}

	public void setPageVO(PageVO pageVO) {
		this.pageVO = pageVO;
	}

	public CommunityService getCommunityService() {
		return communityService;
	}

	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}

	@Override
	public String toString() {
		return "PageNation [pageVO=" + pageVO + ", pageSize=" + pageSize + ", blockSize=" + blockSize + ", pg=" + pg
				+ ", totalCount=" + totalCount + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", display=" + display + ", list=" + list + ", communityService=" + communityService + "]";
	}
	
}
