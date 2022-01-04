package view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Iterator;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import model.UserDao;
import model.UserVo;
import javax.swing.DefaultComboBoxModel;
import java.awt.Toolkit;

public class UserProc extends JFrame implements ActionListener {

	private JLabel lblUserProc, lblId, lblPwd, lblName, lblBirth, lblPhone, lbl_1, lbl_2;
	private JTextField txtId, txtName;
	private JPasswordField txtPwd;
	private JFormattedTextField txtPhone1, txtPhone2, txtPhone3;
	private JButton inSert, canCel;
	private JComboBox year, month, day;
	private JLabel lyear, lmonth, lday;
	private boolean flag = false;

	public UserProc() {
		setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
		getContentPane().setBackground(new Color(240, 255, 240));
		getContentPane().setLayout(null);
		setResizable(false);

		lblUserProc = new JLabel("회 원 가 입");
		lblUserProc.setFont(new Font("맑은 고딕", Font.BOLD, 30));
		lblUserProc.setBounds(188, 10, 162, 54);
		getContentPane().add(lblUserProc);

		lblId = new JLabel("아이디");
		lblId.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		lblId.setBounds(12, 84, 121, 45);
		getContentPane().add(lblId);

		txtId = new JTextField();
		txtId.setFont(new Font("굴림", Font.PLAIN, 18));
		txtId.setToolTipText("아이디를 입력하세요.");
		txtId.setBounds(132, 84, 387, 45);
		getContentPane().add(txtId);
		txtId.setColumns(10);

		lblPwd = new JLabel("비밀번호");
		lblPwd.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		lblPwd.setBounds(12, 173, 121, 45);
		getContentPane().add(lblPwd);

		lblName = new JLabel("이름");
		lblName.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		lblName.setBounds(12, 228, 121, 45);
		getContentPane().add(lblName);

		lblBirth = new JLabel("생년월일");
		lblBirth.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		lblBirth.setBounds(12, 310, 121, 45);
		getContentPane().add(lblBirth);

		lblPhone = new JLabel("전화번호");
		lblPhone.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		lblPhone.setBounds(12, 365, 121, 45);
		getContentPane().add(lblPhone);

		txtName = new JTextField();
		txtName.setFont(new Font("굴림", Font.PLAIN, 18));
		txtName.setFocusTraversalKeysEnabled(false);
		txtName.setToolTipText("이름을 입력하세요.");
		txtName.setColumns(10);
		txtName.setBounds(132, 228, 387, 45);
		getContentPane().add(txtName);

		inSert = new JButton("가입");
		inSert.setBackground(Color.WHITE);
		inSert.setFont(new Font("맑은 고딕", Font.BOLD, 26));
		inSert.setBounds(71, 420, 157, 69);
		getContentPane().add(inSert);
		inSert.addActionListener(this);

		canCel = new JButton("취소");
		canCel.setBackground(Color.WHITE);
		inSert.setBackground(new Color(255, 255, 255));
		canCel.setFont(new Font("맑은 고딕", Font.BOLD, 26));
		canCel.setBounds(313, 420, 157, 69);
		getContentPane().add(canCel);
		canCel.addActionListener(this);

		txtPwd = new JPasswordField();
		txtPwd.setFont(new Font("굴림", Font.PLAIN, 18));
		txtPwd.setToolTipText("비밀번호를 입력하세요.");
		txtPwd.setBounds(132, 173, 387, 45);
		getContentPane().add(txtPwd);

		txtPhone1 = new JFormattedTextField();
		txtPhone1.setFont(new Font("굴림", Font.PLAIN, 18));
		txtPhone1.setColumns(10);
		txtPhone1.setBounds(132, 365, 106, 45);
		getContentPane().add(txtPhone1);

		txtPhone2 = new JFormattedTextField();
		txtPhone2.setFont(new Font("굴림", Font.PLAIN, 18));
		txtPhone2.setColumns(10);
		txtPhone2.setBounds(269, 365, 112, 45);
		getContentPane().add(txtPhone2);

		txtPhone3 = new JFormattedTextField();
		txtPhone3.setFont(new Font("굴림", Font.PLAIN, 18));
		txtPhone3.setColumns(10);
		txtPhone3.setBounds(413, 365, 106, 45);
		getContentPane().add(txtPhone3);

		lbl_1 = new JLabel("-");
		lbl_1.setFont(new Font("맑은 고딕", Font.BOLD, 24));
		lbl_1.setBounds(250, 362, 19, 45);
		getContentPane().add(lbl_1);

		lbl_2 = new JLabel("-");
		lbl_2.setFont(new Font("맑은 고딕", Font.BOLD, 24));
		lbl_2.setBounds(393, 362, 19, 45);
		getContentPane().add(lbl_2);

		txtPhone1.addKeyListener(new KeyAdapter() {
			public void keyTyped(KeyEvent ke) {
				JTextField scr = (JTextField) ke.getSource();
				if (scr.getText().length() >= 3)
					ke.consume();
			}
		});

		txtId.addKeyListener(new KeyAdapter() {
			public void keyTyped(KeyEvent ke) {
				JTextField scr = (JTextField) ke.getSource();
				if (scr.getText().length() >= 15)
					ke.consume();
			}
		});
		txtPhone2.addKeyListener(new KeyAdapter() {
			public void keyTyped(KeyEvent ke) {
				JTextField scr = (JTextField) ke.getSource();
				if (scr.getText().length() >= 4)
					ke.consume();
			}
		});
		txtPhone3.addKeyListener(new KeyAdapter() {
			public void keyTyped(KeyEvent ke) {
				JTextField scr = (JTextField) ke.getSource();
				if (scr.getText().length() >= 4)
					ke.consume();
			}
		});
		year = new JComboBox();
		for (int i = 2021; i > 1921; i--) {
			year.addItem(i);
		}
		year.setBounds(132, 314, 106, 41);
		getContentPane().add(year);

		month = new JComboBox();
		for (int i = 1; i < 13; i++) {
			String fmt = "%02d";
			month.addItem(String.format(fmt, i));
		}
		month.setBounds(269, 314, 112, 41);
		getContentPane().add(month);

		month.addActionListener(this);

		day = new JComboBox();
		for (int i = 1; i < 32; i++) {
			String fmt = "%02d";
			day.addItem(String.format(fmt, i));
		}
		day.setBounds(413, 314, 106, 41);
		getContentPane().add(day);

		JLabel lblNewLabel = new JLabel("※아이디는 영문 또는 숫자(15자 이하)만 입력가능합니다.");
		lblNewLabel.setBounds(132, 130, 348, 33);
		getContentPane().add(lblNewLabel);

		JLabel lblNewLabel_1 = new JLabel("※이름은 한글만 입력 가능합니다.");
		lblNewLabel_1.setBounds(132, 272, 348, 33);
		getContentPane().add(lblNewLabel_1);

		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		this.setSize(555, 550);
		this.setVisible(true);
		this.setLocationRelativeTo(null);

	}

	private boolean insertUser() {
		UserDao uDao = new UserDao();
		UserVo user = getViewDate();
		String result = uDao.insertUser(user);
		boolean check;
		if (result.indexOf("중복") == 0) {
			check = false;
		} else
			check = true;
		JOptionPane.showMessageDialog(null, result, "GGV message", JOptionPane.INFORMATION_MESSAGE);
		return check;
	}

	private UserVo getViewDate() {

		String userId = this.txtId.getText().trim();
		String userPwd = this.txtPwd.getText().trim();
		String userName = this.txtName.getText().trim();
		String birth = String.valueOf(this.year.getSelectedItem()) + String.valueOf(this.month.getSelectedItem())
				+ String.valueOf(this.day.getSelectedItem());
		String phone = this.txtPhone1.getText().trim() + this.txtPhone2.getText().trim()
				+ this.txtPhone3.getText().trim();
		UserVo user = new UserVo(userId, userPwd, userName, birth, phone);
		return user;
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() instanceof JComboBox) {

			JComboBox cb = (JComboBox) e.getSource();
			day.removeAllItems();
			switch (String.valueOf(cb.getSelectedItem())) {

			case "01":
			case "03":
			case "05":
			case "07":
			case "08":
			case "10":
			case "12":
				for (int i = 1; i <= 31; i++) {
					String fmt = "%02d";
					day.addItem(String.format(fmt, i));
				}
				break;
			case "02":
				for (int i = 1; i <= 29; i++) {
					String fmt = "%02d";
					day.addItem(String.format(fmt, i));
				}
				break;
			case "04":
			case "06":
			case "09":
			case "11":
				for (int i = 1; i <= 30; i++) {
					String fmt = "%02d";
					day.addItem(String.format(fmt, i));
				}
				break;
			}

		}

		switch (e.getActionCommand()) {
		case "가입":
			if (this.txtId.getText().isEmpty() || this.txtName.getText().isEmpty() || this.txtPwd.getText().isEmpty()
					|| this.txtPhone1.getText().isEmpty() || this.txtPhone2.getText().isEmpty()
					|| this.txtPhone3.getText().isEmpty()) {
				JOptionPane.showMessageDialog(null, "모든 항목을 입력 해주세요", "GGV message", JOptionPane.WARNING_MESSAGE);
			} else {
				if (checkInputOnlyNumberAndAlphabet(this.txtId.getText())) {
					if (checkKorean(this.txtName.getText())) {
						if (insertUser()) {
							new UserLogin();
							this.dispose();
						}
					} else {
						JOptionPane.showMessageDialog(null, "이름은 한글만 입력 가능합니다", "GGV message", JOptionPane.WARNING_MESSAGE);
					}

				} else {
					JOptionPane.showMessageDialog(null, "아이디는 영문 및 숫자만 입력 가능합니다", "GGV message", JOptionPane.WARNING_MESSAGE);
				}

			}
			break;

		case "취소":
			this.dispose();
			new UserLogin();
			break;
		}
	}

	public boolean checkInputOnlyNumberAndAlphabet(String textInput) {
		char chrInput;

		for (int i = 0; i < textInput.length(); i++) {

			chrInput = textInput.charAt(i); // 입력받은 텍스트에서 문자 하나하나 가져와서 체크

			if (chrInput >= 0x61 && chrInput <= 0x7A) {
				// 영문(소문자) OK!
			} else if (chrInput >= 0x41 && chrInput <= 0x5A) {
				// 영문(대문자) OK!
			} else if (chrInput >= 0x30 && chrInput <= 0x39) {

				// 숫자 OK!
			} else {
				return false; // 영문자도 아니고 숫자도 아님!
			}

		}
		return true;
	}

	public boolean checkKorean(String textInput) {
		char chrInput;
		for (int i = 0; i < textInput.length(); i++) {
			chrInput = textInput.charAt(i); // 입력받은 텍스트에서 문자 하나하나 가져와서 체크
			if (chrInput >= 0xAC00 && chrInput <= 0xD7A3) {

			} // 한글 OK
			else {
				return false;
			}
		}
		return true;
	}
}