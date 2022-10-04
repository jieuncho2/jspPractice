package gugudan;

public class GugudanModel {

	public int[] process(int num) {
		int[] arrayResult = new int[9];
		
		for(int i = 0; i < 9; i++) {
			arrayResult[i] = (i + 1) * num;
		}
		return arrayResult;
	}
	
}
