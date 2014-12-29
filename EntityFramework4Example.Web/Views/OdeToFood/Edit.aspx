<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OdeToFood.Models.Restaurant>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit Restaurant
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit Restaurant</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Restaurant</legend>

        <%: Html.HiddenFor(model => model.Id) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.City) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.City) %>
            <%: Html.ValidationMessageFor(model => model.City) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Country) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Country) %>
            <%: Html.ValidationMessageFor(model => model.Country) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
