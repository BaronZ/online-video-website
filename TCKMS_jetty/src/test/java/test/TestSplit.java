package test;

public class TestSplit {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] str="aaa，sdasd".split("，");
		for(String s:str){
			System.out.println(s);
		}
	}

}
