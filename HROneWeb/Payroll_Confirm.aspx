<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payroll_Confirm.aspx.cs"    Inherits="Payroll_Confirm" MasterPageFile="~/MainMasterPage.master" %>

<%@ Register Src="~/controls/Payroll_PeriodInfo.ascx" TagName="Payroll_PeriodInfo"
    TagPrefix="uc1" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>
<%-- Start 0000185, KuangWei, 2015-04-21 --%>
<%@ Register Src="~/controls/EmployeeSearchControl.ascx" TagName="EmployeeSearchControl" TagPrefix="uc2" %>
<%-- End 0000185, KuangWei, 2015-04-21 --%>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Payroll Confirmation" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Payroll Group Information" />
                </td>
            </tr>
        </table>
        <table width="100%" class="pm_section">
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Payroll Group" />:
                </td>
                <td class="pm_field">
                    <asp:DropDownList ID="PayGroupID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PayGroupID_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Payroll Cycle" />:
                </td>
                <td class="pm_field">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional"  >
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="PayGroupID" />
                    </Triggers>
                    <ContentTemplate>
                    <asp:DropDownList ID="PayPeriodID" runat="server" OnSelectedIndexChanged="PayPeriodID_SelectedIndexChanged"
                        AutoPostBack="True" />
                    </ContentTemplate> 
                    </asp:UpdatePanel> 
                </td>
            </tr>
        </table>
        <%-- Start 0000185, KuangWei, 2015-04-21 --%>
        <asp:UpdatePanel ID="SearchUpdatePanel" runat="server" UpdateMode="Conditional" >
            <ContentTemplate >
                <uc2:EmployeeSearchControl id="EmployeeSearchControl1" runat="server" />
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
        <%-- End 0000185, KuangWei, 2015-04-21 --%>        
        <asp:UpdatePanel ID="ListUpdatePanel" runat="server" UpdateMode="Conditional"  >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="PayGroupID" />
            <asp:AsyncPostBackTrigger ControlID="PayPeriodID" />
        </Triggers>
        <ContentTemplate>
        <asp:Panel ID="panelPayPeriod" runat="server">
            <input type="hidden" id="CurrentPayPeriodID" runat="server" name="ID" />
            <uc1:Payroll_PeriodInfo ID="ucPayroll_PeriodInfo" runat="server" />
            <asp:Panel ID="panelConfirmDetail" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Employee List" />
                        </td>
                    </tr>
                </table>
                <table class="pm_section" width="100%">
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openAlert(); return false;"/>
                        </td>
                    </tr>
                </table>
                <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
                    <col width="26px" />
                    <col width="75px" />
                    <colgroup width="200px" >
                        <col width="75px" />
                        <col />
                    </colgroup> 
                    <col width="75px" />
                    <col width="250px" />
                    <col width="100px" />
                    <tr>
                        <td class="pm_list_header" align="center">
                            <asp:Panel ID="ConfirmPayrollSelectAllPanel" runat="server">
                                <%-- Start 0000016, Miranda, 2014-05-30 --%>
                                <input type="checkbox" onclick="checkAll('<%=Repeater.ClientID %>','ItemSelect',this.checked);" checked="checked" />
                                <%-- End 0000016, Miranda, 2014-05-30 --%>
                            </asp:Panel>
                        </td>
                        <td align="left" class="pm_list_header">
                            <asp:LinkButton runat="server" ID="_EmpNo" OnClick="ChangeOrder_Click" Text="EmpNo" />
                        </td>
                        <td align="left" class="pm_list_header" colspan="2">
                            <asp:LinkButton runat="server" ID="_EmpEngFullName" OnClick="ChangeOrder_Click" Text="Name" />
                        </td>
                        <td align="left" class="pm_list_header">
                            <asp:LinkButton runat="server" ID="_EmpAlias" OnClick="ChangeOrder_Click" Text="Alias" />
                        </td>
                        <td align="left" class="pm_list_header">
                            <asp:LinkButton runat="server" ID="_EmpPayIsRP" OnClick="ChangeOrder_Click" Text="Type" />
                        </td>
                        <td align="left" class="pm_list_header">
                            <asp:LinkButton runat="server" ID="_EmpPayTrialRunDate" OnClick="ChangeOrder_Click" Text="Trial Run Date" />
                        </td>
                        <td align="left" class="pm_list_header">
                            <asp:LinkButton runat="server" ID="_EmpPayTrialRunBy" OnClick="ChangeOrder_Click" Text="Trial Run By" />
                        </td>
                    </tr>
                    <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="pm_list" align="center">
                                    <asp:CheckBox ID="ItemSelect" runat="server" Checked="True" />
                                </td>
                                <td class="pm_list">
                                    <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Payroll_TrialRunAdjust_View.aspx?EmpPayrollID=" + sbinding.getValue(Container.DataItem,"EmpPayrollID"))%>">
                                        <%#sbinding.getValue(Container.DataItem, "EmpNo")%>
                                    </a>
                                </td>
                                <td class="pm_list">
                                    <%#sbinding.getValue(Container.DataItem, "EmpEngSurname")%>
                                </td>
                                <td class="pm_list">
                                    <%#sbinding.getValue(Container.DataItem, "EmpEngOtherName")%>
                                </td>
                                <td class="pm_list">
                                    <%#sbinding.getValue(Container.DataItem, "EmpAlias")%>
                                </td>
                                <td class="pm_list">
                                    <asp:Label ID="Type" runat="server" />
                                </td>
                                <td class="pm_list">
                                    <%#sbinding.getFValue(Container.DataItem, "EmpPayTrialRunDate","yyyy-MM-dd HH:mm:ss")%>
                                </td>
                                <td class="pm_list">
                                    <asp:Label ID="EmpPayTrialRunBy" runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <table width="100%" cellspacing="0" cellpadding="0" class="pm_list_pagenav">
                    <tr>
                        <td align="left">
                        <asp:PlaceHolder ID="ConfirmButtonSection" runat="server" >
                            <asp:Label ID="Label1" runat="server" Text="Remark" ForeColor="black" />:
                            <asp:TextBox ID="txtRemark" runat="server" Columns="50" />
                            <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CSSClass="button" OnClick="btnConfirm_Click" />
                        </asp:PlaceHolder>
                        </td>
                        <td align="right">
                            <tb:RecordListFooter id="ListFooter" runat="server"
                                ShowAllRecords="true" visible="true" 
                              />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content> 