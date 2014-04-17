jQuery(document).ready(function() {
    $('.Selector').change(function(){
        $.ajax({
            url: "displayfields",
            type: "GET",
            dataType: 'JSON',
            data: {a: $(".Selector").val() }
        })
    });
});