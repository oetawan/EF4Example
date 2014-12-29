﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<OdeToFood.Models.RestaurantReview>>" %>

<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.Rating) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Body) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.ReviewerName) %>
        </th>
        <th>
        </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Rating) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Body) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ReviewerName) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "EditReview", new { id=item.Id }) %>
        </td>
    </tr>
<% } %>

</table>