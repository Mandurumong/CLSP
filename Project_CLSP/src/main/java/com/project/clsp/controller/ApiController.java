package com.project.clsp.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.clsp.model.PagingDto;
import com.google.gson.Gson;
import com.project.clsp.service.IApiVdService;

@Controller
public class ApiController {
	
	private final String SERVICE_KEY = "SCA7jGhmOIIL5UNxX3XARle%2B59QYe5WeO0%2FikHf9HfP5A2ydTI6uSlVSK0xzC%2FikEnTOZOeMBJTgW7%2B71FVN7Q%3D%3D";
	
	@Autowired
	IApiVdService vdService;
	
	@RequestMapping("/api/prevent")
	public String prevent(Model model) {
		
		int cnt = vdService.getVdsCount();
		Map<String, Object>map = new HashMap<>();
		PagingDto paging = new PagingDto(cnt, 1, 3);
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		
		List<Map<String, Object>> list = vdService.getVds(map);
		
		model.addAttribute("list", list);
		
		return "prevention/prevention";
	}
	
	@RequestMapping("/api/video")
	public String apiView(@RequestParam int num, Model model) {
		Map<String, Object> map = vdService.getVdDetail(num);
		
		model.addAttribute("video", map);
		
		
		return "prevention/videoView";
	}
	
	@RequestMapping("/api/video/list")
	public String apiVideoList(	Model model) {
		
		int cnt = vdService.getVdsCount();
		Map<String, Object> map = new HashMap<>();
		PagingDto paging = new PagingDto(cnt, 1, 50);
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		
		List<Map<String,Object>> list = vdService.getVds(map);
		
		model.addAttribute("list", list);
		
		return "prevention/videoList";
	}

	
	@RequestMapping("/api/ajax/video")
	@ResponseBody
	public Map<String, Object> getApiVideo(@RequestParam(required=false, defaultValue ="1") int page) {
		int cnt = vdService.getVdsCount();
		Map<String, Object> map = new HashMap<>();
		System.out.println("cnt " + cnt);
		PagingDto paging = new PagingDto(cnt, page, 10);
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		System.out.println("paging " + paging);
		List<Map<String,Object>> list = vdService.getVds(map);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("paging", paging);
		resultMap.put("result", true);
		
		return resultMap;
	}
	
	@RequestMapping("/api/view")
	public String videoView() {
		return "db";
	}
	
	
	@RequestMapping("/api/call")
	@ResponseBody
	public String handlerApi() {
		return callApi();
	}

	public String callApi() {

		URL url = null;
		String readLine = null;
		StringBuilder buffer = null;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		HttpURLConnection urlConnection = null;

		int connTimeout = 5000;
		int readTimeout = 3000;

		String apiUrl = "http://apis.data.go.kr/B551014/SRVC_TODZ_VDO_PKG/TODZ_VDO_ROUTINE_I?serviceKey=" + SERVICE_KEY
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

			

			Map<String, Object> responseMap = (Map<String, Object>) map.get("response");
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
				
				vdService.insertVd(vd);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
}
