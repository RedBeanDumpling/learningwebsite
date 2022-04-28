package com.dao;
import java.util.*;

import com.bean.Activity;
import com.bean.Zuoye;


public interface ZuoyeDAO {
    Zuoye findZuoyeById(int id);

    List<Zuoye> selectAll(HashMap map);
	void add(Zuoye zuoye);
	void delete(int id);
}
