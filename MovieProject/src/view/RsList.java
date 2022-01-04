package view;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import model.ResDao;
import model.UserVo;

import java.awt.Font;
import java.awt.Toolkit;

public class RsList extends JFrame implements ActionListener, MouseListener {

	// Component 목록
	JButton btnBack, btnAdd, btnC;
	JPanel topPane;
	JTable jTable;
	JScrollPane pane;
	public static String userid;
	DefaultTableModel dtm;
	int rcode;
	ResDao rdao;

	// Vector
	Vector v; // data list
	Vector cols; // list 의 제목

	static RsList rslist = null;

	public RsList(String userid) {
		this.userid = userid;
		setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
		initComponent();
	}

	public RsList() {
	}

	private void initComponent() {
		this.setTitle("예매 리스트");

		jTable = new JTable();

		jTable.setModel(new DefaultTableModel(getDataList(), getColumns()) {
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		});
		pane = new JScrollPane(jTable);
		getContentPane().add(pane);
		// getContentPane().setLayout(null);

		topPane = new JPanel();
		btnAdd = new JButton("추가예매");
		btnAdd.setFont(new Font("굴림", Font.BOLD, 16));
		topPane.add(btnAdd);
		btnC = new JButton("예매취소");
		btnC.setFont(new Font("굴림", Font.BOLD, 16));
		topPane.add(btnC);
		btnBack = new JButton("뒤로가기");
		btnBack.setFont(new Font("굴림", Font.BOLD, 16));
		topPane.add(btnBack);

		getContentPane().add(topPane, BorderLayout.SOUTH);

		this.btnAdd.addActionListener(this);
		this.btnBack.addActionListener(this);
		this.btnC.addActionListener(this);

		this.jTable.addMouseListener(this);

		this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		this.setSize(750, 500);
		this.setLocationRelativeTo(null);
		this.setVisible(true);
	}

	// jTable에 출력할 자료 검색
	private Vector getDataList() {
		ResDao rDao = new ResDao();
		Vector v = rDao.getDataList(userid);
		return v;

	}

	// jtable 제목줄 header
	private Vector getColumns() {
		Vector cols = new Vector();
		cols.add("예약번호");
		cols.add("영화관");
		cols.add("영화이름");
		cols.add("상영관");
		cols.add("좌석");
		cols.add("날짜");
		return cols;
	}

	// main
	public static void main(String[] args) {
		if (rslist != null)
			rslist.dispose();
		if (rslist == null)
			rslist = new RsList();
	}

	// 이벤트목록
	public void actionPerformed(ActionEvent e) {
		switch (e.getActionCommand()) {
		case "추가예매":
			this.dispose();
			new MovieProc(userid);
			break;

		case "예매취소":
			if (jTable.getSelectedRow() <= -1) {
				JOptionPane.showMessageDialog(null, "선택한 예매내역이 없습니다.", "GGV message", JOptionPane.WARNING_MESSAGE);

			} else {

				int yesOrNo = JOptionPane.showConfirmDialog(null, "정말로 취소하시겠습니까?", "GGV message", JOptionPane.YES_NO_OPTION);
				if (yesOrNo == 0) {
					rdao = new ResDao();
					rdao.deleteRes(rcode);
					jTableRefresh();
				}
			}
			break;

		case "뒤로가기":
			this.dispose();
			new Menu(userid);
			break;
		}
	}

	// initTable()
	private DefaultTableModel initTable() {
		cols = getColumns();
		v = getDataList();
		DefaultTableModel dtm = new DefaultTableModel(v, cols);
		return dtm;
	}

	public void mouseClicked(MouseEvent e) {
		int r = jTable.getSelectedRow();
		int c = jTable.getSelectedColumn();
		rcode = (int) jTable.getValueAt(r, 0); // 클릭한 예약번호
		System.out.println(rcode);

	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	public void jTableRefresh() {

		jTable.setModel(new DefaultTableModel(getDataList(), getColumns()) {
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		});
		jTable.repaint(); // swing component : ui 요소를 새로그린다.

	}
}
