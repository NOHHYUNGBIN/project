package view;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import java.awt.Font;
import javax.swing.SwingConstants;

import model.ResDao;
import model.ResVo;
import java.awt.Color;
import java.awt.Toolkit;

public class CheckReserve extends JFrame implements ActionListener {

	JLabel lbnum, lbcinema, lbtheater, lbdate, lbperson, lbseat, title, resNum, mName, cName, rDate, lbpCnt, rSeat,
			Screen1, screen;
	JButton confirm, cancel;
	int rcode, pcode, pCnt;
	ArrayList<String> seatss;
	String seat = "", userid, cname, mname, pdate;
	ResVo rvo;
	ResDao rDao;

	public CheckReserve() {

		initComponent();

	}

	public CheckReserve(String userid, int rcode, int pcode, int pCnt, ArrayList<String> seats) {
		this.userid = userid;
		this.rcode = rcode;
		this.pcode = pcode;
		this.pCnt = pCnt;
		seatss = new ArrayList<String>();
		for (int i = 0; i < seats.size(); i++) {

			this.seatss.add(seats.get(i));
		}
		setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
		getContentPane().setBackground(new Color(240, 255, 240));
		initComponent();
	}

	private void initComponent() {
		getContentPane().setLayout(null);

		rDao = new ResDao();

		title = new JLabel("예 매 확 인");
		title.setHorizontalAlignment(SwingConstants.CENTER);
		title.setFont(new Font("맑은 고딕", Font.BOLD, 26));
		title.setBounds(74, 16, 216, 62);
		getContentPane().add(title);

		lbnum = new JLabel("• 예매번호");
		lbnum.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbnum.setBounds(13, 88, 90, 30);
		getContentPane().add(lbnum);

		JLayeredPane layeredPane = new JLayeredPane();
		layeredPane.setBounds(109, 36, 1, 1);
		getContentPane().add(layeredPane);

		lbcinema = new JLabel("• 관람극장");
		lbcinema.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbcinema.setBounds(13, 138, 90, 30);
		getContentPane().add(lbcinema);

		lbtheater = new JLabel("• 관람영화");
		lbtheater.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbtheater.setBounds(13, 188, 90, 30);
		getContentPane().add(lbtheater);

		lbdate = new JLabel("• 관람일시");
		lbdate.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbdate.setBounds(13, 288, 90, 30);
		getContentPane().add(lbdate);

		lbperson = new JLabel("• 관람인원");
		lbperson.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbperson.setBounds(12, 338, 90, 30);
		getContentPane().add(lbperson);

		lbseat = new JLabel("• 관람좌석");
		lbseat.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbseat.setBounds(12, 388, 90, 30);
		getContentPane().add(lbseat);

		resNum = new JLabel("resNum");
		resNum.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		resNum.setBounds(117, 88, 140, 30);
		getContentPane().add(resNum);

		mName = new JLabel("mName");
		mName.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		mName.setBounds(117, 138, 120, 30);
		getContentPane().add(mName);

		cName = new JLabel("cName");
		cName.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		cName.setBounds(117, 188, 120, 30);
		getContentPane().add(cName);

		rDate = new JLabel("rDate");
		rDate.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		rDate.setBounds(116, 288, 120, 30);
		getContentPane().add(rDate);

		lbpCnt = new JLabel("pCnt");
		lbpCnt.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		lbpCnt.setBounds(116, 338, 120, 30);
		getContentPane().add(lbpCnt);

		rSeat = new JLabel("rSeat");
		rSeat.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		rSeat.setBounds(116, 388, 236, 30);
		getContentPane().add(rSeat);

		confirm = new JButton("확인");
		confirm.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		confirm.setBackground(new Color(255, 255, 255));
		confirm.setBounds(63, 430, 105, 36);
		getContentPane().add(confirm);
		confirm.addActionListener(this);

		cancel = new JButton("예매취소");
		cancel.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		cancel.setBackground(new Color(255, 255, 255));
		cancel.setBounds(199, 430, 105, 36);
		getContentPane().add(cancel);
		cancel.addActionListener(this);

		Screen1 = new JLabel("• 상영관");
		Screen1.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		Screen1.setBounds(13, 238, 90, 30);
		getContentPane().add(Screen1);
		
		screen = new JLabel((String) null);
		screen.setFont(new Font("맑은 고딕", Font.BOLD, 16));
		screen.setBounds(117, 238, 120, 30);
		getContentPane().add(screen);

		rvo = rDao.getPData(pcode);
		resNum.setText(String.valueOf(rcode));
		mName.setText(rvo.getmName());
		cName.setText(rvo.getcName());
		rDate.setText(rvo.getpDate());
		screen.setText(rvo.getrScreen());
		
		lbpCnt.setText(String.valueOf(pCnt));
		for (int i = 0; i < seatss.size(); i++) {
			seat += seatss.get(i) + " ";
		}
		rSeat.setText(seat);


		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		this.setSize(380, 550);
		this.setVisible(true);
		this.setLocationRelativeTo(null);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		switch (e.getActionCommand()) {
		case "확인":
			this.dispose();
			new Menu(userid);
			break;

		case "예매취소":
			int yesOrNo = JOptionPane.showConfirmDialog(null, "정말로 취소 하시겠습니까?", "GGV message",
					JOptionPane.YES_NO_OPTION);
			if (yesOrNo == 0) {
				JOptionPane.showMessageDialog(null, "취소가 완료 되었습니다.\n 메뉴화면으로 이동합니다.", "예메취소",
						JOptionPane.INFORMATION_MESSAGE);
				this.dispose();
				ResDao rdao = new ResDao();
				rdao.deleteRes(rcode);
				this.dispose();
				new Menu(userid);
			}
			break;
		}

	}
}