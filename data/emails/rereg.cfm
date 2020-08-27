<cfparam name="program" default="Career Train">

<cfif program eq "FF">
	<cfset ptype = "FutureFocus">
<cfelse>
	<cfset ptype = "Career Direction">
</cfif>

<cfif Len(#Email#)>

<cfset contact_name = #FirstName# & " " & #LastName#>

<cfif #Program# eq "FF">
<CFMAIL FROM="#FFEmail#" TO="#Email#" Subject="FutureFocus Password Verification"  Type="HTML">
<p>Dear school Counselor:</p>

<p>Thank you for your interest in <i><strong>FUTURE</strong>FOCUS</i> and the Careers 
and Occupations Guide. The password for your school has already
been issued and is verified as: </p>

<p>#Password#</p>

<p>This password may be used by anyone affiliated with your school, including students, parents, teachers, and counselors. </p>

<p>Again, thank you for your support of the Career Direction program.</p>

<p>The contact person we have on record for your school is #contact_Name#. To keep our records correct, we can only have one point of contact for each registered school. If you wish to change your school's point of contact, or update any of your school's registration information, please call us at 1-888-326-9229.</p>

<p>Thank you for your support of the <i><strong>FUTURE</strong>FOCUS</i> program.</p>

<p><strong>Career Training Concepts, Inc.</strong><br />
770  326-9229</p>

<a href="http://www.careertrain.com">www.careertrain.com</a>

</CFMAIL>

<cfelse> <!---program is Career Direction--->

<CFMAIL FROM="#CD2Email#" TO="#Email#" Subject="#ptype# Password Verification">
Dear school Counselor:

Thank you for your interest in #ptype# and the Careers 
and Occupations Guide. The password for your school has already
been issued and is verified as: 

#Password#

This password may be used by anyone affiliated with your school, including students, parents, teachers, and counselors. 

Again, thank you for your support of the Career Direction program.

Career Training Concepts, Inc.
888  326-9229

Yes! Every student has unique abilities. Recognize, encourage, inspire, guide, nurture success!

</CFMAIL>

</cfif> <!---If program eq FF--->
</cfif>