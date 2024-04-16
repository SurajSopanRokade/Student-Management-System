package com.proj.dao;

import java.util.List;

import com.proj.model.Courses;
import com.proj.model.UserInfo;

public interface Coursedao {
	void saveCourses(Courses c);
	void updateCourses(Courses c);
	void deleteCourses(int id);
	UserInfo searchCoursesById(int id);
}
