package MyPack;

public class InputProc {
	public long fibonacci(long n) {
		long before=1; // �����װ�
		long after=1; // ���װ�
		long result=0;
			if(n>=3) { // 3�� �̻��� ������ �� ������ ���� ���Ͽ� ��������� ������ 3�׺��� ���
				for(int i=3;i<=n;i++) {
					result=before+after; //�� ������ ���� ���Ͽ� ���ϴ� ���� ���� ����.
					before=after; // ���ϴ� ���� ���� ���� �Ŀ��� �������� ���Ͽ� ���� �׿� ���װ��� �־���
					after=result; // ���װ��� ������ ���� �־���
				}
			}
		else { result=1;} // n�� 3���� ���� ��� (1,2�� �ϰ��) ���� 1
		return result; //�� ���� ���� ��������
}
}