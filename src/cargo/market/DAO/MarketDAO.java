package cargo.market.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import cargo.common.DTO.ItemsDTO;
import cargo.common.DTO.M_boardDTO;
import cargo.common.DTO.M_boardJoinDTO;
import cargo.common.DTO.M_board_replyDTO;
import cargo.common.DTO.M_itemDTO;
import cargo.common.DTO.ReservationDTO;
import cargo.common.DTO.WarehouseDTO;

public class MarketDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	private void getConnection(){
		
		Context init;
		try {
			init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			System.out.println("Error in getConnection()");
			e.printStackTrace();
		}
		
	}
	
	private void freeResource(){
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void postItem(){ // m_board insert 글쓰기 - 파일업로드 해야함
		
	}
	
	public void modifyItem(){ // m_board 글수정
		
	}
	
	public void deleteItem(){ // m_board 글삭제
		
	}
	
	public int getTotalItem(){// m_board 게시글 총 갯수 불러오기
		return 0;
	}
	
	public ArrayList<M_boardDTO> selectAllItem(){ // m_board 목록 불러오기 
		return null;
	}
	
	public M_boardDTO selectBoardItem(){ // board 테이블 1개
		return null;
	}
	
	public M_itemDTO selectItem(){ // item 테이블 1개
		return null;
	}
	
	public M_boardJoinDTO selectJoinItem(int board_no){ // board, item JOIN 객체 반환
		
		M_boardJoinDTO bDTO = new M_boardJoinDTO();
		
		try {
			
			getConnection();
			String sql = "SELECT * FROM m_item JOIN m_board ON m_item.item = m_board.item WHERE m_board.no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				bDTO.setCategory(rs.getString("category"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setDate(rs.getTimestamp("date"));
				bDTO.setImage(rs.getString("image"));
				bDTO.setItem(rs.getString("item"));
				bDTO.setName(rs.getString("name"));
				bDTO.setNo(rs.getInt("no"));
				bDTO.setOnStock(rs.getInt("onStock"));
				bDTO.setPrice(rs.getInt("price"));
				bDTO.setStock(rs.getInt("stock"));
				bDTO.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectJoinItem");
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return bDTO;
	}
	
	public void addComment(){// 댓글 등록
		
	}
	
	public int getTotalComment(int board_no){ // 댓글 갯수 가져오기
		
		return 0;
	}
	
	public ArrayList<M_board_replyDTO> selectAllComment(int board_no){// 댓글 가져오기
		
		ArrayList<M_board_replyDTO> replyList = new ArrayList<>();
		M_board_replyDTO rDTO ;
		
		try {
			getConnection();
			String sql = "SELECT * FROM m_board_reply WHERE board_no=? ORDER BY no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				rDTO = new M_board_replyDTO();
				rDTO.setBoard_no(board_no);
				rDTO.setContent(rs.getString("content"));
				rDTO.setDate(rs.getTimestamp("date"));
				rDTO.setEmail(rs.getString("email"));
				rDTO.setNo(rs.getInt("no"));
				
				replyList.add(rDTO);
			}
			
		} catch (SQLException e) {
			System.out.println("error in selectAllComment");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return replyList;
	}
	
	public void orderItem(){ // 아이템 주문 - 결제 후 order 테이블로 삽입. 
		
	}
	
}
