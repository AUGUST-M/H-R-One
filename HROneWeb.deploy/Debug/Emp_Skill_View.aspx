﻿<%@ page language="C#" autoeventwireup="true" inherits="Emp_Skill_View, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/Emp_Common.ascx" TagName="Emp_Common" TagPrefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <input type="hidden" id="EmpSkillID" runat="server" name="ID" />
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
                    <asp:Label runat="server" Text="View Employee Skills" /> 
                </td>
            </tr>
        </table>
        
            
                
        
        <uc1:Emp_Common id="Emp_Common1" runat="server"></uc1:Emp_Common><br />
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <tb:DetailToolBar id="toolBar" runat="server"
                     NewButton_Visible="false" 
                     SaveButton_Visible="false" 
                     OnBackButton_Click="Back_Click"
                     OnEditButton_Click ="Edit_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                </td>
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
        <table border="0" width="100%" cellpadding="0" cellspacing="0" class="pm_field_section">
            <col width="15%" />
            <col width="35%" />
            <col width="15%" />
            <col width="35%" />
            <tr>
                <td class="pm_field_header" >
                    <asp:Label runat="server" Text="Skill" />:
                </td>
                <td class="pm_field" >
                    <asp:Label ID="SkillID" runat="server" />
                </td>
                <td class="pm_field_header" >
                    <asp:Label runat="server" Text="Skill Level" />:
                </td>
                <td class="pm_field" >
                    <asp:Label ID="SkillLevelID" runat="server"/>
                </td>
            </tr>
        </table>
</asp:Content> 