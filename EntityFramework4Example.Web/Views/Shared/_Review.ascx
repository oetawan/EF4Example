<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OdeToFood.Models.RestaurantListViewModel>" %>

<div class="review">
    <div class="floatRight"><h4><%: Html.ActionLink("Edit", "Edit", new { id = Model.Id })%> | <%: Html.ActionLink("Reviews", "Review", new { id = Model.Id })%></h4></div>
    <h4><%: Model.Name %></h4>
    <p>
        <%: Model.City %>, <%: Model.Country %>
    </p>
    <p>
        Reviews : <%: Model.CountOfReviews %>
    </p>
</div>