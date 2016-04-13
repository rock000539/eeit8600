package tw.com.softleader.eeit8600.book.service;

import java.util.ArrayList;
import java.util.List;

import tw.com.softleader.eeit8600.book.entity.Book;

public class BookService {
	
//	public static void main(String[] args) {
//		Book book = new BookService().getById(1L);
//		System.out.println(book);
//		System.out.println("--------------------------------------------------------");
//		List<Book> books = new BookService().getAll();
//		for(Book b:books) {
//			System.out.println(b);
//		}
//	}
//	

	public Book getById(Long id) {
		
		Book book1 = new Book();
		
		
		book1.setIsbnNo("111-000-0001");
		book1.setName("Happy to learn Java");
		book1.setAuthor("Gary Lee");
		book1.setPrice(100);
		book1.setId(1L);
		
		
		return book1;
		
		
	}
	
	public List<Book> getAll() {
		List<Book> books = new ArrayList<Book>();
		
		Book book1 = new Book();
		
		book1.setIsbnNo("111-000-0001");
		book1.setName("Happy to learn Java");
		book1.setAuthor("Gary Lee");
		book1.setPrice(100);
		book1.setId(1L);
		
		books.add(book1);
		
		Book book2 = new Book();
		
		book2.setId(2L);
		book2.setIsbnNo("111-000-0002");
		book2.setName("Happy to learn JavaScript");
		book2.setAuthor("Gary Lee");
		book2.setPrice(150);
		
		books.add(book2);
		
		return books;
	}
}
