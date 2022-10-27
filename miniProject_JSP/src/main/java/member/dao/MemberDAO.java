package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static MemberDAO memberDAO = new MemberDAO();//여기서 생성된 생성자는 계속 유지된다
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config2.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("memberSQL.memberWrite", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	public String memberLogin(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);
		sqlSession.close();
		if(memberDTO != null) return memberDTO.getName();
		else return null;
	}
	public boolean isExistId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean exist = false;
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO != null) exist = true;
		sqlSession.close();		
		return exist;
	}
	
}
