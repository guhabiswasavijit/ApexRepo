CREATE SEQUENCE SEQ_GEN_IDENTITY
 START WITH     1000
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE TABLE PAYTM_TX(
  id number(10) DEFAULT  "SEQ_GEN_IDENTITY"."NEXTVAL" not null,  
  tx_date date default sysdate not null,
  activity varchar2(40),
  sourceDestination varchar2(40),
  walletTxId varchar2(40),
  usr_comment varchar2(40),
  debit number(10),
  credit number(10), 
  transaction_breakup varchar2(40),
  status varchar2(40),
  CONSTRAINT paytm_pk PRIMARY KEY (id)  
);

DROP TABLE PAYTM_TX;
@C:\Users\avijit\Downloads\Paytm_Statement_Sample_Data.sql;
INSERT INTO PAYTM_TX(tx_date,activity,sourceDestination,walletTxId,usr_comment,debit,credit,transaction_breakup,status) VALUES 
(TO_DATE('25/08/2020 12:13:06','DD/MM/YYYY HH:MI:SS'),'Paid for order','Zomato media Private Limited Order #ZTD-20-FEF8137699B44',30897716783,NULL,296,NULL,NULL,'SUCCESS');
  
 SELECT TO_DATE('25/08/2020 12:13:06','DD/MM/YYYY HH:MI:SS') FROM DUAL;
 SELECT SEQ_GEN_IDENTITY.NEXTVAL FROM DUAL;
 
 ALTER TABLE PAYTM_TX MODIFY sourceDestination varchar2(100);
 
 DELETE FROM PAYTM_TX;