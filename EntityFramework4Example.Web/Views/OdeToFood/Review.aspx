<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OdeToFood.Models.Restaurant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Review
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Review for <%: Model.Name %></h2>

<p>
    <%: Html.ActionLink("Create New", "CreateReview", new { restaurantId = Model.Id })%>
</p>

<%: Html.Partial("_RestaurantReview", Model.Reviews) %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>