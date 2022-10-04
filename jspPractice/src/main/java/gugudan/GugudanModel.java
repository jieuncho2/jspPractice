package gugudan;

public class GugudanModel {

	public int[] process(int num) {
		int[] resultArray = new int[9];
		
		for(int i = 0; i < 9; i++) {
			resultArray[i] = (i + 1) * num;
		}
		return resultArray;
	}
	
}
