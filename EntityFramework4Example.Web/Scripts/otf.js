/// <reference path="_references.js" />

$(function () {
    var $forms = $("form[data-otf-ajax='true']");

    function searchRestaurantCallback(data) {
        $("#restaurantList").replaceWith(data);
    }

    function searchRestaurant() {
        var options = {
            type: $forms.attr('method'),
            data: $forms.serialize()
        };
        $.ajax($forms.attr('data-otf-action'), options).done(searchRestaurantCallback);

        return false;
    }

    function createAutoComplete() {
        $input = $(this);
        var options = {
            source: $input.attr('data-otf-autocomplete')
        };
        $input.autocomplete(options);
    }

    function getPage() {
        var $a = $(this);
        var options = {
            url: $a.attr('href'),
            type: 'get'
        };
        $.ajax(options).done(function (data) {
            var target = $a.parents('div.pagedList').first('data-otf-target');
            $(target).empty();
            $(target).replaceWith(data);
        });

        return false;
    }

    $forms.submit(searchRestaurant);
    $('input[data-otf-autocomplete]').each(createAutoComplete);
    $('section.main-content').on('click', 'div.pagedList a', getPage);
});