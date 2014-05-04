<%
'PROCS.INC
Sub WriteProductRow
  'Write a table row for the current record of rsProducts
  response.write "  <tr>" & vbcrlf
  
  'First cell for picture
  sTemp = trim("" & rsproducts("itempicturefile"))
  if sTemp = "" then
    sTemp = "Picture Not Available"
  else
    sTemp = "<img src='images\products\" & sTemp & "' border=0 alt=''>"
  end if
  response.write "    <td align='center'>"
  response.write "<font face='Verdana, Arial' color='#008000' size='-1'>"
  response.write sTemp & "</font></td>" & vbcrlf

  'Second cell for Item #, name, description
  response.write "    <td valign='top'>"
  response.write "<font face='Verdana, Aria' color='#000000' size='-1'>"
  response.write "<i><u>Item #" & rsProducts("itemproductnumber")
  response.write "</u></i></font><br>"
  response.write "<font face='Verdana, Arial' color='#0000ff' size='-1'>"
  response.write "<b>" & rsProducts("itemname") & "</b> - "
  response.write "<font face='Verdana, Arial' color='#008000' size='-1'>"
  response.write rsProducts("itemdescription") & "<br><br>"
  response.write "</font></td>" & vbcrlf

  'Third cell for price and "add to cart" link
  if rsproducts("itemsaleprice") > 0 then
    sTemp = "SALE: " & formatcurrency(rsProducts("itemsaleprice")) & _
      "<br>(Regular " & _
      formatcurrency(rsProducts("itemregularprice")) & ")"
  else
    sTemp = "Price: " & formatcurrency(rsProducts("itemregularprice")) 
  end if
  response.write "    <td align='center' valign='middle' nowrap>"
  response.write "<font face='Verdana, Arial' color='#0000ff' size='-1'>"
  response.write sTemp & "<br><br>"
  response.write "<a href='shopcart.asp?mode=add&itemno="
  response.write rsproducts("itemproductnumber") & "'></font>"
  response.write "<img src='images/addtocart.jpg' border='0'></a></td>"
  response.write vbcrlf
  
  response.write "  </tr>"  & vbcrlf

End Sub

Function RemoveQuotes(s)
  dim i, s2
  s = trim(s)
  
  if len(s) = 0 then 
    RemoveQuotes = ""
    exit function
  end if
  
  s2 = ""
  for i = 1 to len(s)
    if mid(s,i,1) = "'" then
      s2 = s2 & "''"
    else
      s2 = s2 & mid(s, i, 1)
    end if
  next
  RemoveQuotes = s2
End Function
%>