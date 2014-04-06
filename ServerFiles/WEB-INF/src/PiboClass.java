package Mybean;

public class PiboClass{
	public PiboClass(){
	}
	public long Pibo(long num){
		Integer num1 = 1;
		Integer num2 = 1;
		Integer temp = 0;
		
		if(num >= 3){
			for(Integer i = 0 ; i < num-2 ; i++){
			num1 = num1 + num2;
			num2 = num1;
	
			}
		}else{
			num1 = 0;
		}
		return num1;
	}
}