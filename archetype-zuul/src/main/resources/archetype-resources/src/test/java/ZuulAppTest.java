package ${package};


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.assertj.core.api.Assertions.assertThat;


@RunWith(SpringRunner.class)
@SpringBootTest
public class ZuulAppTest {
	
	@Autowired
	private ZuulApp app;
		
	/**
	 * Test context loaded
	 */
	@Test
	public void contextLoads() {
		assertThat(app).isNotNull();
	}

	@Test
	public void fire() {

	}
	
	

}
