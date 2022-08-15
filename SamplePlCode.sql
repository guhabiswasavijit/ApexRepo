SET SERVEROUTPUT ON;
declare

 cursor c_payTx is
   select PAYTM_TX.TX_DATE as TX_DATE,
      PAYTM_TX.ACTIVITY as ACTIVITY,
      PAYTM_TX.SOURCEDESTINATION as SOURCEDESTINATION,
      PAYTM_TX.WALLETTXID as WALLETTXID,
      PAYTM_TX.USR_COMMENT as USR_COMMENT,
      PAYTM_TX.DEBIT as DEBIT,
      PAYTM_TX.CREDIT as CREDIT,
      PAYTM_TX.TRANSACTION_BREAKUP as TRANSACTION_BREAKUP,
      PAYTM_TX.STATUS as STATUS 
   from PAYTM_TX PAYTM_TX;
   table_header CLOB := '<div class="row"><table class="table" id="paytxData"><tbody>
                        <tr><td>TX_DATE</td><td>ACTIVITY</td><td>SOURCEDESTINATION</td>
                        <td>WALLETTXID</td><td>USR_COMMENT</td><td>DEBIT</td>
                        <td>CREDIT</td><td>TRANSACTION_BREAKUP</td><td>STATUS</td></tr>';
   table_data CLOB :=   '<tr><td>${TX_DATE}</td><td>${ACTIVITY}</td><td>${SOURCEDESTINATION}</td>
                         <td>${WALLETTXID}</td><td>${USR_COMMENT}</td><td>${DEBIT}</td>
                         <td>${CREDIT}</td><td>${TRANSACTION_BREAKUP}</td><td>${STATUS}</td></tr>';
   table_footer  CLOB := '</tbody></table></div>';   
   page_html CLOB := '';
begin
  sys.htp.p(page_html || table_header);
  --page_html := page_html || table_header;
  for tx in c_payTx
  loop
    table_data := REPLACE(table_data,'${TX_DATE}',tx.TX_DATE);
    table_data := REPLACE(table_data,'${ACTIVITY}',tx.ACTIVITY);
    table_data := REPLACE(table_data,'${SOURCEDESTINATION}',tx.SOURCEDESTINATION);
    table_data := REPLACE(table_data,'${WALLETTXID}',tx.WALLETTXID);
    table_data := REPLACE(table_data,'${USR_COMMENT}',tx.USR_COMMENT);
    table_data := REPLACE(table_data,'${DEBIT}',tx.DEBIT);
    table_data := REPLACE(table_data,'${CREDIT}',tx.CREDIT);
    table_data := REPLACE(table_data,'${TRANSACTION_BREAKUP}',tx.TRANSACTION_BREAKUP);
    table_data := REPLACE(table_data,'${STATUS}',tx.STATUS);
    --dbms_output.put_line(table_data); 
    --page_html :=  page_html || table_data; 
    sys.htp.p(table_data);
  end loop;
   -- page_html :=  page_html ||table_footer ;
   -- dbms_output.put_line(apex_escape.html(page_html));
   sys.htp.p(table_footer);
   sys.htp.p('');
end;