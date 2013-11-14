$(document).ready(function() {
    $(document).on('click','.delete_asset',function(){
        var asset = $(this).parents('.asset')
        var asset_id = asset.find('.asset_id').html();
        var item_id = asset.find('.item_id').html();
        $('#asset_'+asset_id).remove();
        $.ajax({
            type: "DELETE",
            url: "/items/"+item_id+"/assets/"+asset_id,
            dataType: "json",
            success: function() {
            }
        });
        return false;
    })

    $(document).on('click','.radio_main',function(){
        var asset = $(this).parents('.asset')
        var asset_id = asset.find('.asset_id').html();
        var item_id = asset.find('.item_id').html();
        $.ajax({
            type: "PUT",
            url: "/items/"+item_id+"/assets/"+asset_id,
            data:{asset:{main:true}},
            success: function(result) {
                $('#item_assets').html(result);
            }
        });
        return false;
    })
});

