package MyPack;

public class InputProc {
	public long fibonacci(long n) {
		long before=1; // 전전항값
		long after=1; // 전항값
		long result=0;
			if(n>=3) { // 3항 이상의 값부터 전 두항의 값을 더하여 만들어지기 때문에 3항부터 계산
				for(int i=3;i<=n;i++) {
					result=before+after; //전 두항의 값을 더하여 원하는 항의 값을 얻음.
					before=after; // 원하는 항의 값을 얻은 후에는 다음항을 위하여 전전 항에 전항값을 넣어줌
					after=result; // 전항값에 현재항 값을 넣어줌
				}
			}
		else { result=1;} // n이 3보다 작을 경우 (1,2항 일경우) 값은 1
		return result; //얻어낸 항의 값을 리턴해줌
}
}