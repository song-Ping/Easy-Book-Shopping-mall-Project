package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Book;

public class BookRepository {// 제품저장소

	private ArrayList<Book> listOfBooks = new ArrayList<Book>();// 전체상품 데이터
	private static BookRepository newBooks = new BookRepository();// 신규상품 데이터

	Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:study";
	String user = "system";
	String password = "12345";

	public BookRepository() {

	}

	public ArrayList<Book> getAllProducts() {// DB에 저장되어있는 제품목록 가져오기 위한 메소드.
		String sql = "select * from book";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // DB에 저장되어 있는 상품 모두 가져와 ResultSet에 담음

			while (rs.next()) {
				Book book = new Book();
				book.setBookId(rs.getString("p_id"));
				book.setCategory(rs.getString("p_category"));
				book.setPname(rs.getString("p_name"));
				book.setReleaseDate(rs.getString("p_releaseDate"));
				book.setAuthor(rs.getString("p_author"));
				book.setPublisher(rs.getString("p_publisher"));
				book.setDescription(rs.getString("p_description"));
				book.setUnitPrice(rs.getInt("p_unitPrice"));
				book.setCondition(rs.getString("p_condition"));
				book.setUnitsInStock(rs.getInt("p_unitsInStock"));
				book.setFilename(rs.getString("p_fileName"));

				listOfBooks.add(book); // ArrayList 컬랙션에 product 객체 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				System.out.println("DB연동 해제");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return listOfBooks; // 각 객체가 저장되어 ArrayList 리턴함.
	}

	public static BookRepository getNewBooks() {
		return newBooks;
	}

	public Book getbookById(String bookId) {// 책추가시 확인작업위한 메소드.
		Book BookById = new Book();
		String sql = "select * from book where p_id = ?";

		try {
			conn = getConnection();// 커넥션 얻기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);

			rs = pstmt.executeQuery();

			if (!rs.next()) {
				return null; // 일치하는 상품이 없는 상태.
			}

			if (rs.next()) { // 인자값으로 넘어온 값이 있다면
				Book book = new Book(); // 각각 DB에서 가져온 값을 저장
				book.setBookId(rs.getString("p_id"));
				book.setCategory(rs.getString("p_category"));
				book.setPname(rs.getString("p_name"));
				book.setReleaseDate(rs.getString("p_releaseDate"));
				book.setAuthor(rs.getString("p_author"));
				book.setPublisher(rs.getString("p_publisher"));
				book.setDescription(rs.getString("p_description"));
				book.setUnitPrice(rs.getInt("p_unitPrice"));
				book.setCondition(rs.getString("p_condition"));
				book.setUnitsInStock(rs.getInt("p_unitsInStock"));
				book.setFilename(rs.getString("p_fileName"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return BookById;
	}

	public void addBook(Book book) {// 새로운제품 등록
		listOfBooks.add(book);
	}

	public Connection getConnection() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버명
			conn = DriverManager.getConnection(url, user, password); // DB연결 객체 얻음.
			System.out.println("DB 연동 완료");
		} catch (Exception e) {
			System.out.println("DB 연동 실패");
			e.printStackTrace();
		}

		return conn;
	}

	public Book getStockInfo(String id, int num) {//주문완료성공하면 장바구니에 담긴 제품의 수량을 제품 전체 수량에서 제하는 메소드
		String sql = "update book set p_unitsInStock = p_unitsInStock - " + num + " where p_id = ?";
		Book book = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			int stock = Integer.parseInt(rs.getString("p_unitsInStock")) - num;
			
			if (rs.next()) {
				rs.getString(stock);
			}

		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러 : " + ex);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return book;
	}
}
