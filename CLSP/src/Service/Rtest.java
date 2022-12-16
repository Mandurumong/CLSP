package Service;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

public class Rtest {

	public Rtest() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RConnection conn = null;
		
		try {
			conn = new RConnection();
			
			REXP exp = conn.eval("R.version.string");
			
			System.out.println(exp.asString());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(conn != null) {
				conn.close();
			}
		}
	}

}
