package com.bota.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bota.bean.User;
import com.bota.service.ClassService;
import com.bota.service.CollegeService;
import com.bota.service.CourseService;
import com.bota.service.MajorService;
import com.bota.service.UserService;
import com.bota.util.DateStrConvert;
import com.bota.util.Dictionary;
import com.bota.util.FileUtil;
import com.bota.util.MapAction;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ClassService classService;

    @Autowired
    private CollegeService collegeService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private CourseService courseService;

    /**√
     * 登陆验证，账号密码正确，跳转到个人中心页面，用户信息传入session
     * @param user
     * @param session
     * @return String
     */
    @RequestMapping("login")
    @ResponseBody
    public String loginPage(User user, HttpSession session) {
        //获取该用户名的数据库信息
//        User dbUser = userService.selectUserByUserNumber(user.getUsernumber());
        Map<String, Object> dbUser = userService.selectUserByUserNumber(user.getUsernumber());

        //校验用户名和密码，返回状态码
        String result = userService.verifyByUser(user, dbUser);
        if(result.equals(Dictionary.S_SUCCESS)){
            session.setAttribute("user", dbUser);
        }
        return result;
    }

    /**
     * 退出登陆状态
     */
    @RequestMapping("exit")
    public void exit(HttpSession session, SessionStatus sessionStatus, HttpServletResponse response) throws IOException {
        session.invalidate();
        sessionStatus.setComplete();//最后是调用sessionStatus方法
        response.sendRedirect("indexPage.do");
    }



    /**
     * 跳转到我的信息页面
     */
    @RequestMapping("myselfPage")
    public String myselfPage() {
        return "personalCenter/myself";
    }

    /**
     * 跳转到主页
     */
    @RequestMapping("indexPage")
    public String indexPage(){
        return "index";
    }

    /**
     * 根据活动查询所有的学生的id
     */
    @RequestMapping("studentsCourseSelection.do")
    public List<Map<String, Object>> studentsCourseSelection(long courseId) {
        return userService.studentsCourseSelection(courseId);
    }

    /**
     * 跳转到修改密码页面
     */
    @RequestMapping("updatePwdPage")
    public String updatePwdPage() {
        return "personalCenter/updatePwd";
    }


    @RequestMapping("updatePwd")
    @ResponseBody
    public Map<String, Object> updatePwd(MapAction mapVo, HttpSession session) {
        //获取用户信息和输入的新旧密码
        Map<String, Object> resultMap = new HashMap();
        Map<String, Object> map = mapVo.getMapVo();
        String oldPwd = map.get("oldPwd").toString();
        @SuppressWarnings("unchecked")
        Map<String, Object> user = (Map<String, Object>)session.getAttribute("user");

        //验证是否密码正确
        if (!user.get("password").equals(oldPwd)) {
            resultMap.put("status", Dictionary.S_PWD_ERR);
            resultMap.put("message", "原密码错误！");
        } else {
            map.put("id", user.get("id"));
            map.remove("oldPwd");
            boolean result = userService.updatePwd(map);
            if (result) {
                resultMap.put("status", Dictionary.S_SUCCESS);
                resultMap.put("message", "修改成功！");
                user.put("password", map.get("newPwd"));
            } else {
                resultMap.put("status", Dictionary.S_FAIL);
                resultMap.put("message", "修改失败！");
            }
        }
        return resultMap;
    }


    /**
     * 修改头像页面
     */
    @RequestMapping("updateHeadImagePage")
    public String updateHeadImagePage() {
        return "personalCenter/updateHeadImage";
    }

    /**
     * 上传图片
     */
    @RequestMapping("updateHeadImage")
    public void updateHeadImage(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //获取session的值来获取user信息
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");

        String id = userMap.get("id").toString();
        //upload/2/2.jpg
        String imageUrl = FileUtil.upload(request, "upload", id);
        User user = new User();
        user.setId(Long.parseLong(id));
        user.setImageurl(imageUrl);
        if (userService.updateUserById(user)) {
            session.setAttribute("message", "修改成功！");
            userMap.put("imageUrl", imageUrl);
            session.setAttribute("user", userMap);
        } else {
            session.setAttribute("error", "修改失败！");
        }
        response.sendRedirect("myselfPage.do");
    }

    /**
     * 添加用户
     */
    @RequestMapping("addUser")
    @ResponseBody
    public boolean addUser(User user, String createTime) {
        Date date = DateStrConvert.strToDate(createTime, "yyyy-MM-dd");
        if (user.getIdentity() != 1) {//如果用户不是组织社团管理员，就不要给他设置组织社团
            user.setClassid(null);
            user.setMajorid(null);
        }

        user.setCreatetime(date);
        user.setImageurl("images/2.jpg");//默认图片地址
        System.out.println(user);
        return userService.addUser(user);
    }


    /**
     * 添加用户页面
     *
     * @return
     */
    @RequestMapping("addUserPage")
    public String addUserPage(HttpServletRequest request) {
        List<Map<String, Object>> listMap = collegeService.selectAllCollege();
        request.setAttribute("college", listMap);
        List<Map<String, Object>> listMap1 = classService.selectAllClasses();
        request.setAttribute("classes", listMap1);
        List<Map<String, Object>> listMap2 = majorService.selectAllMajor();
        request.setAttribute("major", listMap2);
        return "user/addUser";
    }


    /***
     * 修改用户页面
     *
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("editUserPage")
    public String editUserPage(long id, HttpServletRequest request) {
        User user = userService.selectOne(id);
        if (user.getIdentity() == 2) {
            List<Map<String, Object>> listMap = collegeService.selectAllCollege();
            request.setAttribute("college", listMap);
        } else if (user.getIdentity() == 1) {
            List<Map<String, Object>> listMap1 = majorService.selectAllMajor();
            request.setAttribute("major", listMap1);
            List<Map<String, Object>> listMap2 = classService.selectAllClasses();
            request.setAttribute("classes", listMap2);
        }
        request.setAttribute("user", user);
        return "user/editUser";
    }

    /**
     * 查询所有的用户
     *
     * @return
     */
    @RequestMapping("userList")
    @ResponseBody
    public List<Map<String, Object>> selectAllUser() {
        return userService.selectAllUser();
    }

    /**
     * 分页查询所有的用户（管理员打开的页面）
     * @return
     */
    @RequestMapping("userListBySearch")
    public ModelAndView selectAllUsers(int pageNum, int pageSize, String identity, String search, String collegeid) {/*
    public ModelAndView selectAllUsers(int pageNum, int pageSize, String identity, String search, String classid, String collegeid) {*/
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("identity", identity);
        paramMap.put("search", search);
        /*if (!classid.equals("-1")) {
            paramMap.put("classid", classid);
            paramMap.put("collegeid", collegeid);
        }*/
        if (!collegeid.equals("-1")) {
            paramMap.put("collegeid", collegeid);
        }
        ModelAndView model = new ModelAndView();
        Map<String, Object> map = userService.selectAllUser(pageNum, pageSize, paramMap);
        model.addObject("users", map.get("listMap"));
        /*model.addObject("classes", classService.selectAllClasses());*/
        model.addObject("college", collegeService.selectAllCollege());


        if (map.get("count") != null) {
            int count = Integer.parseInt(map.get("count").toString());
            int totalPage = 0;
            if (count % 10 != 0) {
                totalPage = count / 10 + 1;
            } else {
                totalPage = count / 10;
            }
            model.addObject("count", count);
            model.addObject("totalPage", totalPage);
        }
        model.addObject("pageNum", pageNum);
        if (paramMap != null) {
            model.addObject("search", paramMap.get("search"));
            model.addObject("identity", paramMap.get("identity"));
           /* model.addObject("classid", paramMap.get("classid"));*/
            model.addObject("collegeid", paramMap.get("collegeid"));
        }
        model.setViewName("user/user");
        return model;
    }


    @RequestMapping("userListByPage")
    public String selectAllUser(int pageNum, int pageSize, String identity, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("identity", identity);
        Map<String, Object> map = userService.selectAllUser(pageNum, pageSize, paramMap);
        request.setAttribute("users", map.get("listMap"));
        request.setAttribute("classes", classService.selectAllClasses());

        if (map.get("count") != null) {
            int count = Integer.parseInt(map.get("count").toString());
            int totalPage = 0;
            if (count % 10 != 0) {
                totalPage = count / 10 + 1;
            } else {
                totalPage = count / 10;
            }
            request.setAttribute("count", count);
            request.setAttribute("totalPage", totalPage);
        }
        request.setAttribute("identity", identity);
        request.setAttribute("pageNum", pageNum);
        return "user/user";
    }

    /**
     * 老师打开的页面
     *
     * @param pageNum   页码
     * @param pageSize  每页显示数量
     * @param teacherId 老师id
     * @param request
     * @return
     */
    @RequestMapping("studentListByPage")
    public String selectAllStudent(int pageNum, int pageSize, long teacherId, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap();
        paramMap.put("teacherId", teacherId);
        commonExecute(pageNum, pageSize, paramMap, request);
        return "user/user";
    }

    /**
     * 老师搜索的页面
     *
     * @param pageNum   页码
     * @param pageSize  每页显示数量
     * @param teacherId 老师id
     * @param courseId  活动id
     * @param request
     * @return
     */
    @RequestMapping("studentListBySearch")
    public String selectAllStudentBySearch(int pageNum, int pageSize, long teacherId, long courseId, String search, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("teacherId", teacherId);
        if (courseId != -1) {
            paramMap.put("courseId", courseId);
        }
        paramMap.put("search", search);
        request.setAttribute("search", search);
        request.setAttribute("courseId", courseId);
        commonExecute(pageNum, pageSize, paramMap, request);
        return "user/user";
    }

    /**
     * 公共方法
     *
     * @param pageNum  页码
     * @param pageSize 每页显示数量
     * @param paramMap 条件map
     * @param request
     * @return
     */
    public void commonExecute(int pageNum, int pageSize, Map<String, Object> paramMap, HttpServletRequest request) {
        Map<String, Object> map = userService.selectAllUser(pageNum, pageSize, paramMap);
        request.setAttribute("users", map.get("listMap"));
        request.setAttribute("classes", classService.selectAllClasses());

        long teacherId = Long.parseLong(paramMap.get("teacherId").toString());
        request.setAttribute("courses", courseService.selectCourseByTeacherId(teacherId));

        if (map.get("count") != null) {
            int count = Integer.parseInt(map.get("count").toString());
            int totalPage = 0;
            if (count % 10 != 0) {
                totalPage = count / 10 + 1;
            } else {
                totalPage = count / 10;
            }
            request.setAttribute("count", count);
            request.setAttribute("totalPage", totalPage);
        }
        request.setAttribute("teacherId", teacherId);
        request.setAttribute("pageNum", pageNum);
    }

    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    @RequestMapping("selectUser")
    @ResponseBody
    public User selectOne(long id) {
        return userService.selectOne(id);
    }


    /**
     * 修改用户的信息
     *
     * @return
     * @paramUser
     */
    @RequestMapping("editUser")
    @ResponseBody
    public boolean updateById(User user, String createTime) {
        Date date = DateStrConvert.strToDate(createTime, "yyyy-MM-dd");
        user.setCreatetime(date);
        return userService.updateById(user);
    }

    /**
     * 根据id删除用户
     *
     * @return
     * @paramid
     */
    @RequestMapping("deleteUser")
    @ResponseBody
    public boolean deleteById(long id) {
        return userService.deleteById(id);
    }

    /**
     * 根据ids批量删除用户
     *
     * @param ids
     * @return
     */
    @RequestMapping("deleteManyUsers")
    @ResponseBody
    public boolean deleteById(String ids) {
        return userService.deleteByIds(ids);
    }


    @RequestMapping("enterGradePage")
    public String enterGradePage(int pageNum, int pageSize, int teacherId, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("teacherId", teacherId);
        commonExecute(pageNum, pageSize, paramMap, request);
        return "user/enterGrade";
    }


    /**
     * 老师搜索的页面
     *
     * @param pageNum   页码
     * @param pageSize  每页显示数量
     * @param teacherId 老师id
     * @param courseId  活动id
     * @param request
     * @return
     */
    @RequestMapping("studentListBySearchGradePage")
    public String selectAllStudentBySearchGradePage(int pageNum, int pageSize, long teacherId, long courseId, String search, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("teacherId", teacherId);
        if (courseId != -1) {
            paramMap.put("courseId", courseId);
        }
        paramMap.put("search", search);
        request.setAttribute("search", search);
        request.setAttribute("courseId", courseId);
        commonExecute(pageNum, pageSize, paramMap, request);
        return "user/enterGrade";
    }
}
