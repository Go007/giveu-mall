package id.service;

import com.IdApplication;
import com.dafycredit.id.service.IShopIdService;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.fail;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = IdApplication.class)

public class TestShopIdServiceImpl {

	@Autowired
	private IShopIdService idService;

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

	public int num = 1;

	/**
	* @Title: testGetSingleId 
	* @Description:测试获取单个id
	* @paramta:@throws InterruptedException
	* @return:void
	* @throws
	*/
	@Test
	public void testGetSingleId() throws InterruptedException {
		
		/*Runnable myRunnable = new MyRunnable(); // 创建一个Runnable实现类的对象
		for (int i = 0; i < 5; i++) {
			new Thread(myRunnable).start();
		}*/
		for (int i = 0; i < 10; i++) {
			System.out.println("--------------"+idService.getSingleId("pay").getData());	
//			System.out.println("--------------"+JSON.toJSONString(idService.getSingleId("order")));	
		}

	}

	/**
	* @Title: teseGetBatchId 
	* @Description:测试获取一批id
	* @paramta:@throws InterruptedException
	* @return:void
	* @throws
	*/
	@Test
	public void teseGetBatchId() throws InterruptedException{
		System.out.println("------------------");
		System.out.println(idService.getBatchId("pay", 250).getData().toString());
//		Thread.sleep(2000);
//		System.out.println(idService.getSingleId("pay").getData());
//		System.out.println(idService.getBatchId("pay", 52).getData());
//		System.out.println(idService.getSingleId("pay").getData());
		
	}
	
	public static void main(String[] args) {
		TestSale testSale = new TestSale();
		for (int i = 0; i < 5; i++) {
			new Thread(testSale).start();
		}
	}

	class MyRunnable implements Runnable {
		private Object object = new Object();

		@Override
		public void run() {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			while (true) {
				synchronized (object) {
					System.out.println(Thread.currentThread().getName() + ":" + idService.getSingleId("order"));
				}
			}
		}

	}
}

class TestSale implements Runnable {
	// private AtomicInteger tikcets=new AtomicInteger(10);
	int tikcets = 100;
	private Object object = new Object();
	private ticketContorller ticketContorller;

	@Override
	public void run() {
		if (ticketContorller == null) {
			ticketContorller = new ticketContorller(tikcets);
		}
		while (true) {
			synchronized (object) {
				if (tikcets > 0) {
					try {
						Thread.sleep(10);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					System.out.println(
							"thread name " + Thread.currentThread().getName() + " 当前余票 " + ticketContorller.sale());
				}
			}
		}
	}

}

class ticketContorller {
	private final int tickeNum;
	private int currTicket;
	@SuppressWarnings("unused")
	private Object obj = new Object();

	public ticketContorller(int ticketNum) {
		this.tickeNum = ticketNum;
		currTicket = ticketNum;
	}

	@SuppressWarnings("deprecation")
	public int sale() {
		if (currTicket > 0) {
			return currTicket--;
		}

		if (currTicket <= 0) {
			System.out.println("票已售完");
			Thread.currentThread().stop();
		}
		return 0;

	}

	public int currTicket() {
		return tickeNum;
	}
}
