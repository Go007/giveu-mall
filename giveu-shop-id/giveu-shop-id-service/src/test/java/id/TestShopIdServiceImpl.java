package id;

import com.IdApplication;
import com.dafycredit.id.service.IShopIdService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = IdApplication.class)
//@ComponentScan(basePackages={"com.dafycredit.id.service"})
public class TestShopIdServiceImpl {

	@Autowired
	private IShopIdService shopIdService;

	@Test
	public void testNextValue(){
		System.out.println("---------------------"+shopIdService.getSingleId("test")+"---------------------");
	}

	
	
}
