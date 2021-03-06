package view;

import java.awt.Color;
import java.awt.Component;
import java.awt.ScrollPane;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.EventListener;

import javax.imageio.ImageIO;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.event.AncestorListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import model.MovieDao;
import model.MovieVo;
import model.ResDao;
import model.ResVo;

import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;

public class MovieProc extends JFrame implements ActionListener, EventListener {
	JList movieList, placeList, timeList, personList;
	JScrollPane movieScroll, placeScroll, timeScroll, personScroll;
	JComboBox daysCombo;
	JButton selectBtn, cancelBtn;
	JLabel placeName, movieName, personCount, dayTime, imageLabel, setPlaceName, setMovieName, setDayTime, setPerson, lblmovie, lblplace, lbltime, lblcount;
	ImageIcon poster;
	DefaultListModel movieModel, placeModel, timeModel, personModel;
	int pcode, pCnt;
	String userid;
	BufferedImage img;
	private JLabel lblNewLabel;

	public MovieProc() {
		initComponent();

	}

	public MovieProc(String userid) {
		this.userid = userid;
		setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
		getContentPane().setBackground(new Color(240, 255, 240));
		setBackground(new Color(240, 255, 240));
		initComponent();
	}

	private void getMovieName() {
		MovieDao mdao = new MovieDao();
		for (MovieVo mvo : mdao.MovieChoice()) {
			movieModel.addElement(mvo.getmName());
		}
	}

	private void getPlaceName(String movieName) {
		MovieDao mdao = new MovieDao();
		placeModel.removeAllElements();
		personModel.removeAllElements();
		ArrayList<MovieVo> placeList = mdao.PlaceChoice(movieName);
		for (MovieVo mvo : placeList) {
			placeModel.addElement(mvo.getpName());
		}
	}

	private void getDay(String movieName, String placeName) {
		MovieDao mdao = new MovieDao();
		daysCombo.removeAllItems();
		personModel.removeAllElements();
		ArrayList<MovieVo> dayList = mdao.DayChoice(movieName, placeName);
		for (MovieVo mvo : dayList) {
			daysCombo.addItem(mvo.getpName());
		}
	}

	private void getTime(String movieName, String placeName, String day) {
		MovieDao mdao = new MovieDao();
		timeModel.removeAllElements();
		personModel.removeAllElements();
		ArrayList<MovieVo> timeList = mdao.TimeChoice(movieName, placeName, day);
		for (MovieVo mvo : timeList) {
			timeModel.addElement(mvo.getpName());
		}
	}

	private void initComponent() {
		this.setTitle("??????,??????,??????,????????? ??????");
		this.setSize(1280, 720);
		this.setResizable(false);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getContentPane().setLayout(null);
		// ?????? ???????????????
		imageLabel = new JLabel();
		imageLabel.setIcon(new ImageIcon(new ImageIcon("poster\\poster.jpg").getImage()
				.getScaledInstance(381, 488, Image.SCALE_DEFAULT)));
		imageLabel.setBounds(870, 40, 381, 488);
		getContentPane().add(imageLabel);

		// ???????????? ????????? & ?????????
		movieModel = new DefaultListModel();
		movieList = new JList(movieModel);
		movieList.setBounds(36, 37, 185, 308);
		movieList.setFont(new Font("?????? ??????", Font.BOLD, 20));
		getContentPane().add(movieList);
		movieList.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		getMovieName();
		movieList.addListSelectionListener(new ListSelectionListener() {

			// ??????????????? ???????????? ?????????????????? ???????????? ?????????
			@Override
			public void valueChanged(ListSelectionEvent e) {
				if (!e.getValueIsAdjusting()) {
					String movieName = (String) movieList.getSelectedValue();
					setMovieName.setText(movieName);
					imageLabel
							.setIcon(new ImageIcon(new ImageIcon("poster\\" + movieName + ".jpg")
									.getImage().getScaledInstance(381, 488, Image.SCALE_DEFAULT)));
					getPlaceName(movieName);
				}
			}
		});

		movieScroll = new JScrollPane(movieList);
		movieScroll.setBounds(36, 37, 215, 308);
		getContentPane().add(movieScroll);
		movieScroll.getVerticalScrollBar().setValue(movieScroll.getVerticalScrollBar().getMinimum());
		movieScroll.getHorizontalScrollBar().setValue(movieScroll.getHorizontalScrollBar().getMinimum());

		// ???????????? ????????? & ?????????
		placeModel = new DefaultListModel();
		placeList = new JList(placeModel);
		placeList.setBounds(353, 37, 185, 308);
		placeList.setFont(new Font("?????? ??????", Font.BOLD, 20));
		getContentPane().add(placeList);
		placeList.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		placeList.addListSelectionListener(new ListSelectionListener() {

			// ?????? ????????? ?????????????????? ???????????? ???????????? ???????????? ?????????
			@Override
			public void valueChanged(ListSelectionEvent e) {
				if (!e.getValueIsAdjusting()) {
					String movieName = (String) movieList.getSelectedValue();
					String placeName = (String) placeList.getSelectedValue();
					setPlaceName.setText(placeName);
					getDay(movieName, placeName);
				}

			}

		});

		placeScroll = new JScrollPane(placeList);
		placeScroll.setBounds(353, 37, 214, 308);
		getContentPane().add(placeScroll);
		placeScroll.getVerticalScrollBar().setValue(movieScroll.getVerticalScrollBar().getMinimum());
		placeScroll.getHorizontalScrollBar().setValue(movieScroll.getHorizontalScrollBar().getMinimum());

		// ???????????? ????????????
		daysCombo = new JComboBox();
		daysCombo.setBounds(594, 40, 241, 42);
		getContentPane().add(daysCombo);
		daysCombo.setFont(new Font("?????? ??????", Font.BOLD, 20));
		daysCombo.addActionListener(this);

		// ???????????? ????????? & ?????????
		timeModel = new DefaultListModel();
		timeList = new JList(timeModel);
		timeList.setBounds(36, 428, 185, 196);
		timeList.setFont(new Font("?????? ??????", Font.BOLD, 20));
		getContentPane().add(timeList);
		timeList.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		timeList.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent e) {
				if (!e.getValueIsAdjusting()) {
					personModel.removeAllElements();
					personModel.addElement("1???");
					personModel.addElement("2???");
					personModel.addElement("3???");
					personModel.addElement("4???");
					personModel.addElement("5???");
				}
			}
		});

		timeScroll = new JScrollPane(timeList);
		timeScroll.setBounds(36, 428, 215, 196);
		getContentPane().add(timeScroll);
		timeScroll.getVerticalScrollBar().setValue(movieScroll.getVerticalScrollBar().getMinimum());
		timeScroll.getHorizontalScrollBar().setValue(movieScroll.getHorizontalScrollBar().getMinimum());

		// ??????????????? ????????? & ?????????
		personModel = new DefaultListModel();
		personList = new JList(personModel);
		personList.setBounds(353, 428, 185, 196);
		personList.setFont(new Font("?????? ??????", Font.BOLD, 20));
		getContentPane().add(personList);
		personList.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		personList.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent e) {
				if (!e.getValueIsAdjusting()) {
					String person = (String) personList.getSelectedValue();
					setPerson.setText(person);
					if (person != null) {

						pCnt = Integer.parseInt(person.replace("???", ""));
						String mName = (String) movieList.getSelectedValue();
						String pName = (String) placeList.getSelectedValue();
						String rDate = (String) timeList.getSelectedValue();
						String day = String.valueOf(daysCombo.getSelectedItem());
						String pDate = day.concat(rDate);
						String pDateTrim = pDate.replace("??? ", "").replace("??? ", "").replace("???", "").replace(":", "");

						// System.out.printf(pDateTrim);
						ResVo rvo = new ResVo(mName, pName, pDateTrim, pCnt);
						ResDao rdao = new ResDao();
						pcode = rdao.getPcode(rvo);

					}
				}

			}
		});
		personScroll = new JScrollPane(personList);
		personScroll.setBounds(353, 428, 214, 196);
		getContentPane().add(personScroll);

		placeName = new JLabel("????????? : ");
		placeName.setFont(new Font("?????? ??????", Font.BOLD, 14));
		placeName.setBounds(577, 460, 70, 29);
		getContentPane().add(placeName);

		selectBtn = new JButton("????????????");
		selectBtn.setBackground(new Color(255, 255, 255));
		selectBtn.setFont(new Font("?????? ??????", Font.BOLD, 18));
		selectBtn.setBounds(906, 566, 146, 58);
		getContentPane().add(selectBtn);
		// selectBtn.setBackground(Color.yellow);

		cancelBtn = new JButton("??????");
		cancelBtn.setBackground(new Color(255, 255, 255));
		cancelBtn.setFont(new Font("?????? ??????", Font.BOLD, 18));
		cancelBtn.setBounds(1097, 566, 139, 58);
		getContentPane().add(cancelBtn);
		// cancelBtn.setBackground(Color.yellow);

		movieName = new JLabel("???????????? : ");
		movieName.setFont(new Font("?????? ??????", Font.BOLD, 14));
		movieName.setBounds(577, 499, 77, 29);
		getContentPane().add(movieName);

		personCount = new JLabel("????????? : ");
		personCount.setFont(new Font("?????? ??????", Font.BOLD, 14));
		personCount.setBounds(577, 581, 70, 29);
		getContentPane().add(personCount);

		dayTime = new JLabel("???????????? : ");
		dayTime.setFont(new Font("?????? ??????", Font.BOLD, 14));
		dayTime.setBounds(577, 538, 77, 29);
		getContentPane().add(dayTime);

		setPlaceName = new JLabel("-");
		setPlaceName.setFont(new Font("?????? ??????", Font.BOLD, 14));
		setPlaceName.setBounds(659, 460, 191, 29);
		getContentPane().add(setPlaceName);

		setMovieName = new JLabel("-");
		setMovieName.setFont(new Font("?????? ??????", Font.BOLD, 14));
		setMovieName.setBounds(664, 499, 191, 29);
		getContentPane().add(setMovieName);

		setDayTime = new JLabel("-");
		setDayTime.setFont(new Font("?????? ??????", Font.BOLD, 14));
		setDayTime.setBounds(664, 538, 191, 29);
		getContentPane().add(setDayTime);

		setPerson = new JLabel("-");
		setPerson.setFont(new Font("?????? ??????", Font.BOLD, 14));
		setPerson.setBounds(664, 581, 191, 29);
		getContentPane().add(setPerson);
		
		lblmovie = new JLabel("?????? ??????");
		lblmovie.setFont(new Font("?????? ??????", Font.BOLD, 18));
		lblmovie.setBounds(36, 0, 215, 39);
		getContentPane().add(lblmovie);
		
		lbltime = new JLabel("?????? ??????");
		lbltime.setFont(new Font("?????? ??????", Font.BOLD, 18));
		lbltime.setBounds(36, 391, 215, 39);
		getContentPane().add(lbltime);
		
		lblplace = new JLabel("?????? ??????");
		lblplace.setFont(new Font("?????? ??????", Font.BOLD, 18));
		lblplace.setBounds(352, 0, 215, 39);
		getContentPane().add(lblplace);
		
		lblcount = new JLabel("?????????");
		lblcount.setFont(new Font("?????? ??????", Font.BOLD, 18));
		lblcount.setBounds(352, 391, 215, 39);
		getContentPane().add(lblcount);
		
		lblNewLabel = new JLabel("");
		lblNewLabel.setIcon(new ImageIcon("poster\\hulk1.png"));
		lblNewLabel.setBounds(69, 138, 460, 545);
		getContentPane().add(lblNewLabel);

		this.selectBtn.addActionListener(this);
		this.cancelBtn.addActionListener(this);

		this.setVisible(true);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() instanceof JComboBox) {
			String day = String.valueOf(daysCombo.getSelectedItem());
			if (day.equals("null")) {
				setDayTime.setText(" ");
			} else {
				setDayTime.setText(day);
			}
			String movieName = (String) movieList.getSelectedValue();
			String placeName = (String) placeList.getSelectedValue();
			String dayTrim = day.replace("??? ", "").replace("??? ", "").replace("???", "");
			System.out.println(day);
			getTime(movieName, placeName, dayTrim);
		}

		switch (e.getActionCommand()) {
		case "????????????":
			if (movieList.getSelectedIndex() <= -1) {
				JOptionPane.showMessageDialog(null, "????????? ??????????????????.", "GGV message", JOptionPane.WARNING_MESSAGE);

			} else if (placeList.getLeadSelectionIndex() <= -1) {
				JOptionPane.showMessageDialog(null, "????????? ??????????????????.", "GGV message", JOptionPane.WARNING_MESSAGE);

			} else if (daysCombo.getSelectedIndex() <= -1) {
				JOptionPane.showMessageDialog(null, "????????? ??????????????????.", "GGV message", JOptionPane.WARNING_MESSAGE);

			} else if (timeList.getSelectedIndex() <= -1) {
				JOptionPane.showMessageDialog(null, "????????? ??????????????????.", "GGV message", JOptionPane.WARNING_MESSAGE);

			} else if (personList.getSelectedIndex() <= -1) {
				JOptionPane.showMessageDialog(null, "???????????? ??????????????????.", "GGV message", JOptionPane.WARNING_MESSAGE);

			}

			else {
				this.dispose();
				new Seat(userid, pcode, pCnt);

			}
			break;
		case "??????":
			int yesOrNo = JOptionPane.showConfirmDialog(null, "????????? ?????????????????????????", "GGV message", JOptionPane.YES_NO_OPTION);
			if (yesOrNo == 0) {
				this.dispose();
				new Menu(userid);
			}


		}
	}
}