package tw.com.queautiful.commons.util;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.queautiful.App;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(App.class)
public class ScheduleTasksTest {

	@Autowired
	private ScheduleTasks tasks;
	
	@Test
	public void testExpDateReminder() {
		tasks.expDateReminder();
	}

}
