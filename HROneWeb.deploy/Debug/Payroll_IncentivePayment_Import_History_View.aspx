﻿<%@ page language="C#" autoeventwireup="true" inherits="Payroll_IncentivePayment_Import_History_View, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>

<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="footer" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <input type="hidden" id="IPImportBatchID" runat="server"  name="ID" />
        
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label ID="ILabel1" Text="Incentive Payment Import History" runat="server" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label ID="ILabel2" Text="Import Details" runat="server" />
                </td>
            </tr>
        </table>
        <table class="pm_section" width="100%">
            <col width="20%" />
            <col width="80%" />
            <tr>
                <td class="pm_field_header" >
                    <asp:Label ID="Label1" runat="server" Text="Import Date" />
                </td>
                <td class="pm_field">
                    <asp:Label ID="IPImportBatchDateTime" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label2" runat="server" Text="Imported by" />
                </td>
                <td class="pm_field">
                    <asp:Label ID="IPImportBatchUploadedBy" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label3" runat="server" Text="Remark" />
                </td>
                <td class="pm_field">
                    <asp:Label ID="IPImportBatchRemark" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                        <tb:DetailToolBar id="toolBar" runat="server"
                         NewButton_Visible="false" 
                         EditButton_Visible="false" 
                         SaveButton_Visible="false"
                         CustomButton1_Visible="false" 
                         DeleteButton_Visible="false" 
                         OnBackButton_Click="Back_Click"
                          />
                        <asp:Button runat="server" ID="btnUndo" OnClick="Undo_Click" Text="Undo" CssClass="button" />
                </td>
            </tr>
        </table>
        
        <asp:UpdatePanel ID="ListUpdatePanel" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="toolbar"/>
        </Triggers>
        <ContentTemplate >
        <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
            <col width="26px" />
            <col width="50px" />
            <col width="100px" />
            <col width="200px" />
            <col width="100px" />
            <col width="100px" />
            <col width="75px" />
            <tr>
                <td class="pm_list_header" >
                </td>
                <td align="left" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_EmpNo" OnClick="ChangeOrder_Click" Text="EmpNo" /></td>
                <td align="left" class="pm_list_header" colspan="2">
                    <asp:LinkButton runat="server" ID="_EmpEngFullName" OnClick="ChangeOrder_Click" Text="Name" /></td>
                <td align="left" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_EmpAlias" OnClick="ChangeOrder_Click" Text="Alias" /></td>
                <td align="left" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_IPEffDate" OnClick="ChangeOrder_Click" Text="As At Date" /></td>
                <td align="right" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_IPPercent" OnClick="ChangeOrder_Click" Text="Achievement(%)" />
                </td>
                <td class="pm_list_header"></td>
            </tr>
            <asp:DataList ID="Repeater" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"
                ShowFooter="false" ShowHeader="false" OnItemDataBound="Repeater_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="pm_list" align="center" >
                            <input type="hidden" runat="server" id="IPID" />
                        </td>
                        <td class="pm_list">
                            <%--
                            <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Payroll_IncentivePayment_View.aspx?EmpID=" + sbinding.getValue(Container.DataItem,"EmpID"))%>">
                                <%#sbinding.getValue(Container.DataItem,"EmpNo")%>
                            </a>
                            --%>
                            
                            <%#sbinding.getValue(Container.DataItem,"EmpNo")%>
                            
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem,"EmpEngSurname")%>
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem,"EmpEngOtherName")%>
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem,"EmpAlias")%>
                        </td>
                        <td class="pm_list">
                            <asp:Label ID="IPEffDate" runat="server" />
                        </td>                        
                        <td class="pm_list" align="right">
                            <asp:Label ID="IPPercent" runat="server" />
                        </td>
                        <td class="pm_list"></td>
                    </tr>
                </ItemTemplate>
<%--                <AlternatingItemTemplate>
                    <tr>
                        <td class="pm_list_alt_row" align="center" rowspan="2">
                            <input type="hidden" runat="server" id="Hidden1" />
                        </td>
                        <td class="pm_list_alt_row">
                            <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Payroll_IncentivePayment_View.aspx?EmpID=" + sbinding.getValue(Container.DataItem,"EmpID"))%>">
                                <%#sbinding.getValue(Container.DataItem,"EmpNo")%>
                            </a>
                        </td>
                        <td class="pm_list_alt_row">
                            <%#sbinding.getValue(Container.DataItem,"EmpEngSurname")%>
                        </td>
                        <td class="pm_list_alt_row">
                            <%#sbinding.getValue(Container.DataItem,"EmpEngOtherName")%>
                        </td>
                        <td class="pm_list_alt_row">
                            <%#sbinding.getValue(Container.DataItem,"EmpAlias")%>
                        </td>
                        <td class="pm_list_alt_row" align="right">
                            <asp:Label ID="IPPercent" runat="server" />
                        </td>
                        <td class="pm_list_alt_row" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td class="pm_list_alt_row" align="right">
                            <asp:Label ID="ILabel2" runat="server" Text="Remark" />
                        </td>
                        <td class="pm_list_alt_row" colspan="8">
                            <asp:Label ID="CNDRemark" runat="server" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
--%>
            </asp:DataList>
        </table>
        <table width="100%" cellspacing="0" cellpadding="0" class="pm_list_pagenav">
            <tr>
                <td align="right">
                    <footer:RecordListFooter id="ListFooter" runat="server"
                        OnFirstPageClick="ChangePage"
                        OnPrevPageClick="ChangePage"
                        OnNextPageClick="ChangePage"
                        OnLastPageClick="ChangePage"
                      />
                </td>
            </tr>
        </table>
        </ContentTemplate> 
        </asp:UpdatePanel >
</asp:Content> 