jQuery(document).ready(function() {
    $( "#sortable" ).sortable({
        placeholder: "ui-state-highlight",

        //update: function(){$('overvalue').val($("#sortable").sortable('serialize'))} });
        //update: function () { dotheupdateone($("#sortable").sortable('serialize', { key: "order" }))}});
        update: function () {
            var inputs = $('input.currentposition');
            var nbElems = inputs.length;
            var count = 1
            $('input.currentposition').each(function(idx) {
                $(this).val(count);
                count ++
            });
        }
    });

})

function dotheupdateone(order)
{
    alert(order);
    $('#orderString').val(order);

}

