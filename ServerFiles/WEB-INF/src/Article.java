package MyBean.DB;

public class Article
{ 
	//���̺�󿡼� ���ڵ�� ������ �ʵ���� ��������� ����
	private String id;     
	private String name;
	private String pwd;
	private String email;
	
	public void setId(String id){
		this.id = id;
	}
	public void setName(String name){
		this.name = name;
	}
	public void setPwd(String pwd){
		this.pwd = pwd;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getId(){
		return id;
	}
	public String getName(){
		return name;
	}
	public String getPwd(){
		return pwd;
	}
	public String getEmail(){
		return email;
	}
}