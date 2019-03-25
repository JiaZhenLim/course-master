package com.bota.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bota.bean.User;
import com.bota.dao.UserDao;
import com.bota.service.UserService;
import com.bota.util.Dictionary;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDaoImpl;

    @Resource
    private UserDao userDao;

    @Override
    public List<Map<String, Object>> studentsCourseSelection(long courseId) {
        return userDaoImpl.studentsCourseSelection(courseId);
    }

    @Override
    public Map<String, Object> selectUserByUserNumber(long userNumber) {
        return userDaoImpl.selectUserByUserNumber(userNumber);
    }

    @Override
    public Map<String, Object> selectOneByUserNumber(long userNumber) {
        return userDaoImpl.selectOneByUserNumber(userNumber);
    }


    @Override
    public String verifyByUser(User user, Map<String, Object> dbUser) {
        Long a = (Long)dbUser.get("userNumber");

        if (dbUser == null || dbUser.size() <= 0) {
            return Dictionary.S_NOT_EXIST;
        } else if (user.getUsernumber().longValue() != ((Long) dbUser.get("userNumber")).longValue()) {
            return Dictionary.S_FAIL;
        } else if (user.getIdentity().intValue() != ((Integer)dbUser.get("identity")).intValue()) {
            return Dictionary.S_ROLE_ERR;
        } else if (!user.getPassword().equals(dbUser.get("password"))) {
            return Dictionary.S_PWD_ERR;
        }
        return Dictionary.S_SUCCESS;
    }

    @Override
    public boolean updatePwd(Map<String, Object> map) {
        long id = Long.parseLong(map.get("id").toString());
        String password = map.get("newPwd").toString();
        return userDaoImpl.updatePwd(id, password);
    }

    @Override
    public boolean updateUserById(User user) {
        return userDao.updateByPrimaryKeySelective(user) > 0;
    }

    @Override
    public boolean addUser(User user) {
        return userDao.insertSelective(user) > 0;
    }


    /**
     * 查询所有的用户
     *
     * @return
     */
    @Override
    public List<Map<String, Object>> selectAllUser() {
        return userDaoImpl.selectAllUser();
    }

    /**
     * 分页查询所有的用户
     *
     * @return
     */
    @Override
    public Map<String, Object> selectAllUser(int pageNum, int pageSize, Map<String, Object> paramMap) {
        StringBuffer whereSql = new StringBuffer(" where 1=1 ");
        if (paramMap != null) {
            if (paramMap.get("teacherId") != null && !paramMap.get("teacherId").equals("")) {
                whereSql.append(" and co.teacherId=" + paramMap.get("teacherId").toString());
                if (paramMap.get("courseId") != null && !paramMap.get("courseId").equals("")) {
                    whereSql.append(" and sc.courseId=" + paramMap.get("courseId").toString());
                }
                if (paramMap.get("search") != null && !paramMap.get("search").equals("")) {
                    whereSql.append(" and (co.name like'%" + paramMap.get("search").toString() + "%' or u.username like'%" + paramMap.get("search").toString() + "%' or u.usernumber like'%" + paramMap.get("search").toString() + "%') ");
                }
                return userDaoImpl.selectAllStudent(pageNum, pageSize, whereSql.toString());
            }
            if (paramMap.get("search") != null && !paramMap.get("search").equals("")) {
                whereSql.append(" and (u.username like'%" + paramMap.get("search").toString() + "%' or u.usernumber like'%" + paramMap.get("search").toString() + "%') ");
            }
            if (paramMap.get("identity") != null && !paramMap.get("identity").equals("")) {
                whereSql.append(" and u.identity = " + paramMap.get("identity").toString());
            }
            if (paramMap.get("classid") != null && !paramMap.get("classid").equals("")) {
                whereSql.append(" and u.classid=" + paramMap.get("classid").toString());
            }
            if (paramMap.get("collegeid") != null && !paramMap.get("collegeid").equals("")) {
                whereSql.append(" and u.collegeid=" + paramMap.get("collegeid").toString());
            }

            System.out.println(whereSql);
        }
        return userDaoImpl.selectAllUser(pageNum, pageSize, whereSql.toString());
    }


    /**
     * 查询用户的数量
     *
     * @return
     */
    @Override
    public Map<String, Object> selectUserNumber() {
        return userDaoImpl.selectUserNumber();
    }

    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    @Override
    public User selectOne(long id) {
        return userDao.selectByPrimaryKey(id);
    }

    /**
     * 修改用户的信息
     *
     * @param User
     * @return
     */
    @Override
    public boolean updateById(User User) {
        return userDao.updateByPrimaryKeySelective(User) > 0;
    }

    /**
     * 根据id删除用户
     *
     * @param id
     * @return
     */
    @Override
    public boolean deleteById(long id) {
        return userDao.deleteByPrimaryKey(id) > 0;
    }

    /**
     * 根据id删除用户
     *
     * @return
     * @paramid
     */
    @Override
    public boolean deleteByIds(String ids) {
        return userDao.deleteByPrimaryKeys(ids);
    }


    @Override
    public List<Map<String, Object>> selectAllUserByIdentity(int identity) {
        return userDaoImpl.selectAllUserByIdentity(identity);
    }
}
