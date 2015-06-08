﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Edit, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/WebDatePicker.ascx" TagName="WebDatePicker" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

        <input type="hidden" id="UserID" runat="server" name="ID" />
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="User Maintenance" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <%=CurID<=0?HROne.Common.WebUtility.GetLocalizedString("Add"):HROne.Common.WebUtility.GetLocalizedString("Edit") %>
                    <asp:Label runat="server" Text="User" />:
                    <%=UserName.Text %>
                </td>
            </tr>
        </table>
        
            
                
        
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <tb:DetailToolBar id="toolBar" runat="server"
                     NewButton_Visible="false" 
                     EditButton_Visible="false" 
                     OnBackButton_Click="Back_Click"
                     OnSaveButton_Click ="Save_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                </td>
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" cellspacing="0" cellpadding="0" class="pm_field_section">
            <col width="20%" />
            <col width="30%" />
            <col width="20%" />
            <col width="30%" />
            <tr>
                <td class="pm_field_header" >
                    <asp:Label runat="server" Text="User ID" />:</td>
                <td class="pm_field" >
                    <asp:TextBox ID="LoginID" runat="Server" /></td>
                <td class="pm_field_header" >
                    <asp:Label runat="server" Text="User Name" />:</td>
                <td class="pm_field" >
                    <asp:TextBox ID="UserName" runat="Server" /></td>
            </tr>
            <tr >
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Status" />:</td>
                <td class="pm_field">
                    <asp:DropDownList ID="UserAccountStatus" runat="Server" /></td>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Expiry Date" />:</td>
                <td class="pm_field">
                    <uc1:WebDatePicker id="ExpiryDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Password" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="Password" TextMode="Password" runat="Server" /><br />
                </td>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Need to Change Password" />:</td>
                <td class="pm_field">
                    <asp:CheckBox ID="UserChangePassword" runat="Server" /></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Confirm Password" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="Password2" TextMode="Password" runat="Server" /><br />
                </td>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Change Password Period" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="UserChangePasswordPeriod" runat="Server" />
                    <asp:DropDownList ID="UserChangePasswordUnit" runat="Server" />
                </td>                
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label1" runat="server" Text="Login Fail Count" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="FailCount" runat="Server" /></td>
                <td class="pm_field_header">
                    <asp:Label ID="Label3" runat="server" Text="Modify user accounts with less permission only" />:
                </td>
                <td class="pm_field">
                    <asp:CheckBox ID="UsersCannotCreateUsersWithMorePermission" runat="Server"  />
                </td>                
                  
            </tr>               
        </table>
        <table border="0" width="100%" cellspacing="0" cellpadding="0" class="pm_field_section">
            <tr>
                <td class="pm_field_header" style="text-align: left;">
                    <asp:Label runat="server" Text="User Groups" />:</td>
                <td class="pm_field_header" style="text-align: left;">
                    <asp:Label ID="Label2" runat="server" Text="Companies" />:</td>
                <td class="pm_field_header" style="text-align: left;">
                    <asp:Label runat="server" Text="Ranks" />:</td>
            </tr>
            <tr>
                <td class="pm_field" valign="top">
                    <asp:Repeater ID="UserGroups" runat="server" OnItemDataBound="UserGroups_ItemDataBound">
                        <ItemTemplate>
                                <asp:CheckBox ID="ItemSelect" runat="server" />
                            <input type="hidden" runat="server" id="UserGroupID" />
                            <%# userGroupBinding.getValue(Container.DataItem,"UserGroupName")%>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
                <td class="pm_field" valign="top">
                    <asp:Repeater ID="Companies" runat="server" OnItemDataBound="Companies_ItemDataBound">
                        <ItemTemplate>
                                <asp:CheckBox ID="ItemSelect" runat="server" />
                            <input type="hidden" runat="server" id="CompanyID" />
                            <%#  companyBinding.getValue(Container.DataItem,"CompanyName")%>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
                <td class="pm_field" valign="top">
                    <asp:Repeater ID="Ranks" runat="server" OnItemDataBound="Ranks_ItemDataBound">
                        <ItemTemplate>
                                <asp:CheckBox ID="ItemSelect" runat="server" />
                            <input type="hidden" runat="server" id="RankID" />
                            <%#  rankBinding.getValue(Container.DataItem,"RankDesc")%>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
        <!-- Start 0000069, KuangWei, 2014-08-26 -->
        <table border="0" width="100%" cellspacing="0" cellpadding="0" class="pm_field_section">
            <tr>
                <td class="pm_field_header" colspan="3">
                    <asp:Label ID="Label4" runat="server" Text="Visible Payroll Group" />
                </td>
            </tr>
            <asp:Repeater ID="PayGroups" runat="server" OnItemDataBound="PayGroup_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td colspan="1">
                            &nbsp;&nbsp;<asp:CheckBox ID="ItemSelect" runat="server" />
                            <input type="hidden" runat="server" id="PayGroupID" />
                            <%# payGroupBinding.getValue(Container.DataItem, "PayGroupCode")%>
                        </td>
                        <td colspan="2">                            
                            <%# payGroupBinding.getValue(Container.DataItem, "PayGroupDesc")%> 
                        </td>
                    </tr>      
                </ItemTemplate>
            </asp:Repeater>            
        </table>
        <!-- End 0000069, KuangWei, 2014-08-26 -->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="toolbar"/>
        </Triggers>
        </asp:UpdatePanel >
</asp:Content> 