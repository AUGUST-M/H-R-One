﻿<%@ page language="C#" autoeventwireup="true" inherits="EmpTab_Family_View, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>

<%@ Register Src="~/controls/Emp_Spouse_List.ascx" TagName="Emp_Spouse_List" TagPrefix="uc2" %>
<%@ Register Src="~/controls/Emp_Dependant_List.ascx" TagName="Emp_Dependant_List"
    TagPrefix="uc3" %>
<%@ Register Src="~/controls/Emp_Common.ascx" TagName="Emp_Common" TagPrefix="uc1" %>
<%@ Register Src="~/controls/Emp_LeftMenu.ascx" TagName="Emp_LeftMenu" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <input type="hidden" id="EmpID" runat="server" name="ID" />
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label Text="Employee Information" runat="server" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label Text="Employee Profile" runat="server" />
                    :
                    <%=Emp_Common1.obj.EmpEngSurname %>
                    <%=Emp_Common1.obj.EmpEngOtherName%>
                </td>
            </tr>
        </table>
        
            
                
        
        <table width="100%" class="pm_section" cellpadding="0" cellspacing="0">
            <col width="10%" />
            <tr>
                <td valign="top" align="left" >
                    <uc1:Emp_LeftMenu ID="Emp_LeftMenu2" runat="server" />
                </td>
                <td valign="top">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Button ID="Back" runat="server" Text="- Back -" OnClick="Back_Click" UseSubmitBehavior="false"
                                    cssclass="button" />
                            </td>
                            <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                            </td>
                            <!-- Start 0000173, Miranda, 2015-04-26 -->
                            <td class="pm_search" align="right">
                                <asp:TextBox runat="server" ID="EmpNo" />
                                <asp:Button ID="Jump" runat="server" Text="Jump" CssClass="button" OnClick="Jump_Click" />
                            </td>
                            <!-- End 0000173, Miranda, 2015-04-26 -->
                        </tr>
                    </table>
                    <uc1:Emp_Common ID="Emp_Common1" runat="server" />
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Spouse" />
                            </td>
                        </tr>
                    </table>
                    <uc2:Emp_Spouse_List ID="Emp_Spouse_List1" runat="server" />
                    <br />
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Dependant" />
                            </td>
                        </tr>
                    </table>
                    <uc3:Emp_Dependant_List ID="Emp_Dependant_List1" runat="server"></uc3:Emp_Dependant_List>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td align="right">
                </td>
            </tr>
        </table>
</asp:Content> 