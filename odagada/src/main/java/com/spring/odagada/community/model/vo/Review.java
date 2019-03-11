package com.spring.odagada.community.model.vo;

import java.sql.Date;

public class Review {
   
   private int writerNum;
   private int driverNum;
   private String rContent;
   private Date rDate;
   private int rGrade;
   
   public Review () {}

   public Review(int writerNum, int driverNum, String rContent, Date rDate, int rGrade) {
      super();
      this.writerNum = writerNum;
      this.driverNum = driverNum;
      this.rContent = rContent;
      this.rDate = rDate;
      this.rGrade = rGrade;
   }

   public int getWriterNum() {
      return writerNum;
   }

   public void setWriterNum(int writerNum) {
      this.writerNum = writerNum;
   }

   public int getDriverNum() {
      return driverNum;
   }

   public void setDriverNum(int driverNum) {
      this.driverNum = driverNum;
   }

   public String getrContent() {
      return rContent;
   }

   public void setrContent(String rContent) {
      this.rContent = rContent;
   }

   public Date getrDate() {
      return rDate;
   }

   public void setrDate(Date rDate) {
      this.rDate = rDate;
   }

   public int getrGrade() {
      return rGrade;
   }

   public void setrGrade(int rGrade) {
      this.rGrade = rGrade;
   }

   @Override
   public String toString() {
      return "Review [writerNum=" + writerNum + ", driverNum=" + driverNum + ", rContent=" + rContent + ", rDate="
            + rDate + ", rGrade=" + rGrade + "]";
   }
   
   

}