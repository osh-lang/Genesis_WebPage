package life.seunghyun.mapper;

import org.apache.ibatis.annotations.Insert;

public interface Sample1Mapper {
	@Insert("INSERT INTO TBL_SAMPLE1 VALUES(#{data})")
	public int insertCol1(String data);
}
