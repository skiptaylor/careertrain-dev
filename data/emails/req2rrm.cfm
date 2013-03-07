<!---BCC="#BCC#" ---><!---CC="#RequestCC#"--->

<!---============================This is the real message in the production site this should stay====================================--->
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

<p>Dear <strong>Career Direction</strong> POC:</p>

<cfoutput>
<p>#FirstName# #MiddleI# #LastName# at #SName# has requested a <strong>Career Direction</strong> workshop. Please forward this message to the appropriate NCOIC and Recruiter.</p>
</cfoutput>

<p>Thank you, <br />
<strong>Career Training Concepts, Inc.</strong> <br />
(770) 326-9229</p>

<p>&nbsp;</p>

<p>Dear Recruiter:</p>

<p>You have been invited to present the <strong>Career Direction</strong> workshop at <cfoutput><span style="background-color: ##ffff00">#Sname#</span></cfoutput>! Please contact <span style="background-color: ##ffff00"#FirstName# #MiddleI# #LastName#</span> to answer any questions he/she may have and set up a date and time.</p>

<cfoutput>
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
    </tr>
    <tr>    
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

</cfoutput>

<p>The counselor/teacher may need more information about the program to get final approval for your presentation. </p>
<p>The school must have a password for students to access our online "Careers and Occupations Guide Reports" and Resume tools. 
The procedure:</p>
<p>
1.  Go to <a href="http://www.careertrain.com/arngLanding.cfm">http://www.careertrain.com/arngLanding.cfm</a>   <br />
2.  Enter the Guard "authorization code" which is "<Strong>cdguard</Strong>" <br />
3.  In the navigation pane on the left, choose "Register Your School" <br />
4.  Enter the school's Zip code and follow the prompts. <br />
5.  If your school already has a password, it will be listed.</p>

<p><strong>Career Direction</strong> is a true win-win program for the Army National Guard and your high schools!</p> 

<p>Please feel free to call or email me if I can help you use <strong>Career Direction</strong> more effectively. </p>

<p>Thank you,<br />
<strong>Career Training Concepts, Inc.</strong><br />
770  326-9229 ext. 4</p>

<p>&nbsp;</p>

<div align="center" class="small">
<p class="small"><span align="center" class="small"><strong><i>Career Direction</i></strong> -  Exploring Your Future Options</span><br />
<i>Yes! Every student has unique abilities. Recognize, encourage, inspire, guide, nurture success!</i></p>
</div>

</div>
</cfsavecontent>

<CFMAIL QUERY="GetRRM" FROM="#CD2Email#" TO="#EMail#" Subject="#SName# SEV Invitation. Please forward" type="html">
<!---<CFMAIL FROM="#CD2Email#" TO="tklatt@atavia.com" Subject="#SName# SEV Invitation. Please forward" type="html">--->
#mailBody#
</cfmail>

<!---============================This is the real message in the production site this should stay====================================--->
<cfsavecontent variable="mailBody2">

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

<cfoutput>
<table cellpadding="0" cellspacing="0" border="0" width="600">
	<tr>
		<td colspan="2" width="220" nowrap>
			Organization Name........................................
         </td> 
         <td colspan="2" width="380" nowrap>
         	#SName#
         </td>   
    </tr>
    <tr>
		<td colspan="2" nowrap>
			Contact Name................................................
         </td> 
         <td colspan="2" nowrap>
         	#FirstName# #MiddleI# #LastName#
         </td>   
    </tr>
   	<tr>
		<td colspan="2" nowrap>
			Address.........................................................
         </td> 
         <td colspan="2" nowrap>
         	#SAddress1#<br />
            <cfif #len(SAddress2)# gt 0>
            	#SAddress2#<br />
             </cfif>   
            #SCity#, #SState# #SZip#<br />                          
         </td>   
    </tr>
    <tr>
		<td colspan="2" nowrap>
			Phone...........................................................
         </td> 
         <td colspan="2" nowrap>
         	#Phone#
         </td>   
    </tr>
    <tr>
		<td colspan="2" nowrap>
			Fax................................................................
         </td> 
         <td colspan="2" nowrap>
         	#Fax#
         </td>   
    </tr> 	       
	<tr>
		<td colspan="2" nowrap>
			Email.............................................................
         </td> 
         <td colspan="2" nowrap>
         	#Email#
         </td>   
    </tr> 	       
	<tr>
		<td colspan="2" nowrap>
			Number of Juniors..................#INT(NumJuniors)#
         </td> 
    </tr>
    <tr>    
        <td colspan="2" nowrap>
			Number of Seniors..................#INT(NumSeniors)#
         </td> 
        
     </tr> 	       
	<tr>
		<td colspan="2" nowrap>
			Used CD before?..........................................
         </td> 
         <td colspan="2" nowrap>
         	#YesNoFormat(CDBefore)#
         </td>   
    </tr>
     <tr><td colspan="4" nowrap>&nbsp;</td></tr>
  	<tr>
		<td colspan="2" nowrap>
			National Guard E-Mail Contacts.....................
         </td> 
         <td colspan="2" nowrap>
         	#List_RRMEMails#
         </td>   
    </tr>      
</table>

</cfoutput>
 
</div>
</cfsavecontent>

<CFMAIL from="#AutoFrom#" to="#CD2Email#" Subject="Career Direction Request to CTC" type="html">
<!---<CFMAIL from="#AutoFrom#" to="tklatt@atavia.com" Subject="Career Direction Request to CTC" type="html">--->
#mailBody2#
</cfmail>
