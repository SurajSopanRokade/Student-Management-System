package com.proj.dao;

import java.util.List;

import com.proj.model.UserInfo;

public interface Userinfodao {
	void saveUserInfo(UserInfo c);
	void updateUserInfo(UserInfo c);
	void deleteUserInfo(int id);
	UserInfo searchUserInfoById(int id);
	int Login(UserInfo c);
	int getUserid(UserInfo c);
}
