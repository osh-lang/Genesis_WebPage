package life.seunghyun.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReplyPageDTO extends PageDTO{
	private List<ReplyVO> list;
	private int lastPage;
	
	public ReplyPageDTO(Criteria cri, int total) {
		super(cri, total);
	}
	public ReplyPageDTO(Criteria cri, int total, List<ReplyVO> list) {
		super(cri, total);
		this.list = list;
	}
	
}
