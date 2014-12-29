<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EntityFramework4Example.Data.CRS_EMP_EMPLOYEE>>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Employees
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="featured">
    <% foreach(var emp in Model) { %>
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%= emp.EMPLOYEE_NAME %></h1>

            </hgroup>
            <hr />
            <div>
                <%= emp.DIVISION %>, <%= emp.STREAM_ID%>
            </div>
        </div>
        <% } %>
    </section>
</asp:Content>