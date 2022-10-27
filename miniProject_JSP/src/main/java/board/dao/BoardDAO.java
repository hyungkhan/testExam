package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import member.bean.MemberDTO;


public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			//Reader로 xml의 resource들을 읽어온다
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int num = sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
		return num;
	}
	public MemberDTO boardLogin(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("boardSQL.boardLogin", map);
		sqlSession.commit();
		sqlSession.close();
		return memberDTO;
	}
	public List<BoardDTO> boardPrint(Map<String, Integer> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> boardList = sqlSession.selectList("boardSQL.boardPrint", map);
		sqlSession.close();
		return boardList;
	}
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}
	public boolean isExistId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean exist = false;
		MemberDTO memberDTO = sqlSession.selectOne("boardSQL.isExistId", id);
		if(memberDTO != null) exist = true;
		sqlSession.close();
		return exist;
	}
	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("boardSQL.memberWrite", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	public BoardDTO boardView(int seq){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.boardView",seq);
		sqlSession.close();
		return boardDTO;
	}
}
