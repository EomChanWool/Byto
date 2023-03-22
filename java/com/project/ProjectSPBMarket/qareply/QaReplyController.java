package com.project.ProjectSPBMarket.qareply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QaReplyController {

	@Autowired
	private QaReplyService rService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;

	@PostMapping("/qareply/add")
	public String addQaReply(QaReply r) {
		r.setUser_id((String) session.getAttribute("user_id"));
		rService.addQaReply(r);
		return "redirect:" + request.getHeader("REFERER") + "#qareply-" + rService.getSeqCurrval();
	}

	@PostMapping("/qareply/edit")
	public String editQaReply(QaReply r) {
		String user_id = (String) session.getAttribute("user_id");
		r.setUser_id(user_id);
		rService.editQaReply(r);
		return "redirect:" + request.getHeader("REFERER") + "#qareply-" + r.getQaReply_num();
	}

//	댓글 삭제
	@RequestMapping("/qareply/delete")
	public String deleteQaReply(@RequestParam int qareply_num) {
		String user_id = (String) session.getAttribute("user_id");
		QaReply r = rService.getQaReply(qareply_num);
		if (user_id.equals(r.getUser_id())) {
//			하위 댓글이 있을 때 내용을 null로 변경한다.
			if (r.getChild_qareply().size() != 0 || r.getParent_qareply_num() != -1) {
				rService.deleteParentQaReply(qareply_num);
			} else {
//				없을때에는 그냥 삭제
				rService.deleteQaReply(qareply_num);
			}
		}
		return "redirect:" + request.getHeader("REFERER");
	}

}
