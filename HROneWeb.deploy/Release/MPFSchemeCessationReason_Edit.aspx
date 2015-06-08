﻿<%@ page language="C#" autoeventwireup="true" inherits="MPFSchemeCessationReason_Edit, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>

<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

        <input type="hidden" id="MPFSchemeCessationReasonID" runat="server" />
        <input type="hidden" id="MPFSchemeID" runat="server" />
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="MPF Termination Code Setup" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <%=CurID<=0?HROne.Common.WebUtility.GetLocalizedString("Add"):HROne.Common.WebUtility.GetLocalizedString("Edit") %>
                    <asp:Label runat="server" Text="MPF Termination Code" />:
                    <%=MPFSchemeCessationReasonCode.Text%>
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
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openAlert(); return false;"/>
                </td>
            </tr>
        </table>        

        <table border="0" width="100%" cellpadding="0" cellspacing="0" class="pm_field_section">
            <col width="30%" />
            <col width="70%" />
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="MPF Scheme"/> :</td>
                <td class="pm_field">
                    <%=MPFScheme.MPFSchemeCode%>
                    -
                    <%=MPFScheme.MPFSchemeDesc%>
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Code" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="MPFSchemeCessationReasonCode" runat="Server" /></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label runat="server" Text="Description" />:</td>
                <td class="pm_field">
                    <asp:TextBox ID="MPFSchemeCessationReasonDesc" runat="Server" /></td>
            </tr>
        </table>

        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Cessation Reason List" />
                </td>
            </tr>
        </table>
        <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
            <col width="26px" />
            <col width="200px" />
            <tr>
                <td class="pm_list_header">
                </td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_CessationReasonCode" OnClick="ChangeOrder_Click" Text="Code"/>
                </td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_CessationReasonDesc" OnClick="ChangeOrder_Click" Text="Description"/>
                </td>
            </tr>
            <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="pm_list" align="center">
                            <asp:CheckBox ID="ItemSelect" runat="server" />
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem, "CessationReasonCode")%>
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem, "CessationReasonDesc")%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <table width="100%" cellspacing="0" cellpadding="0" class="pm_list_pagenav">
            <tr>
                <td align="right">
                    <tb:RecordListFooter id="ListFooter" runat="server"
                        ShowAllRecords="true" 
                    />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="toolbar"/>
        </Triggers>
        </asp:UpdatePanel >
</asp:Content> 