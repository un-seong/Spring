package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.StudentDTO;

@Repository
public interface StudentDAO {

	@Select("select * from student1")
	List<StudentDTO> selectList();
	
	// maBatis가 함수의 반환형을 보고 타입을 추론하여, 쿼리 결과를 DTO와 List에 맞게 처리한다
	
	
	@Insert("insert into student1 values (#{name}, #{kor}, #{eng}, ${mat})")
	int insert(StudentDTO dto); // 매개변수를 1개만 전달하기
	// #{} 는 자료형에 맞게 따옴표 처리, ${}는 값만 쿼리문에 삽입

	@Delete("delete from student1 where name=#{name}")
	int delete(String name);

	@Select("select * from student1 where name=#{name}")
	StudentDTO selectOne(String name);

	@Update("update student1 set kor=#{kor}, eng=#{eng}, mat=#{mat} where name = #{name}")
	int update(StudentDTO user);


	
}
