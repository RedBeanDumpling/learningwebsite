package com.dao;
import java.util.*;

import com.bean.Message;


public interface MessageDAO {
	List<Message> selectAll(HashMap map);
	void add(Message message);
	void update(Message message);
	Message findById(int id);
	void delete(int id);
}
