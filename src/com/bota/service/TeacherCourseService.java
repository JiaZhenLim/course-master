package com.bota.service;

import java.util.List;
import java.util.Map;

import com.bota.bean.TeacherCourse;

public interface TeacherCourseService {
	/**
	 * 查询所有的活动
	 * @return
	 */
	public List<Map<String, Object>> selectAllTeacherCourse();
	
	/**
	 * 分页查询所有的活动
	 * @return
	 */
	public List<Map<String, Object>> selectAllTeacherCourse(int pageNum,int pageSize);
	
	/**
	 * 查询活动的数量
	 * @return 
	 */
	Map<String, Object> selectTeacherCourseNumber();
	
	/**
	 * 根据id查询活动
	 * @param id
	 * @return
	 */
	public TeacherCourse selectOne(long id);
	/**
	 * 修改活动的信息
	 * @param teacherCourse
	 * @return
	 */
	public boolean updateById(TeacherCourse teacherCourse);
	/**
	 * 根据id删除活动
	 * @param id
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
	 * 添加活动
	 * @param teacherCourse
	 * @return
	 */
	public boolean addTeacherCourse(TeacherCourse teacherCourse);
	
	/**
	 * 查询该活动是否存在
	 * @param id
	 * @return
	 */
	public Map<String, Object>  selectOneByCourseId(long id);

}
