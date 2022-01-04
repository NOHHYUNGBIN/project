package view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import model.UserDao;
import model.UserVo;
import javax.swing.ImageIcon;
import java.awt.Toolkit;

public class UserLogin extends JFrame implements ActionListener, KeyListener {

	private JLabel lblCinema, lblId, lblPwd, lblim;
	private JTextField txtId;
	private JPasswordField txtPwd;
	private JButton btnLogin, btnProc;

	public UserLogin() {
		setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
		getContentPane().setBackground(new Color(240, 255, 240));
		getContentPane().setLayout(null);

		lblCinema = new JLabel("GGV");
		lblCinema.setFont(new Font("맑은 고딕", Font.BOLD | Font.ITALIC, 50));
		lblCinema.setBounds(99, 79, 120, 94);
		getContentPane().add(lblCinema);

		lblId = new JLabel("ID");
		lblId.setFont(new Font("맑은 고딕", Font.BOLD, 20));
		lblId.setBounds(62, 222, 39, 49);
		getContentPane().add(lblId);

		lblPwd = new JLabel("PASSWORD");
		lblPwd.setFont(new Font("맑은 고딕", Font.BOLD, 20));
		lblPwd.setBounds(12, 288, 120, 49);
		getContentPane().add(lblPwd);
		

		txtId = new JTextField();
		txtId.setToolTipText("아이디를 입력하세요.");
		txtId.setFont(new Font("맑은 고딕", Font.BOLD, 20));
		txtId.setBounds(167, 222, 261, 49);
		getContentPane().add(txtId);
		txtId.setColumns(10);

		txtPwd = new JPasswordField();
		txtPwd.setToolTipText("비밀번호를 입력하세요.");
		txtPwd.setFont(new Font("맑은 고딕", Font.BOLD, 20));
		txtPwd.setColumns(10);
		txtPwd.setBounds(167, 288, 261, 49);
		getContentPane().add(txtPwd);
		txtPwd.addKeyListener(this);

		btnLogin = new JButton("LOGIN");
		btnLogin.setBackground(Color.WHITE);
		btnLogin.setFont(new Font("맑은 고딕", Font.BOLD, 20));
		btnLogin.setBounds(440, 222, 134, 49);
		getContentPane().add(btnLogin);
		btnLogin.addActionListener(this);

		btnProc = new JButton("SIGN UP");
		btnProc.setBackground(Color.WHITE);
		btnProc.setFont(new Font("맑은 고딕", Font.BOLD, 20));
		btnProc.setBounds(440, 288, 134, 49);
		getContentPane().add(btnProc);
		
		lblim = new JLabel("");
		lblim.setIcon(new ImageIcon("poster\\ironman1.png"));
		lblim.setBounds(231, 0, 355, 370);
		getContentPane().add(lblim);
		
		btnProc.addActionListener(this);


		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		this.setSize(600, 407);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
	}

	// main
	public static void main(String[] args) {
		new UserLogin();

	}

	private void getUserInfo() {
		UserDao udao = new UserDao();
		String userid = this.txtId.getText().trim();
		String pwd = this.txtPwd.getText().trim();
		String name = udao.getName(userid);
		int check = 0;
		for (UserVo uvo : udao.userLogin()) {
			if (uvo.getUserId().equals(userid) && uvo.getUserPwd().equals(pwd)) {
				JOptionPane.showMessageDialog(null, name+"님 즐거운 관람 되시길 바랍니다.", "GGV message", JOptionPane.INFORMATION_MESSAGE);
				this.dispose();
				new Menu(userid);
				check++;
			}
		}
		// System.out.printf("%d",check);
		if (check == 0)
			JOptionPane.showMessageDialog(null, "아이디 또는 비밀번호가 일치하지 않습니다", "GGV message", JOptionPane.WARNING_MESSAGE);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (btnProc == e.getSource()) {
			this.dispose();
			new UserProc();
		}
		if (btnLogin == e.getSource()) {
			if (this.txtId.getText().trim().isEmpty() || this.txtPwd.getText().trim().isEmpty()) {
				JOptionPane.showMessageDialog(null, "아이디 또는 비밀번호를 입력해주세요", "GGV message", JOptionPane.WARNING_MESSAGE);

			} else {
				getUserInfo();
			}
		}
	}
	@Override
	public void keyReleased(KeyEvent e) {
		
	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void keyPressed(KeyEvent e) {
		if (e.getKeyCode() == KeyEvent.VK_ENTER) {
			getUserInfo();
		}
	}
}
