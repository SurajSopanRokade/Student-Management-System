package com.proj.dao;

import com.proj.model.Grade;
import com.proj.model.UserInfo;

public interface Gradedao {
	void updateGrade(Grade g);
	int getUserid1(UserInfo c);
	int getInstructorid(int id);
	void insertGrade(Grade g);
}
