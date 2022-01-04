package model;

public class ResVo {
   
   int    resNum;
   String mName;
   String cName;
   String pDate;
   int    pCnt;
   String Screen;

   public ResVo() {
      
   }
   
    
   public ResVo(String mName, String cName, String pDate, int pCnt) {
      this.mName = mName;
      this.cName = cName;
      this.pDate = pDate;
      this.pCnt = pCnt;
   }
   
   public ResVo(String mName, String cName, String pDate, String Screen) {
      this.mName = mName;
      this.cName = cName;
      this.pDate = pDate;
      this.Screen = Screen;
   }


   public ResVo(int resNum, String mName, String cName, String rDate, int pCnt, String Screen) {
      
      this.resNum = resNum;
      this.mName = mName;
      this.cName = cName;
      this.pDate = pDate;
      this.pCnt = pCnt;
      this.Screen = Screen;
   }

   public int getResNum() {
      return resNum;
   }

   public void setResNum(int resNum) {
      this.resNum = resNum;
   }

   public String getmName() {
      return mName;
   }

   public void setmName(String mName) {
      this.mName = mName;
   }

   public String getcName() {
      return cName;
   }

   public void setcName(String cName) {
      this.cName = cName;
   }

   public String getpDate() {
      return pDate;
   }

   public void setpDate(String pDate) {
      this.pDate = pDate;
   }

   public int getpCnt() {
      return pCnt;
   }

   public void setpCnt(int pCnt) {
      this.pCnt = pCnt;
   }

   public String getrScreen() {
      return Screen;
   }

   public void setScreen(String Screen) {
      this.Screen = Screen;
   }

   @Override
   public String toString() {
      return "ResVo [resNum=" + resNum + ", mName=" + mName + ", cName=" + cName + ", pDate=" + pDate + ", pCnt="
            + pCnt + ", Screen=" + Screen + "]";
   }
   
   
}