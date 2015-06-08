<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_Payroll_PayrollAllocationReport_Detail.aspx.cs" Inherits="Report_Payroll_PayrollAllocationReport_Detail" MasterPageFile="~/MainMasterPage.master"  %>

<%@ Register Src="~/controls/WebDatePicker.ascx" TagName="WebDatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/controls/EmployeeSearchControl.ascx" TagName="EmployeeSearchControl" TagPrefix="uc2" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>
<%@ Register Src="~/controls/ReportExportControl.ascx" TagName="ReportExportControl" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label ID="lblReportHeader" Text="Payroll Allocation Report - Details" runat="server" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Report Parameter" />
                </td>
            </tr>
        </table>
        <table width="100%" class="pm_section">
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label2" runat="server" Text="Payroll Period" />:
                </td>
                <td class="pm_field">
                    <uc1:WebDatePicker id="PayPeriodFr" runat="server" />
                    -
                    <uc1:WebDatePicker id="PayPeriodTo" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label3" Text="Company" runat="server" />
                    :
                </td>
                <td class="pm_field">
                    <asp:DropDownList ID="CompanyID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label4" Text="Group by Hierarchy Level" runat="server" />
                    :
                </td>
                <td class="pm_field">
                    <asp:DropDownList ID="HLevelID" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label1" Text="Show individuals contribution" runat="server" />
                    :
                </td>
                <td class="pm_field">
                    <asp:CheckBox ID="chkShowIndividuals" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="ListUpdatePanel" runat="server" UpdateMode="Conditional" >
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnGenerate" />
                        <asp:PostBackTrigger ControlID="btnGenerate2" />
                    </Triggers>

<%--                    <ContentTemplate >
                    <asp:Button ID="btnGenerate" runat="server" Text="Generate" CSSClass="button" OnClick="btnGenerate_Click" />
                    </ContentTemplate> 
--%>                    </asp:UpdatePanel> 
                </td>
                <td align="right">
                </td>
            </tr>
        </table> 
        <%-- Start 0000185, KuangWei, 2015-05-05 --%>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Employee Filter" />
                </td>
            </tr>
        </table>

    
        <asp:UpdatePanel ID="SearchUpdatePanel" runat="server" UpdateMode="Conditional" >
            <ContentTemplate >
                <uc2:EmployeeSearchControl id="EmployeeSearchControl1" runat="server" EmpStatusValue="A" />
            </ContentTemplate >
        </asp:UpdatePanel>
        
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" CssClass="button" OnClick="Search_Click" />
                    <asp:Button ID="Reset" runat="server" Text="Reset" CssClass="button" OnClick="Reset_Click" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Employee List" />
                </td>
            </tr>
        </table>
        
        
        
        
        <table width="100%" cellspacing="0" cellpadding="0" class="pm_list_pagenav">
            <tr>
                <td>
                    <asp:Button ID="btnGenerate" runat="server" Text="Generate" CSSClass="button" OnClick="btnGenerate_Click" />
                </td>
            </tr>
        </table>
        
        
        
        
        
        
        
        
        
        <ContentTemplate >
        <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
            <col width="26px" />
            <col width="150px" />
            <colgroup width="350px" >
                <col width="150px" />
                <col />
            </colgroup> 
            <col width="150px" />
            <col width="100px" />
            <tr>
                <td class="pm_list_header" align="center">
                    <input type="checkbox" onclick="checkAll('<%=Repeater.ClientID %>','ItemSelect',this.checked);" />
                </td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_EmpNo" OnClick="ChangeOrder_Click" Text="EmpNo" /></td>
                <td align="left" class="pm_list_header" colspan="2">
                    <asp:LinkButton runat="server" ID="_EmpEngFullName" OnClick="ChangeOrder_Click" Text="Name" /></td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_EmpAlias" OnClick="ChangeOrder_Click" Text="Alias" /></td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_EmpStatus" OnClick="ChangeOrder_Click" Text="Status" /></td>
            </tr>
            <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="pm_list" align="center">
                            <asp:CheckBox ID="ItemSelect" runat="server" />
                        </td>
                        <td class="pm_list">
                            <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Emp_View.aspx?EmpID=" + binding.getValue(Container.DataItem,"EmpID"))%>">
                                <%#binding.getValue(Container.DataItem,"EmpNo")%>
                            </a>
                        </td>
                        <td class="pm_list">
                            <%#binding.getValue(Container.DataItem,"EmpEngSurname")%>
                        </td>
                        <td class="pm_list">
                            <%#binding.getValue(Container.DataItem,"EmpEngOtherName")%>
                        </td>
                        <td class="pm_list">
                            <%#binding.getValue(Container.DataItem,"EmpAlias")%>
                        </td>
                        <td class="pm_list">
                            <%#binding.getValue(Container.DataItem,"EmpStatus")%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table width="100%" cellspacing="0" cellpadding="0" class="pm_list_pagenav">
            <tr>
                <td>
                    <asp:Button ID="btnGenerate2" runat="server" Text="Generate" CSSClass="button" OnClick="btnGenerate_Click" />
                </td>
                <td align="right">
                    <tb:RecordListFooter id="ListFooter" runat="server"
                        ShowAllRecords="true"
                      />
                </td>
            </tr>
        </table>
        </ContentTemplate>
    <%-- End 0000185, KuangWei, 2015-05-05 --%>            
</asp:Content> 