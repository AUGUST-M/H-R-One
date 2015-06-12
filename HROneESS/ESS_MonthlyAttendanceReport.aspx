<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ESS_MonthlyAttendanceReport.aspx.cs" Inherits="ESS_MonthlyAttendanceReport" MasterPageFile="~/MainMasterPage.master"  %>

<%@ Register Src="~/controls/Emp_info.ascx" TagName="Emp_info" TagPrefix="uc1" %>
<%@ Register Src="~/controls/WebDatePicker.ascx" TagName="WebDatePicker" TagPrefix="uc1" %>

<asp:Content ID="bannerContent" runat="server" ContentPlaceHolderID="bannerContentPlaceHolder" > 
    <table width="898px" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>
            <a href="ESS_Home.aspx">
                <img src="images/banner17_01.jpg" alt="" style="border-width: 0px; display : block" />
            </a>
        </td>
        <td valign="bottom" >
            <img src="images/banner17_02.jpg" alt="" style="border-width: 0px; display : block" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img src="images/banner17_03.jpg" alt="" style="border-width: 0px; display : block" />
        </td>
      </tr>
    </table>
</asp:Content> 
<asp:Content ID="mainContent" runat="server" ContentPlaceHolderID="mainContentPlaceHolder" > 

    <!-- WebControl-->
    <uc1:Emp_info ID="Emp_info1" runat="server" />
    <!-- End WebControl-->
    <br/>
    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="pm_field_section">
        <col width="15%" />
        <col width="85%" />
        <tr >
            <td colspan="2" class="pm_field_title">
                <asp:Label ID="Label2" Text="Monthly Attendance Report" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="pm_field_header">
            <!-- Start 0000209, Miranda, 2015-06-11 -->
                <asp:Label ID="lblHeader" runat="server" Text="As Of Date" />:
            <!-- End 0000209, Miranda, 2015-06-11 -->
            </td>
            <td class="pm_field">
                <uc1:WebDatePicker ID="AsOfDate" runat="server" />
                <asp:Button ID="btnGenerate" runat="server" Text="Preview" OnClick="btnGenerate_Click" /> <!--OnClientClick="this.form.target='_blank'"/> -->
            </td>
        </tr>
    </table>
</asp:Content> 