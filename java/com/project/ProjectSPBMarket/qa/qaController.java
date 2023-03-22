package com.project.ProjectSPBMarket.qa;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.ProjectSPBMarket.member.Member;
import com.project.ProjectSPBMarket.member.MemberService;
import com.project.ProjectSPBMarket.product.Product;

@Controller
public class qaController {

	@Autowired
	private qaService nService;
	@Autowired
	private MemberService mService;
	@Autowired
	private HttpSession session;

	// Q/A 작성 폼
	@GetMapping(value = "/qa/qa_writing")
	public void qaForm() {
	}

	// Q/A 작성
	@PostMapping(value = "/qa/qa_writing")
	public String insert(qa n) {
		String path = "redirect:/member/loginForm";
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			Member m = mService.getMember(user_id);
			if (m.getUser_type() == 1) {
				nService.addqa(n);
				path = "redirect:/qa/qa_board";
			}
		}
		return path;
	}

	// 컨텐츠로 이동
	@RequestMapping(value = "/qa/qa_contentView")
	public ModelAndView content(@RequestParam(value = "qa_num") int qa_num) {
		ModelAndView mav = new ModelAndView("/qa/qa_contentView");
		qa n = nService.selectqaByNum(qa_num);
		mav.addObject("n", n);
		nService.qaHits(qa_num);
		return mav;

	}

	// Q/A 전체 출력
	@RequestMapping(value = "/qa/qa_board")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/qa/qa_board");
		ArrayList<qa> list = (ArrayList<qa>) nService.selectAllqa();
		Collections.reverse(list);
		
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	
//	//컨텐트 뷰 손대는중
//	@RequestMapping("/qa/qa_contentview")
//	public void viewProduct(@RequestParam int qa_num, Model model) {
//		nService.editqaHit(qa_num);
//		Product p = nService.getqa(qa_num);
//		model.addAttribute("n", n);
//	}
	
	
	// Q/A 수정
	@RequestMapping(value = "/qa/qa_edit")
	public String edit(qa n) {
		nService.editqa(n);
		return "redirect:/qa/qa_board";
	}

	// Q/A 삭제
	@RequestMapping(value = "/qa/qa_delete")
	public String delete(@RequestParam(value = "qa_num") int qa_num) {
		nService.delete(qa_num);
		return "redirect:/qa/qa_board";
	}
}