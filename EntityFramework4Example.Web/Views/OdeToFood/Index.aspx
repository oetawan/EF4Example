<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<OdeToFood.Models.RestaurantListViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Restaurant
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form method="get">
    <input type="text" id="searchTerm" name="searchTerm" />
    <input type="submit" value="Search" />
</form>
<h2>Restaurant</h2>
<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<% foreach(var item in Model) { %>
    <%: Html.Partial("_Review", item) %>
<% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
