package pension.base;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @FunctionalInterface :  java 1.8 추가된 annotaion
// 해당인터페이스는 한개의 메소드만 가질 수있다
// 메소드가 2개 이상이면 에러 발생 - 다른사람의 인터페이스에 함수추가방지
// 람다식에 사용하는 인터페이스는 무조건 @FunctionalInterface 로 구현 
@FunctionalInterface
public interface Action {
	
	void   execute( HttpServletRequest request, 
			HttpServletResponse response )
		throws  ServletException, IOException;
		
}







