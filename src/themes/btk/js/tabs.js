!(function($) {

    var activateTab = function(tab) {
        var $tab = $(tab);
        var $others = $(tab).siblings('.tab').not($tab);
        var paneSelector = $tab.data('pane');
        var $pane = $('#' + paneSelector);
        var $otherPanes = $('.tabpane').not($pane);
        $others.add($otherPanes).removeClass('active');
        $tab.add($pane).addClass('active');

    }
    $('.tabbar .tab').on('click', function(event) {
        event.preventDefault();
        activateTab(this)
    });

    $('.tabnext').on('click', function(event) {
        event.preventDefault();
        $('.tab.active').next().click();
    });
})(jQuery)