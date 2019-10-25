package com.spring.bm.connection.model.service;

import java.util.List;
import java.util.Map;

public interface ConnectionService {
   
   int selectConnCount();
   List<Map<String,String>> selectConnList(int cPage, int numPerPage);
   
   List<Map<String,String>> selectStfMainCateg();
   
   int searchDisCon(Map<String,String> param);
   int searchCon(Map<String,String> param);
   
   int enrollConn(Map<String,String> param) throws Exception;
   
   Map<String,String> selectConnection(int conCode);
   String selectThisMainCateg(int conCode);
   Map<String,String> selectTransferInfo(int conCode);
   
   int modifyConn(Map<String,String> param) throws Exception;
   
   int deleteConn(int conCode);
   
   List<Map<String,String>> selectConnSearchList(Map<String, Object> m);
   int selectConnSearchCount(Map<String, Object> m);

}