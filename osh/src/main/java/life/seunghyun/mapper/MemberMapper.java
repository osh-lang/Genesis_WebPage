package life.seunghyun.mapper;

import life.seunghyun.domain.MemberVO;

public interface MemberMapper {
	MemberVO read(String userid);
}
