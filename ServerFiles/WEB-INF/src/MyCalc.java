package Mybean;

public class MyCalc{
	private int num1;
	private int num2;
	private char oper;
	private	int	result;

	public MyCalc(){
		num1 = 0;
		num2 = 0;
		oper = ' ';
		result = 0;
	}

	public void setNum1(int num1){
		this.num1 = num1;
	}
	public void setNum2(int num2){
		this.num2 = num2;
	}
	public void setOper(char oper){
		this.oper = oper;
	}
	public int getNum1(){
		return num1;
	}
	public int getNum2(){
		return num2;
	}
	public char getOper(){
		return oper;
	}
	public int getResult(){
		switch(oper){
			case '+' : return num1+num2;

		}
	}
}