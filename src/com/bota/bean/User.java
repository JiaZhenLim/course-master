package com.bota.bean;

import java.util.Date;

public class User {
    private Long id;

    private Long usernumber;

    private String username;

    private String password;

    private Long majorid;

    private Long classid;

    private Long collegeid;

    private Integer credit;

    private Integer identity;

    private String imageurl;

    private Integer sex;

    private Date createtime;

    private String email;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUsernumber() {
        return usernumber;
    }

    public void setUsernumber(Long usernumber) {
        this.usernumber = usernumber;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Long getMajorid() {
        return majorid;
    }

    public void setMajorid(Long majorid) {
        this.majorid = majorid;
    }

    public Long getClassid() {
        return classid;
    }

    public void setClassid(Long classid) {
        this.classid = classid;
    }

    public Long getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(Long collegeid) {
        this.collegeid = collegeid;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getIdentity() {
        return identity;
    }

    public void setIdentity(Integer identity) {
        this.identity = identity;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl == null ? null : imageurl.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }


    @Override
	public String toString() {
		return "User [id=" + id + ", usernumber=" + usernumber + ", username=" + username + ", password=" + password
                + ", majorid=" + majorid+ ", classid=" + classid + ",collegeid=" + collegeid + ", credit=" + credit
                + ", identity=" + identity + ", imageurl=" + imageurl + ", sex=" + sex + ", createtime=" + createtime + ", email=" + email + "]";
	}
    
}