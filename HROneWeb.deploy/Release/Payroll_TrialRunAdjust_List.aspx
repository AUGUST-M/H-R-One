﻿<%@ page language="C#" autoeventwireup="true" inherits="Payroll_TrialRunAdjust_List, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>

<%@ Register Src="~/controls/EmployeeSearchControl.ascx" TagName="EmployeeSearchControl" TagPrefix="uc2" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Payroll Trial Run Adjustment" />
                </td>
            </tr>
        </table>
        <table width="100%" class="pm_section">
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label6" runat="server" Text="Payroll Group"/>:
                </td>
                <td class="pm_field">
                    <asp:DropDownList runat="server" ID="PayGroupID" AutoPostBack="true" OnSelectedIndexChanged="PayGroupID_SelectedIndexChanged" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="PayGroupID" EventName="SelectedIndexChanged" />
        </Triggers>

        <ContentTemplate >
            <asp:Panel ID="panelEmployeeList" runat="server">
                <asp:UpdatePanel ID="SearchUpdatePanel" runat="server" UpdateMode="Conditional" >
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
                </Triggers>

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
            <br /><br />
            
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
            <asp:UpdatePanel ID="ListUpdatePanel" runat="server" UpdateMode="Conditional" >
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Search" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
            </Triggers>

            <ContentTemplate >
            <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
                <col width="26px" />
                <col width="150px" />
                <col width="150px" />
                <col width="350px"/>
                <col width="150px" />
                <tr>
                    <td class="pm_list_header" align="center" >
                    </td>
                    <td align="left" class="pm_list_header" >
                        <asp:LinkButton runat="server" ID="_EmpNo" OnClick="ChangeOrder_Click" Text="EmpNo" />
                    </td>
                    <td align="left" class="pm_list_header" colspan="2" >
                        <asp:LinkButton runat="server" ID="_EmpEngFullName" OnClick="ChangeOrder_Click" Text="Name" />
                    </td>
                    <td align="left" class="pm_list_header" >
                        <asp:LinkButton runat="server" ID="_EmpAlias" OnClick="ChangeOrder_Click" Text="Alias" />
                    </td>
                </tr>
                <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td class="pm_list" align="center">
                                <asp:CheckBox ID="ItemSelect" runat="server" Visible="False" />
                            </td>
                            <td class="pm_list">
                                <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Payroll_TrialRunAdjust_View.aspx?EmpPayrollID=" + sbinding.getValue(Container.DataItem,"EmpPayrollID"))%>">
                                    <%#sbinding.getValue(Container.DataItem,"EmpNo")%>
                                </a>
                            </td>
                            <td class="pm_list" >
                                <%#sbinding.getValue(Container.DataItem,"EmpEngSurname")%>
                            </td>
                            <td class="pm_list">
                                <%#sbinding.getValue(Container.DataItem,"EmpEngOtherName")%>
                            </td>
                            <td class="pm_list">
                                <%#sbinding.getValue(Container.DataItem,"EmpAlias")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <tb:RecordListFooter id="ListFooter" runat="server"
                OnFirstPageClick="FirstPage_Click"
                OnPrevPageClick="PrevPage_Click"
                OnNextPageClick="NextPage_Click"
                OnLastPageClick="LastPage_Click"
              />
                </ContentTemplate>
            </asp:UpdatePanel>
            </asp:Panel> 
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content> 