jQuery(document).ready(function() {
    Calendar.init();

$('#basic').on('shown.bs.modal', function () {
    var the_date = $(this).data('start_date_time')
    ComponentsPickers.init();
    $('#start-date-picker').datetimepicker('setDate', the_date);
    App.setModalDropdowns();
$('#edit-btn').click(function(){$('#show-m').modal('hide')});
});

//$('#show-m').on('shown.bs.modal', function () {
  //      ComponentsPickers.init();
    //    App.setModalDropdowns();
//});
    //$('#edit-m').on('shown.bs.modal', function () {
      //  ComponentsPickers.init();
        //App.setModalDropdowns();
    //});

    /*$('#edit-m').on('hidden.bs.modal', function () {
        $(this).removeData();
    });
    $('#basic').on('hidden.bs.modal', function () {
        $(this).removeData();
    });*/
//fix modal force focus
$.fn.modal.Constructor.prototype.enforceFocus = function () {
    var that = this;
    $(document).on('focusin.modal', function (e) {
        if ($(e.target).hasClass('select2-input')) {
            return true;
        }
        if (that.$element[0] !== e.target && !that.$element.has(e.target).length) {
            that.$element.focus();
        }
    });
}});
