﻿<%@ control language="C#" autoeventwireup="true" inherits="LeaveApplicationCancel_Form, HROneESS.deploy" %>

<input type="hidden" id="LeaveAppID" runat="server" />
<input type="hidden" id="EmpID" runat="server" />
<table width="100%" border="0" cellpadding="5" cellspacing="0" class="pm_field_section">
    <col width="15%" />
    <col width="35%" />
    <col width="15%" />
    <col width="35%" />
    <tr >
        <td colspan="4" class="pm_field_title">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="4" >
                    <asp:Label ID="lblHeader" runat="server" EnableViewState="false" Text="Leave Application Cancellation" /> :
                </td>
            </tr>
        </table>
        </td>
    </tr>
<%--    <tr >
        <td class="pm_field_header">
            <asp:Label ID="Label5" EnableViewState="false" Text="Name of Applicant" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:Label ID="EmpName" runat="Server" />
        </td>
    </tr>--%>
    <tr  >
        <td class="pm_field_header">
            <asp:Label ID="Label1" EnableViewState="false" Text="Leave Code" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;">
            <asp:Label ID="LeaveCodeID" runat="Server" />
        </td>
        <td class="pm_field_header">
            <asp:Label ID="Label2" EnableViewState="false" Text="Type" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;">
            <asp:Label ID="LeaveAppUnit" runat="Server"/>
        </td>
    </tr>
    <tr  >
        <td class="pm_field_header">
            <asp:Label ID="Label3" EnableViewState="false" Text="Date From" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:Label ID="LeaveAppDateFrom" runat="Server"  />
        </td>                        
    </tr>
    <tr id="LeaveAppDateToPlaceHolder" runat="server" >
        <td class="pm_field_header">
            <asp:Label ID="Label4" EnableViewState="false" Text="Date To" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3" >
            <asp:Label ID="LeaveAppDateTo" runat="Server" />
        </td>
    </tr>
    <tr id="TimeRow" runat="server" >
        <td class="pm_field_header">
            <asp:Label ID="Label8" EnableViewState="false" Text="Time" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:Label ID="LeaveAppTimeFrom" runat="Server" />-
            <asp:Label ID="LeaveAppTimeTo" runat="Server" />
        </td>
    </tr>
    <tr >
        <td class="pm_field_header">
            <asp:Label ID="Label6" EnableViewState="false" Text="Days Taken" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:Label ID="LeaveDays" runat="Server" />
        </td>
    </tr>
    <tr runat="server" id="HoursClaimPanel">
        <td class="pm_field_header">
            <asp:Label ID="Label10" EnableViewState="false" Text="Hours Claim" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" >
            <asp:Label ID="LeaveAppHours" runat="Server" />
        </td>
    </tr>
    <tr  >
        <td class="pm_field_header">
            <asp:Label ID="Label7" EnableViewState="false" Text="Remark" runat="server" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:Label ID="LeaveAppRemark" runat="Server" />
        </td>
    </tr>
    <tr id="LeaveCodeIsShowMedicalCertOptionPanel" runat="server">
        <td class="pm_field_header">
           <!-- Start 0000048, Miranda, 2014-06-03 -->
           <asp:Label ID="Label9" EnableViewState="false" Text="Relevant Certificate" runat="server" />:
           <!-- End 0000048, Miranda, 2014-06-03 -->
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:Label ID="LeaveAppHasMedicalCertificate" runat="Server" />
        </td>
    </tr>
    <tr >
        <td class="pm_field_header">
            <asp:Label ID="Label11" runat="server" EnableViewState="false" Text="Reason for Cancel" />:
        </td>
        <td class="pm_field" style="background-color:White;" colspan="3">
            <asp:TextBox ID="RequestLeaveAppCancelReason" runat="server" TextMode="MultiLine" Columns="35" Rows="5" />
        </td>
    </tr>
    <tr>
        <td align="right" colspan="4" >
            <asp:Button ID="btnSubmit" runat="server" EnableViewState="false" Text="Submit" OnClick="btnSubmit_Click" />
        </td>
    </tr>
</table>
