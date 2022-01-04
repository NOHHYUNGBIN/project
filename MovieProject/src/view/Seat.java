package view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.BevelBorder;

import model.ResDao;
import model.ResVo;
import javax.swing.ImageIcon;
import java.awt.Toolkit;

public class Seat extends JFrame implements MouseListener, ActionListener {

   ArrayList<String> seats;
   String seat = "";
   String userid, pdate;
   JButton btnRes, btnReturn;
   JLabel lblBlue, lblYellow, lblBlueText, lblYellowText, lblCinema, lblMv, lblResDate, lblPCnt, lblSeat, lblScreen,
         lblCName, lblMName, lblRDate, lblPCntTxet, lblSeatText, lblRed, lblRedText;
   JLabel[] seatList = new JLabel[49];
   JLabel[] seatRow = new JLabel[7];
   JLabel[] seatCol = new JLabel[7];
   JPanel pane, paneSeat, paneRow, paneCol, paneSc;

   ResDao rDao;
   ResVo rvo;
   boolean[] reserved = new boolean[49];
   boolean[] canRes = new boolean[49];
   int b = 0;
   int pcode, pCnt, rcode, pCnt2;

   BevelBorder pickable;
   BevelBorder picked;

   public Seat() {
      initConponent();

   }

   public Seat(String userid, int pcode, int pCnt) {
      this.userid = userid;
      this.pcode = pcode;
      this.pCnt = pCnt;
      this.pCnt2 = pCnt;
      setIconImage(Toolkit.getDefaultToolkit().getImage("poster\\g-icon.jpg"));
      initConponent();
   }

   private void initConponent() {
      this.setTitle("좌석 선택");
      // panel
      pane = new JPanel();
      paneSeat = new JPanel(new GridLayout(7, 7));
      paneRow = new JPanel(new GridLayout(1, 7));
      paneCol = new JPanel(new GridLayout(7, 1));
      paneSc = new JPanel();

      pane.setBackground(new Color(240, 255, 240));
      paneSeat.setLocation(150, 210);
      paneSeat.setSize(300, 300);
      pane.setLayout(null);

      // button
      btnRes = new JButton("예매하기");
      btnRes.setBackground(new Color(255, 255, 255));
      btnRes.setFont(new Font("맑은 고딕", Font.BOLD, 14));
      btnReturn = new JButton("뒤로가기");
      btnReturn.setBackground(new Color(255, 255, 255));
      btnReturn.setFont(new Font("맑은 고딕", Font.BOLD, 14));

      // label
      pickable = new BevelBorder(BevelBorder.RAISED);
      picked = new BevelBorder(BevelBorder.LOWERED);

      rDao = new ResDao();
      for (char i = 'A'; i < 'H'; i++) {
         for (int j = 1; j < 8; j++) {
            String a = "";
            int c;
            a = String.valueOf(i) + String.valueOf(j);
            seatList[b] = new JLabel(a, JLabel.CENTER);
            seatList[b].setOpaque(true);
            c = rDao.getSeatInfo(pcode, a);
            if (c > 0) {
               seatList[b].setBorder(picked);
               seatList[b].setBackground(new Color(220, 20, 60));
               reserved[b] = false;
            } else {
               seatList[b].setBorder(pickable);
               seatList[b].setBackground(new Color(176, 196, 222));
               reserved[b] = true;
               canRes[b] = true;
            }

            paneSeat.add(seatList[b]);
            b++;
         }
      }
      b = 0;
      for (char i = 'A'; i < 'H'; i++) {
         String a = String.valueOf(i);
         seatCol[b] = new JLabel(a, JLabel.CENTER);
         paneCol.add(seatCol[b]);
         b++;
      }
      b = 0;
      for (int i = 0; i < seatRow.length; i++) {
         String a = String.valueOf(i + 1);
         seatRow[b] = new JLabel(a, JLabel.CENTER);
         paneRow.add(seatRow[b]);
         b++;
      }
      lblBlue = new JLabel("");
      lblYellow = new JLabel("");

      pane.add(paneSeat);
      getContentPane().add(pane);

      paneRow.setBounds(150, 145, 300, 40);
      pane.add(paneRow);

      paneCol.setBounds(80, 210, 40, 300);
      pane.add(paneCol);

      paneSc.setBackground(Color.LIGHT_GRAY);
      paneSc.setBounds(80, 61, 400, 50);
      pane.add(paneSc);
      paneSc.setLayout(new BorderLayout(0, 0));

      lblScreen = new JLabel("S  C  R  E  E  N", JLabel.CENTER);
      lblScreen.setFont(new Font("맑은 고딕", Font.BOLD, 24));
      paneSc.add(lblScreen, BorderLayout.CENTER);

      btnRes.setBounds(490, 465, 100, 45);
      pane.add(btnRes);

      btnReturn.setBounds(620, 465, 100, 45);
      pane.add(btnReturn);

      lblBlue.setBackground(new Color(176, 196, 222));
      lblBlue.setBounds(490, 210, 45, 45);
      lblBlue.setOpaque(true);
      pane.add(lblBlue);

      lblYellow.setBackground(new Color(220, 20, 60));
      lblYellow.setBounds(490, 260, 45, 45);
      lblYellow.setOpaque(true);
      pane.add(lblYellow);

      lblBlueText = new JLabel("예약가능");
      lblBlueText.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblBlueText.setBounds(547, 225, 52, 15);
      pane.add(lblBlueText);

      lblYellowText = new JLabel("예약불가");
      lblYellowText.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblYellowText.setBounds(547, 275, 52, 15);
      pane.add(lblYellowText);

      lblCinema = new JLabel("지  점  명 :");
      lblCinema.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblCinema.setBounds(494, 365, 60, 25);
      pane.add(lblCinema);

      lblMv = new JLabel("영화제목 :");
      lblMv.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblMv.setBounds(494, 390, 60, 25);
      pane.add(lblMv);

      lblResDate = new JLabel("예매일시 :");
      lblResDate.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblResDate.setBounds(494, 415, 60, 25);
      pane.add(lblResDate);

      lblPCnt = new JLabel("인  원  수 :");
      lblPCnt.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblPCnt.setBounds(494, 440, 60, 25);
      pane.add(lblPCnt);

      lblCName = new JLabel("");
      lblCName.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblCName.setBounds(566, 365, 100, 25);
      pane.add(lblCName);

      lblMName = new JLabel("");
      lblMName.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblMName.setBounds(566, 390, 100, 25);
      pane.add(lblMName);

      lblRDate = new JLabel("");
      lblRDate.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblRDate.setBounds(566, 415, 100, 25);
      pane.add(lblRDate);

      lblPCntTxet = new JLabel("");
      lblPCntTxet.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblPCntTxet.setBounds(566, 440, 100, 25);
      lblPCntTxet.setText(String.valueOf(pCnt));
      pane.add(lblPCntTxet);

      lblRed = new JLabel("");
      lblRed.setOpaque(true);
      lblRed.setBackground(new Color(255, 255, 102));
      lblRed.setBounds(490, 310, 45, 45);
      pane.add(lblRed);

      rvo = rDao.getPData(pcode);
      lblCName.setText(rvo.getcName());
      lblMName.setText(rvo.getmName());
      lblRDate.setText(rvo.getpDate());
      pdate = rvo.getpDate();
      System.out.println(pdate);

      lblRedText = new JLabel("선택좌석");
      lblRedText.setFont(new Font("맑은 고딕", Font.BOLD, 12));
      lblRedText.setBounds(547, 325, 52, 15);
      pane.add(lblRedText);
      seats = new ArrayList<String>();
      // 이벤트 연결
      b = 0;
      for (int i = 0; i < seatList.length; i++) {
         seatList[b].addMouseListener(this);
         b++;
      }

      this.btnRes.addActionListener(this);
      this.btnReturn.addActionListener(this);

      this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
      this.setSize(800, 600);
      this.setResizable(false);
      this.setLocationRelativeTo(null);
      this.setVisible(true);

   }

   @Override
   public void mouseClicked(MouseEvent e) {

      JLabel j = (JLabel) e.getSource();
      String i = j.getText();

      b = 0;
      for (int k = 0; k < canRes.length; k++) {

         if (i.equals(seatList[b].getText())) {
            if (reserved[b] == true && canRes[b] == true && pCnt2 > 0) {
               seatList[b].setBorder(picked);
               seatList[b].setBackground(new Color(255, 255, 102));
               canRes[b] = false;
               seats.add(i);

               pCnt2--;
            } else if (reserved[b] == true && canRes[b] == false) {
               seatList[b].setBorder(pickable);
               seatList[b].setBackground(new Color(176, 196, 222));
               canRes[b] = true;
               seats.remove(i);
               pCnt2++;
            }
         }
         b++;
      }

   }

   @Override
   public void mousePressed(MouseEvent e) {
   }

   @Override
   public void mouseReleased(MouseEvent e) {
   }

   @Override
   public void mouseEntered(MouseEvent e) {
   }

   @Override
   public void mouseExited(MouseEvent e) {
   }

   @Override
   public void actionPerformed(ActionEvent e) {
      switch (e.getActionCommand()) {
      case "예매하기":

         if (pCnt2 == 0) {
            int yesOrNo = JOptionPane.showConfirmDialog(null, "예메 하시겠습니까??", "GGV message",
                  JOptionPane.YES_NO_OPTION);
            if (yesOrNo == 0) {
            	String pdatetrim = pdate.replace("/", "").replace(":", "").replace(" ","");
               rDao.insertRes(userid, pcode, pCnt, pdatetrim);
               rcode = rDao.getRcode(userid, pcode);
           	System.out.println(rcode);

               for (int i = 0; i < seats.size(); i++) {
                  rDao.updateSeat(pcode, seats.get(i), rcode);

               }
               this.dispose();
               new CheckReserve(userid, rcode, pcode, pCnt, seats);
            }
         } else {
            JOptionPane.showMessageDialog(null, "선택한 인원수와 좌석수가 일치하지 않습니다.\n좌석을 선택해주세요.", "GGV message",
                  JOptionPane.WARNING_MESSAGE);
         }

         break;
      case "뒤로가기":
         int yesOrNo2 = JOptionPane.showConfirmDialog(null, "영화예매로 돌아가시겠습니까?", "GGV message",
               JOptionPane.YES_NO_OPTION);
         if (yesOrNo2 == 0) {
            this.dispose();
            new MovieProc(userid);
         }

         break;
      }

   }
}