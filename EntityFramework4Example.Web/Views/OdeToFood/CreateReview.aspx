<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OdeToFood.Models.RestaurantReview>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    New Review
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>New Review</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>New Review</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Rating) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Rating) %>
            <%: Html.ValidationMessageFor(model => model.Rating) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Body) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Body) %>
            <%: Html.ValidationMessageFor(model => model.Body) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ReviewerName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ReviewerName) %>
            <%: Html.ValidationMessageFor(model => model.ReviewerName) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>
    
<div>
    <%: Html.ActionLink("Back to List", "Review", new { id = ViewData["restaurantId"] })%>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
