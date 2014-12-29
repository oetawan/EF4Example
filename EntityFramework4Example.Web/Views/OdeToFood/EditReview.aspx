﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OdeToFood.Models.RestaurantReview>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Review
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit Review</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Edit Review</legend>

        <%: Html.HiddenFor(model => model.Id) %>

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

        <%: Html.HiddenFor(model => model.RestaurantId) %>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Review", new { id = Model.RestaurantId })%>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
