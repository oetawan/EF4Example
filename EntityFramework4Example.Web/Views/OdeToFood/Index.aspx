<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<RestaurantListViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Restaurant
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form method="get" data-otf-ajax="true" data-otf-action="OdeToFood/Index" id="searchForm" name="searchForm">
    <input type="text" id="searchTerm" name="searchTerm" data-otf-autocomplete="OdeToFood/AutoComplete"/>
    <input type="submit" value="Search" />
</form>

<%--<% using (Ajax.BeginForm(new AjaxOptions {
       HttpMethod = "get",
       InsertionMode = InsertionMode.Replace,
       UpdateTargetId = "restaurantList"})) { %>
    <input type="text" id="searchTerm" name="searchTerm" />
    <input type="submit" value="Search" />
<% } %>--%>

<h2>Restaurant</h2>
<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<%: Html.Partial("_Restaurant", Model) %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
