package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.Book3DTO;

@Repository
public interface Book3DAO {

	@Select("select * from book3")
	List<Book3DTO> selectList();

	@Select("select * from book3 where name like '%${name}%'")
	List<Book3DTO> selectBook(String name);

	@Insert("insert into book3(name, author, publisher, publishDate, price, memo, score)"
			+ "values(#{name}, #{author}, #{publisher}, #{publishDate}, #{price}, #{memo}, #{score})")
	int insert(Book3DTO dto);

	@Delete("delete from book3 where idx=#{idx}")
	int delete(int idx);

	@Select("select * from book3 where name=#{name}")
	Book3DTO searchOne(String name);

	@Select("select * from book3 where idx=#{idx}")
	Book3DTO selectOne(int idx);

	@Update("update book3 set name=#{name}, author=#{author}, publisher=#{publisher}, publishdate=#{publishDate}, price=#{price}, memo=#{memo}, score=#{score} where idx=#{idx}")
	int update(Book3DTO user);

	@Select("select * from book3 where price <= #{price}")
	List<Book3DTO> mSearch(int price);

	

	
	



	
	

	
	

	

	
	

	
	
}
