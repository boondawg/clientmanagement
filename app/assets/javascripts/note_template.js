jQuery(document).ready(function() {
    $( "#sortable" ).sortable({
        placeholder: "ui-state-highlight",
        helper: function(e, tr)
        {
            var $originals = tr.children();
            var $helper = tr.clone();
            $helper.children().each(function(index)
            {
                // Set helper cell sizes to match the original sizes
                $(this).width($originals.eq(index).width());
            });
            return $helper;
        },

        //update: function(){$('overvalue').val($("#sortable").sortable('serialize'))} });
        //update: function () { dotheupdateone($("#sortable").sortable('serialize', { key: "order" }))}});
        update: function () {
           updateOrder();
        }
    });
    $('#sortable').on('cocoon:after-insert', function() {
        updateOrder();
    });
    $('#sortable').on('cocoon:after-remove', function() {
        updateOrder();
    });

})

function updateOrder()
{
    var inputs = $('input.currentposition');
    var nbElems = inputs.length;
    var count = 1
    $('input.currentposition').each(function(idx) {
        $(this).val(count);
        count ++
    });

}

