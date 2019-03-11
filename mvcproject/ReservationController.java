package com.itbank.mvcproject;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import net.nurigo.java_sdk.api.Message;

/*
 * reservation controller
 */

@Controller
public class ReservationController {

	@Autowired
	@Qualifier("reservationdao")
	ReservationDAO dao;
	
	IamportClient client;
	String api_key = "1095723344987630";
	String api_secret = "pF20E1fK4cjOpD9S57MPI6S7T18ezS5Zx7Zc8fXdrg2RUcK0jwP2DIawKiLkaRjHYjU7yRk08nS2zC3T";
	
	@RequestMapping("reservation")
	public void reservation(ReservationDTO reservationDTO, Model model) throws Exception {
		System.out.println(reservationDTO.getUid());
		System.out.println(reservationDTO.getName());
		System.out.println(reservationDTO.getPrice());
		System.out.println(reservationDTO.getTel());
		
		/*String content = "호텔 이름: " + reservationDTO.gethName() + "\n" + 
				"상품 이름: " + reservationDTO.getName() + "\n" +  
				"상품 가격: " + reservationDTO.getPrice() + "\n" +
				"입실 날짜: " + reservationDTO.getInDay() + "\n" + 
				"퇴실 날짜: " + reservationDTO.getOutDay();
		
		String apiKey = "NCSSZ5PRPGLA3WD4";
		String apiSecret = "B4CIVVODWRF2NSFA6UP3CA3OIO36OZNB";

		Message message = new Message(apiKey, apiSecret);
		
		HashMap<String, String> params = new HashMap<>();
		
		//	정보 설정
		//	수신 번호
		params.put("to", reservationDTO.getTel());
		//	발신 번호
		params.put("from", "010-5102-2003");
		//	문자 타입
		params.put("type", "LMS");
		//	문자 내용
		params.put("text", content);
		//	앱 버전
		params.put("app_version", "test app 1.2");
		
		//	문자 전송
		JSONObject obj = message.send(params);
		
		System.out.println(obj.get("success_count"));*/
		
		model.addAttribute("reservationInfo", reservationDTO);
		dao.insert(reservationDTO);
	}
	
	@RequestMapping("paySearch")
	public void search(String id, Model model) throws Exception {
		List<ReservationDTO> list = dao.search(id);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("cancle")
	public String cancle(String imp_uid) throws Exception {
		client = new IamportClient(api_key, api_secret);
		String uid = imp_uid;
		System.out.println(uid);
		CancelData cancelData = new CancelData(uid, true);
		
		try {
			IamportResponse<Payment> cancle = client.cancelPaymentByImpUid(cancelData);
			
			if(cancle.getResponse() == null) {
				System.out.println("이미 결제 취소된 상품입니다.");
				return "cancle2";
			} else {
				dao.update(imp_uid);
				System.out.println("환불 완료");
			}
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			switch (e.getHttpStatusCode()) {
			case 401:
				System.out.println("401 에러");
				break;
			case 404:
				System.out.println("거래 내역이 존재하지 않습니다.");
			case 500:
				System.out.println("500 에러");
				break;
			}
		} catch (Exception e) {
			
		}
		return "cancle";
	}
	
	@RequestMapping("test")
	public void test(String hName, String name, Model model) throws Exception {
		
		System.out.println(hName);
		System.out.println(name);
		HashMap<String, Object> map = new HashMap<>();
		map.put("hName", URLDecoder.decode(hName, "UTF-8"));
		map.put("name", name);
		
		
		List<ReservationDTO> list = dao.select(map);
		ReservationDTO dto = null;
		
		for(int i = 0; i < list.size(); i++) {
			dto = list.get(i);
			System.out.println(dto.getComplete());
		}
		
		model.addAttribute("list", list);
	}
}
