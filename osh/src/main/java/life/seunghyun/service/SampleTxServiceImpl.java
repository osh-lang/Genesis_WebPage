package life.seunghyun.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import life.seunghyun.mapper.Sample2Mapper;
import life.seunghyun.mapper.Sample1Mapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
@Transactional(isolation=Isolation.DEFAULT, propagation=Propagation.REQUIRED)
public class SampleTxServiceImpl implements SampleTxService{
	private Sample1Mapper sample1Mapper;
	private Sample2Mapper sample2Mapper;
	
	@Override
	public void addData(String value) {
		log.info("mapper1..........");
		sample1Mapper.insertCol1(value);
		log.info("mapper2..........");
		sample2Mapper.insertCol2(value);
		log.info("end..............");
	}
	
}
