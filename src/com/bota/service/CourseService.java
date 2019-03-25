package com.bota.service;

import java.util.List;
import java.util.Map;

import com.bota.bean.Course;

public interface CourseService {
	/**
	 * 根据活动号查询该活动是否存在
	 * @author bota
	 * @param courseNumber
	 * @return
	 */
	public String selectCourseByCourseNumber(long courseNumber);
	
	/**
	 * 修改活动信息
	 */
	public boolean updateCourseById(Course course);
	
	/**
	 * 添加活动
	 * @param course 活动实体
	 * @return
	 */
	public boolean addCourse(Course course);
	
	/**
	 * 查询所有的活动
	 * @return
	 */
	public List<Map<String, Object>> selectAllCourse();


	
	/**
	 * 分页查询所有的活动
	 * @return
	 */
	public Map<String, Object> selectAllCourse(int pageNum,int pageSize,Map<String, Object> paramMap);

	/**
	 * 查询前四项活动
	 * @return
	 */
	public Map<String, Object> selectFourCourse(Map<String, Object> paramMap);
	
	/**
	 * 查询活动的数量
	 * @return 
	 */
	Map<String, Object> selectCourseNumber();
	
	
	/**
	 * 根据老师id查询活动
	 * @paramid
	 * @return
	 */
	public List<Map<String, Object>> selectCourseByTeacherId(long teacherId);
	
	/**
	 * 根据id查询活动
	 * @param id
	 * @return
	 */
	public Course selectOne(long id);
	/**
	 * 修改活动的信息
	 * @param course
	 * @return
	 */
	public boolean updateById(Course course);
	/**
	 * 根据id删除活动
	 * @paramid
	 * @return
	 */
	public boolean deleteById(long id);

	/**
	 * 根据id批量删除活动
	 * @paramids
	 * @return
	 */
	public boolean deleteByIds(String id);

	/**
	 * 老师查询活动
	 * @param pageNum
	 * @param pageSize
	 * @param paramMap
	 * @return
	 */
	public Map<String, Object> selectAllCourseByTeacher(int pageNum, int pageSize, Map<String, Object> paramMap);

	/**
	 * 学生查询活动
	 * @param pageNum
	 * @param pageSize
	 * @param paramMap
	 * @return
	 */
	Map<String, Object> selectAllCourseByStudent(int pageNum, int pageSize, Map<String, Object> paramMap);

	/**
	 * 老师申请修改活动
	 * @param course
	 */
	public boolean updateCourse(Course course);
}
