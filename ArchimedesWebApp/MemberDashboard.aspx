﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Archimedes.Master" AutoEventWireup="true" CodeBehind="MemberDashboard.aspx.cs" Inherits="ArchimedesWebApp.MemberDashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 id="page_title">Member Dashboard &#8226; <span><asp:Label ID="lblMemberName" runat="server" /></span></h2>
    <asp:GridView ID="GVTimeLogs" runat="server" AutoGenerateColumns="False" DataSourceID="DSTimeLogs">
        <Columns>
            <asp:TemplateField HeaderText="Date/Time Created">
                <ItemTemplate>
                    <asp:Label ID ="lblEntryStartTime" 
                        runat="server" 
                        Text='<%#Eval("entry_begin_time") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hours Logged">
                <ItemTemplate>
                    <asp:Label ID ="lblEntryTotalTime" 
                        runat="server" 
                        Text='<%#Eval("hours_logged") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label ID ="lblCategoryName" 
                        runat="server" 
                        Text='<%#Eval("category_name") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="DSTimeLogs" 
                   runat="server" 
    ConnectionString="<%$ ConnectionStrings:SEI_TimeMachine2ConnectionString %>" 
    SelectCommand="SELECT entry.entry_begin_time, entry.entry_total_time / 60.0 AS hours_logged, category.category_name 
                    FROM [SEI_TimeMachine2].[dbo].[ENTRY] 
                    JOIN [SEI_TimeMachine2].[dbo].[CATEGORY] ON (entry.entry_category_id = category.category_id) 
                    WHERE entry.[entry_user_id] = @UserID;">
    <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="UserID"/>
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
