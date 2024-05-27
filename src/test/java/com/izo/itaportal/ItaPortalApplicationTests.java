package com.izo.itaportal;

import com.izo.itaportal.model.ProgramView;
import com.izo.itaportal.service.ScheduleService;
import com.izo.itaportal.service.SyllabusService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ItaPortalApplicationTests {

	@Autowired
	SyllabusService syllabusService;
	@Autowired
	ScheduleService scheduleService;

	@Test
	void contextLoads() {
		int idPgm = 1;
		ProgramView programInfo = syllabusService.selectJoinPgmByidPgm(idPgm);
		System.out.println("====================================================");
		System.out.println(scheduleService.calculateWeekBetween(programInfo.getStDt(), programInfo.getEndDt()));
		System.out.println("====================================================");
//		log.info("주수: {}", scheduleService.calculateWeekBetween(programInfo.getStDt(), programInfo.getEndDt()));
	}

}
