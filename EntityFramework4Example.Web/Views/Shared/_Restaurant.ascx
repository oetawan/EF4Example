<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IPagedList<RestaurantListViewModel>>" %>

<div id="restaurantList">
    <div class="pagedList" data-otf-target="#restaurantList">
        <%: Html.PagedListPager(Model, page => Url.Action("Index", new {page}),
        PagedListRenderOptions.MinimalWithItemCountText) %>
    </div>
    <% foreach(var item in Model) { %>
        <%: Html.Partial("_Review", item) %>
    <% } %>
</div>