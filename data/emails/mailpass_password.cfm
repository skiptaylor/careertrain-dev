<cfif program eq "FF">
	<cfset ptype = "FutureFocus">
<cfelse>
	<cfset ptype = "Career Direction">
</cfif>

<cfif program eq "FF">

<CFMAIL FROM="#FFEmail#" TO="#Email#" Subject="#ptype# Password Issued for Your School">
Dear Educator,

Thank you for selecting FUTUREFOCUS as your career exploration tool this year! 

The FUTUREFOCUS Web site password for your school is: #password#

You and your students may use this password at our Web site to generate reports based on the students' FUTUREFOCUS Interest Inventory results. These personalized reports provide valuable academic and vocational planning information. Here are the Web site instructions your students will follow after they complete the FUTUREFOCUS Interest Inventory:

    · After completing the FUTUREFOCUS Interest Inventory, students go to www.careertrain.com 
    · Click on the "Career and Occupations Guide" tab
    · In the drop down menu, select "Student Reports."
    · Enter your school's password
    · Enter your name and the letters of the 3 occupational categories you scored highest in (see list below), then click "Submit"

    A -	Outdoor 
    B -  Arts / Communications
    C -	Business / Management
    D -	Clerical / Administrative
    E -  Protective / Military Service
    F -	Technology 
    G -	Public Service  
    H -	Science / Mathematics
    I -	Social / Helping

By entering three occupational category letters, three reports are generated. Since occupational interests can change over time, this blend of three interests is more informative then focusing on just one interest category. The personalized reports have valuable information that will help students prepare for their high school education and beyond.

Students can access these reports from home, from school, from the library... wherever they have access to the Web. And this service is provided at no extra cost to themselves or to the school! We have also provided helpful Web links that students may use for further research.

I am confident that you will find FUTUREFOCUS is the right program to help inform and inspire your students as they begin the critical process of exploring their future education and career options. If there is any way I can help you with the administration of the FUTUREFOCUS program, please don't hesitate to let me know.
</CFMAIL>

<cfelse>

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

<p>A password has been issued for your students to use with the <strong>Career Direction</strong> workshop presented by your National Guard Representative. </p>

<p align="center">Your school's password is: <span style="background-color: #ffff00"><strong><cfoutput>#Password#</cfoutput></strong></span></p>

<p><strong>Career Direction</strong> is truly unlike any other career guidance program in terms of the comprehensive approach it takes to helping students think about and plan their futures. The ARNG offers this valuable workshop for free to secondary and post-secondary schools and organizations. </p>

<p>Students use the password to generate personalized academic/vocational reports and to access the resume tool. </p>

<p>Sample report: <a href="http://www.careertrain.com/reports/sample/report1.htm">http://www.careertrain.com/reports/sample/report1.htm</a> <br>
Resume tool: <a href="http://www.careertrain.com/cdStudentResumeTemp.cfm">http://www.careertrain.com/cdStudentResumeTemp.cfm </a> </p>

<p>If after one week you have not yet been contacted to schedule a <strong>Career Direction</strong> workshop, or if you need more information, please call or email me. </p>

<p>Thank you,<br /> 
<span class="small"><strong>Career Training Concepts, Inc.</strong></span><br />
(888) 326-9229<br />
<a href="http://www.careertrain.com">www.careertrain.com</a>
</p>
<div align="center" class="small">
<p class="small"><span align="center" class="small"><strong><i>Career Direction</i></strong> -  Exploring Your Future Options</span><br />
<i>Yes! Every student has unique abilities. Recognize, encourage, inspire, guide, nurture success!</i></p>
</div>
</div>
</cfsavecontent>

<CFMAIL FROM="#CD2Email#" TO="#Email#" Subject="Career Direction Password Issued for Your School" type="html">
#mailBody#
</cfmail>

</cfif>