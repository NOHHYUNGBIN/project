package view;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;
import java.awt.SystemColor;
import javax.swing.UIManager;

import model.UserDao;

import javax.swing.JOptionPane;
import java.awt.Toolkit;
import javax.swing.ImageIcon;

public class Menu extends JFrame implements ActionListener {
	JButton res, confirm, logout;
	JLabel lblName;
	String userid;

	public Menu() {
		initComponent();
	}
	
	public Menu(String userid) {
		this.userid = userid;
		setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
		
		initComponent();
	}

	private void initComponent() {
		setBackground(new Color(240, 255, 240));
		getContentPane().setBackground(new Color(240, 255, 240));
		getContentPane().setLayout(null);

		res = new JButton("예매하기");
		res.setForeground(new Color(0, 0, 0));

		res.setBackground(new Color(255, 255, 255));
		res.setFont(new Font("맑은 고딕", Font.BOLD, 30));
		res.setBounds(78, 105, 198, 56);
		getContentPane().add(res);

		res.addActionListener(this);

		confirm = new JButton("예매확인");
		confirm.setBackground(new Color(255, 255, 255));

		confirm.setForeground(new Color(0, 0, 0));
		confirm.setFont(new Font("맑은 고딕", Font.BOLD, 30));
		confirm.setBounds(78, 213, 198, 56);
		getContentPane().add(confirm);

		confirm.addActionListener(this);

		logout = new JButton("로그아웃");
		logout.setForeground(new Color(0, 0, 0));
		logout.setBackground(new Color(255, 255, 255));

		logout.setFont(new Font("맑은 고딕", Font.BOLD, 30));
		logout.setBounds(78, 321, 198, 56);
		getContentPane().add(logout);
		
		lblName = new JLabel("New label");
		lblName.setFont(new Font("휴먼둥근헤드라인", Font.PLAIN, 15));
		lblName.setBounds(0, 0, 140, 30);
		UserDao udao = new UserDao();
		String name = udao.getName(userid);
		lblName.setText(name+"님");
		getContentPane().add(lblName);

		logout.addActionListener(this);

		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		this.setSize(380, 550);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		switch (e.getActionCommand()) {
		case "예매하기":
			this.dispose();
			new MovieProc(userid);
			break;
		case "예매확인":
			this.dispose();
			new RsList(userid);
			break;
		case "로그아웃":
			int yesOrNo = JOptionPane.showConfirmDialog(null, "로그아웃 하시겠습니까?", "GGV message", JOptionPane.YES_NO_OPTION);
			if (yesOrNo == 0) {
				this.dispose();
				new UserLogin();
			}
			break;

		}

	}
}
