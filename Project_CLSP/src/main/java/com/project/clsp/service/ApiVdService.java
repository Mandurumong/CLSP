package com.project.clsp.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.project.clsp.dao.IApiVdRepository;

@Service
public class ApiVdService implements IApiVdService{
	
	@Autowired(required = true)
	IApiVdRepository apiVdRepository;
	

	   @Override
	   public String callApi(String serviceKey) {
	         URL url = null;
	         String readLine = null;
	         StringBuilder buffer = null;
	         BufferedReader bufferedReader = null;
	         BufferedWriter bufferedWriter = null;
	         HttpURLConnection urlConnection = null;

	         int connTimeout = 5000;
	         int readTimeout = 3000;

	         String apiUrl = "http://apis.data.go.kr/B551014/SRVC_TODZ_VDO_PKG/TODZ_VDO_ROUTINE_I?serviceKey=" + serviceKey
	               + "&pageNo=1&numOfRows=100&resultType=JSON&trng_aim_nm=%EB%8B%B9%EB%87%A8";

	         try {
	            url = new URL(apiUrl);
	            urlConnection = (HttpURLConnection) url.openConnection();
	            urlConnection.setRequestMethod("GET");
	            urlConnection.setConnectTimeout(connTimeout);
	            urlConnection.setReadTimeout(readTimeout);
	            urlConnection.setRequestProperty("Accept", "application/json;");

	            buffer = new StringBuilder();
	            if (urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
	               bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
	               while ((readLine = bufferedReader.readLine()) != null) {
	                  buffer.append(readLine).append("\n");
	               }
	            } else {
	               buffer.append("code : ");
	               buffer.append(urlConnection.getResponseCode()).append("\n");
	               buffer.append("message : ");
	               buffer.append(urlConnection.getResponseMessage()).append("\n");
	            }
	         } catch (Exception ex) {
	            ex.printStackTrace();
	         } finally {
	            try {
	               if (bufferedWriter != null) {
	                  bufferedWriter.close();
	               }
	               if (bufferedReader != null) {
	                  bufferedReader.close();
	               }
	            } catch (Exception ex) {
	               ex.printStackTrace();
	            }
	         }

	         String bStr = buffer.toString();

	         System.out.println("result " + bStr);
	         String result = "";

	         try {

	            Gson gson = new Gson();
	               
	            Map<String, Object> map = gson.fromJson(bStr, Map.class);

	            System.out.println("map " + map);
	            
	            Map<String, Object> responseMap = (Map<String, Object>) map.get("response");
	            
	            System.out.println("responseMap " +responseMap);
	            Map<String, Object> bodyMap = (Map<String, Object>) responseMap.get("body");
	            Map<String, Object> itemsMap =  (Map<String, Object>) bodyMap.get("items");
	            List<Map<String, Object>> iListMap = (List<Map<String, Object>>) itemsMap.get("item");
	            
	            int listSize = iListMap.size();
	            //List<VdApiVO> vds = new ArrayList<>();
	            //System.out.println("RES " + iListMap);
	            
	            for(Map<String, Object> temp : iListMap) {
	               Map<String,Object> vd = new HashMap<>();
	               
	               vd.put("ttlNm", temp.get("vdo_ttl_nm").toString());
	               
	               vd.put("fileUrl", temp.get("file_url"));
	               vd.put("fileNm", temp.get("file_nm"));
	               vd.put("vdoDesc", temp.get("vdo_desc").toString());
	               vd.put("aggNm", temp.get("aggrp_nm").toString());
	               vd.put("aimNm", temp.get("trng_aim_nm").toString());
	               vd.put("tnm", temp.getOrDefault("trng_nm", "업독"));
	               vd.put("toolNm", temp.get("tool_nm").toString());
	               vd.put("fNm", temp.get("ftns_fctr_nm").toString());
	               vd.put("partNm",  map.getOrDefault("trng_part_nm", "전신"));
	               
	               // db에 저장
	               insertVd(vd);
	            }

	         } catch (Exception e) {
	            e.printStackTrace();
	         }

	         return result;
	   }

	@Override
	public int getVdsCount() {
		return apiVdRepository.getVdsCount();
	}

	@Override
	public List<Map<String, Object>> getVds(Map<String, Object> map) {
		return apiVdRepository.getVds(map);
	}

	@Override
	public void insertVd(Map<String, Object> vo) {
		apiVdRepository.insertVd(vo);
	}

	@Override
	public Map<String, Object> getVdDetail(int num) {
		return apiVdRepository.getVdDetail(num);
	}


}
