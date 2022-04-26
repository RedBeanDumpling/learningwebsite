package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Studyrecord;


public interface StudyrecordDAO {
	List<Studyrecord> selectAll(HashMap map);
	void add(Studyrecord studyrecord);
}
