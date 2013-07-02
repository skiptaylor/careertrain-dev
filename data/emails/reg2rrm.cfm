<!---BCC="#BCC#"---><!---CC="#RegCC#"--->
<!---School CAREER DIRECTION Password. Please forward to RRNCO and NCOIC--->

<CFIF program eq "CD">

<cfsavecontent variable="mailBody">

<style type="text/css"><!--
body, span, div, p, pre, table, tr, th, td, input{
	font-family : Arial, CG Omega, Courier New;
	color: #000000;
	font-size: 14px;
	}
	.small{
	font-family : Arial, CG Omega, Courier New;
	color: #000000;
	font-size: 12px;
	}	
	
	u {text-decoration: none;  border-bottom: 1px solid #000000; } 

	--></style> 

<div style="width: 900px;">

<p>The following school has been registered for the <strong>Career Direction 2</strong> workshop. Would you please forward this message to the appropriate NCOIC and Recruiter?</p>

<p>Thank you,<br />
<strong>Career Training Concepts, Inc.</strong><br />
(770) 326-9229</p>

<p>Dear Recruiter,</p>

<p>A <strong>Career Direction 2</strong> password has been issued to the school listed below. </p>

 <cfoutput>
<p><span style="background-color: ##ffff00">The school's password is #password#</span></p>

<table cellpadding="0" cellspacing="0" border="0" width="600">
	<tr>
		<td colspan="2" width="220" nowrap>
			<span style="background-color: ##ffff00">Organization Name........................................</span>
         </td> 
         <td colspan="2" width="380" nowrap>
         	<span style="background-color: ##ffff00">#SName#</span>
         </td>   
    </tr>
    <tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Contact Name................................................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#FirstName# #MiddleI# #LastName#</span>
         </td>   
    </tr>
   	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Address.........................................................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#SAddress1#</span><br />
            <cfif #len(SAddress2)# gt 0>
            	<span style="background-color: ##ffff00">#SAddress2#</span><br />
             </cfif>   
            <span style="background-color: ##ffff00">#SCity#, #SState# #SZip#</span><br />                          
         </td>   
    </tr>
	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Mailing Address (if different)..........................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#MAddress1#</span><br />
            <cfif #len(SAddress2)# gt 0>
            	<span style="background-color: ##ffff00">#MAddress2#</span><br />
             </cfif>   
            <span style="background-color: ##ffff00">#MCity#, #MState# #MZip#</span><br />                          
         </td>   
    </tr>
    <tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Phone...........................................................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#Phone#</span>
         </td>   
    </tr>
    <tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Fax................................................................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#Fax#</span>
         </td>   
    </tr> 	       
	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Email.............................................................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#Email#</span>
         </td>   
    </tr> 	       
	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Number of Juniors..................#INT(NumJuniors)#</span>
         </td> 
        
        <td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Number of Seniors..................#INT(NumSeniors)#</span>
         </td> 
        
     </tr> 	       
	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">Used CD before?..........................................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#YesNoFormat(CDBefore)#</span>
         </td>   
    </tr>
  	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">National Guard Representative.....................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#NGRep#</span>
         </td>   
    </tr> 
    <tr><td colspan="4" nowrap>&nbsp;</td></tr>
  	<tr>
		<td colspan="2" nowrap>
			<span style="background-color: ##ffff00">National Guard E-Mail Contacts.....................</span>
         </td> 
         <td colspan="2" nowrap>
         	<span style="background-color: ##ffff00">#List_RRMEMails#</span>
         </td>   
    </tr>      
</table>

<p style="background-color: ##ffff00">Comments:<br />
#Comments#</p>
</cfoutput>

<p>Students use their school's unique password to generate online academic/planning reports and to use our Resum&eacute; Tool. </p>

<p>Visit the following Web sites to learn more:<br />
Student academic/career planning reports: <a href="http://www.careertrain.com/reports/sample/report1.htm">http://www.careertrain.com/reports/sample/report1.htm</a> <br />
Resum&eacute; Tool: <a href="http://www.careertrain.com/cdStudentResum&eacute;Temp.cfm">http://www.careertrain.com/cdStudentResum&eacute;Temp.cfm </a> </p>

<p>With <strong>Career Direction 2</strong>, you have valuable "face" time with students who are exploring their future options. <strong>Career Direction 2</strong> gives you insight into students' individual interests, plans and motivations - helping you to become an effective career advisor to students. </p>

<p>Sincerely, <br />
<strong>Career Training Concepts, Inc.</strong> <br />
770.326.9229</p>
  
</div>
</cfsavecontent>

<CFMAIL QUERY="GetRRM" FROM="#CD2Email#" TO="#Email#" Subject="#SName# SEV Registration Notice. Please forward." type="html">
#mailBody#
</cfmail>

</CFIF>



