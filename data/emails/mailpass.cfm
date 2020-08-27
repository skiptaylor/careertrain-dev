<cfif program eq "FF">
	<cfset ptype = "FutureFocus">
<cfelse>
	<cfset ptype = "Career Direction">
</cfif>

<cfif program eq "FF">

<CFMAIL FROM="#FFEmail#" TO="#Email#" Subject="#ptype# Password Issued for Your School" type="html">

<p>Dear school Counselor,</p>

<p>Thank you for selecting <i><strong>FUTURE</strong>FOCUS</i> as your career exploration tool this year!</p> 

<p>The <i><strong>FUTURE</strong>FOCUS</i> Web site password for your school is: #password#</p>

<p>You and your students may use this password at our Web site to generate reports based on the students' <i><strong>FUTURE</strong>FOCUS</i> Interest Inventory results. These personalized reports provide valuable academic and vocational planning information. Here are the Web site instructions your students will follow after they complete the <i><strong>FUTURE</strong>FOCUS</i> Interest Inventory:</p>

<ul>
<li>After completing the <i><strong>FUTURE</strong>FOCUS</i> Interest Inventory, students go to www.careertrain.com </li>
<li>Click on the "Career and Occupations Guide" on the top left of the page.</li>
<li>Enter your school's password</li>
<li>Enter your name and the letters of the 3 occupational categories you scored highest in (see list below), then click "Submit"</li>
</ul>

<p>   
    A -	Outdoor <br /> 
    B -  Arts / Communications <br />
    C -	Business / Management <br />
    D -	Clerical / Administrative <br />
    E -  Protective / Military Service <br />
    F -	Technology  <br />
    G -	Public Service   <br />
    H -	Science / Mathematics <br />
    I -	Social / Helping <br />
</p>

<p>By entering three occupational category letters, three reports are generated. Since occupational interests can change over time, this blend of three interests is more informative then focusing on just one interest category. The personalized reports have valuable information that will help students prepare for their high school education and beyond.</p>

<p>Students can access these reports from home, from school, from the library... wherever they have access to the Web. And this service is provided at no extra cost to themselves or to the school! We have also provided helpful Web links that students may use for further research.</p>

<p>We are confident that you will find <i><strong>FUTURE</strong>FOCUS</i> is the right program to help inform and inspire your students as they begin the critical process of exploring their future education and career options. If there is any way we can help you with the administration of the <i><strong>FUTURE</strong>FOCUS</i> program, please don't hesitate to let us know.</p>

<p>
Thank you, <br />
<strong>Career Training Concepts, Inc.</strong><br />
888  326-9229<br />
<a href="http://www.careertrain.com">www.careertrain.com</a>
</p>


</CFMAIL>
</cfif>

<!---===================================================Career Direction============================================================--->

<cfif program eq "CD">

<cfsavecontent variable="mailBody">

<style type="text/css"><!--
body, span, div, p, pre, table, tr, th, td, input{
	font-family :  Arial, CG Omega, Courier New;
	color: #000000;
	font-size: 14px;
	}
	.small{
	font-family : Arial, Courier New;
	color: #000000;
	font-size: 12px;
	}	
	
	u {text-decoration: none;  border-bottom: 1px solid #000000; } 

	--></style> 

<div style="width: 900px;">
    
<p>Dear Educator,</p>

<p>A password has been issued for your students to use with the <strong>Career Direction 2</strong> workshop presented by your National Guard Representative. </p>

<p align="center">Your school's password is: <span style="background-color: #ffff00"><strong><cfoutput>#Password#</cfoutput></strong></span></p>

<p><strong>Career Direction 2</strong> is truly unlike any other career guidance program in terms of the comprehensive approach it takes to helping students think about and plan their futures. The ARNG offers this valuable workshop for free to secondary and post-secondary schools and organizations. </p>

<p>Students use the password to generate personalized academic/vocational reports and to access the resume tool. </p>

<p>Sample report: <a href="http://www.careertrain.com/reports/sample/report1.htm">http://www.careertrain.com/reports/sample/report1.htm</a> <br>
Resum&eacute; tool: <a href="http://www.careertrain.com/cdStudentResum&eacute;Temp.cfm">http://www.careertrain.com/cdStudentResum&eacute;Temp.cfm </a> </p>

<p>If after one week you have not yet been contacted to schedule a <strong>Career Direction 2</strong> workshop, or if you need more information, please call or email me. </p>

<p>Thank you,<br /> 
<span class="small">Educational Programs Director <br />
<strong>Career Training Concepts, Inc.</strong></span><br />
(888) 326-9229<br />
<a href="http://www.careertrain.com">www.careertrain.com</a>
</p>
<div align="center" class="small">
<p class="small"><span align="center" class="small"><strong><i>Career Direction</i></strong> -  Exploring Your Future Options</span><br />
<i>Yes! Every student has unique abilities. Recognize, encourage, inspire, guide, nurture success!</i></p>
</div>
</div>
</cfsavecontent>

<!---<CFMAIL FROM="Janet King <#CD2Email#>" TO="#Email#" Subject="Career Direction Password Issued for #SName#" type="html">--->
<CFMAIL FROM="#CD2Email#" TO="#Email#" Subject="Career Direction Password Issued for #SName#" type="html">
#mailBody#
</cfmail>

</cfif>


<cfif program eq "FF">

<!---===============================this message stays, it remed for testing purposes only==============================--->
<cfmail to="#CD2Email#" from="careertrain_website@careertrain.com" subject="FUTUREFOCUS Registration Notice to CTC" type="html">

<p>A <i><strong>FUTURE</strong>FOCUS</i> password has been issued for the following school:</p>

<p>The school's password is #password#</p>


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
	
</table>

<p>Comments:<br />
#Comments#</p>

</cfmail>
<!---===================================================================================================================--->
</cfif>
<!---====================================this is the message that goes into production test message is below======================--->

<cfif program eq "CD">

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
    <cfoutput>
<p>The school's password is #password#</p>

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
			Mailing Address (if different)..........................
         </td> 
         <td colspan="2" nowrap>
         	#MAddress1#<br />
            <cfif #len(SAddress2)# gt 0>
            	#MAddress2#<br />
             </cfif>   
            #MCity#, #MState# #MZip#<br />                          
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
  	<tr>
		<td colspan="2" nowrap>
			National Guard Representative.....................
         </td> 
         <td colspan="2" nowrap>
         	#NGRep#
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

<p>Comments:</p>
<p>#Comments#</p>
</cfoutput>
</div>
</cfsavecontent>

<CFMAIL to="#CD2Email#" from="careertrain_website@careertrain.com" Subject="Career Direction Registration Notice" type="html">
<!---<CFMAIL to="tklatt@atavia.com" from="careertrain_website@careertrain.com" Subject="Career Direction Registration Notice" type="html">--->
#mailBody#
</cfmail>

</cfif>

<!---===========================================Trail Blazers============================================--->

<cfif program eq "TB">

<CFMAIL FROM="#CD2Email#" TO="#Email#" Subject="TrailBlazer Password Verification to Unit POC" type="html">

<p>Dear RRNCO:</p>

<p>Thank you for your interest in <i><strong>Trail</strong>Blazer</i> and the Careers and Occupations Guide. The password for your unit has already been issued and is verified as: </p>

<p>#Password#</p>

<p>Here are the Web site instructions for generating an online report to interpret the TBII scores. </p>
 
  <ul>
   <li> After completing the TBII*, go to <a href="http://www.careertrain.com">www.careertrain.com</a> </li>
   <li> Click on the "Career and Occupations Guide" tab (top left) </li>
   <li> Enter your unit's password </li>
   <li> Enter name, the letters of the top 3 occupational categories you scored highest in</li>
   <li> Click "Submit"</li> 
  </ul> 
	
  <p> 
    A -	Outdoor <br />
    B - 	Arts / Communications<br />
    C -	Business / Management<br />
    D -	Clerical / Administrative<br />
    E - 	Protective / Military Service<br />
    F -	Technology <br />
    G -	Public Service  <br />
    H -	Science / Mathematics <br />
    I -	Social / Helping <br />
</p>

<p>By entering three scores, three reports are generated using all three possible combinations.  </p>

<p>Again, thank you for your support of the <strong>Trail</strong>Blazer</i> program.<br />
<strong>Career Training Concepts, Inc.</strong><br />
770  326-9229 <br />
<a href="http://www.careertrain.com">www.careertrain.com</a>
</p>

</CFMAIL>

<!---=================================Mail to RRNCO confirmation=========================================--->

<CFMAIL FROM="#CD2Email#" TO="#Email#" Subject="TrailBlazer Password for Unit POC" type="html">

<p>Dear RRNCO,</p>

<p>A password has been issued for your unit members to use with the <strong>Trail</strong>Blazer</i> Interest Inventory they will complete as a part of the TrailBlazer workshop.  </p>

<p>Your unit's password is:  <strong>#Password#</strong></p>

<p><strong>Trail</strong>Blazer</i> is truly unlike any other career guidance program in terms of the comprehensive approach it takes to helping people think about and plan their futures. </p>

<p>Use our Web site to generate personalized reports which are useful for academic and vocational planning.</p>

<p>Here are the Web site instructions:</p>
 
  <ul>
   <li> After completing the TBII*, go to <a href="http://www.careertrain.com">www.careertrain.com</a> </li>
   <li> Click on the "Career and Occupations Guide" tab (top left) </li>
   <li> Enter your unit's password </li>
   <li> Enter name, the letters of the top 3 occupational categories you scored highest in</li>
   <li> Click "Submit"</li> 
  </ul> 
	
  <p> 
    A -	Outdoor <br />
    B - 	Arts / Communications<br />
    C -	Business / Management <br />
    D -	Clerical / Administrative <br />
    E - 	Protective / Military Service <br />
    F -	Technology <br />
    G -	Public Service  <br />
    H -	Science / Mathematics <br />
    I -	Social / Helping <br />
</p>

<p>By entering three scores, three reports are generated using all three possible combinations.  </p>

<p><sup>*</sup> TrailBlazer is copyrighted and cannot be reproduced. </p>

<strong>Career Training Concepts, Inc.</strong><br />
770  326-9229 <br />
<a href="http://www.careertrain.com">www.careertrain.com</a>
</p>

</CFMAIL>

</cfif>