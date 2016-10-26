<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1>Sản phẩm giảm giá</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Sản phẩm giảm giá</h3>
      </div>
      <div class="panel-body">

        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-all" data-toggle="tab" aria-expanded="true">Tất cả sản phẩm</a></li>
          <li class=""><a href="#tab-add" data-toggle="tab" aria-expanded="true">Thêm giảm giá</a></li>
        </ul>

        <div class="tab-content">
          <div class="tab-pane active" id="tab-all">

            <form action="index.php?route=module/promotion_campaign/delete&token=<?php echo $token; ?>" method="post" enctype="multipart/form-data" id="form-product">

              <div class="col-sm-12 text-right" style="margin-bottom: 10px;">
                <div class="row">
                  <button type="submit" form="form-product" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Xóa"><i class="fa fa-trash-o"></i>  Xóa giảm giá</button>
                </div>
              </div>

              <div class="table-responsive" style="overflow-x: visible">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
                      <td class="text-center">Hình ảnh</td>
                      <td class="text-left">
                        Tên sản phẩm
                      </td>
                      <td class="text-right">
                        Giá
                      </td>
                      <td class="text-right">Giảm giá</td>
                      <td class="text-right">Từ ngày</td>
                      <td class="text-right">Đến ngày</td>
                      <td class="text-right">Ưu tiên</td>
                      <td class="text-right ">Nhóm khách hàng</td>
                      <td class="text-right">Thao tác</td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach($products as $product){ ?>
                        <tr id="special_row_<?php echo $product['product_special_id']; ?>">
                          <td class="text-center">
                            <input type="checkbox" name="selected[]" value="<?php echo $product['product_special_id']; ?>">
                          </td>
                          <td class="text-center">
                            <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail">
                          </td>
                          <td class="text-left"><?php echo $product['name']; ?></td>
                          <td class="text-right">
                            <span class="price" style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br>
                            <div class="text-danger special_price"><?php echo $product['special_price']; ?></div>
                          </td>
                          <td class="text-right ">
                            <input style="width: 55%; float: left;" type="text" name="discount_size" value="<?php echo $product['discount_size']; ?>" placeholder="Giảm giá:" class="form-control">
                            <input type="hidden" name="old_price" value="<?php echo $product['price']; ?>">
                            <select style="width: 40%; float: right;" name="discount_type" class="form-control discount_type">
                              <?php if($product['discount_type'] == "percent"){ ?>
                                <option value="percent" selected>%</option>
                                <option value="amount">Số tiền</option>
                              <?php }else{ ?>
                                <option value="percent">%</option>
                                <option value="amount" selected>Số tiền</option>
                              <?php } ?>
                            </select>
                          </td>
                          <td class="text-left" style="width: 15%;">
                            <div class="input-group date">
                              <input type="text" name="date_start" value="<?php echo $product['date_start']; ?>" placeholder="Từ ngày:" data-date-format="YYYY-MM-DD" class="form-control">
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                            </div>
                          </td>
                          <td class="text-left" style="width: 15%;">
                            <div class="input-group date">
                              <input type="text" name="date_end" value="<?php echo $product['date_end']; ?>" placeholder="Đến ngày:" data-date-format="YYYY-MM-DD" class="form-control">
                              <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                              </span>
                            </div>
                          </td>
                          <td class="text-right" style="width: 7%;">
                            <input type="text" name="priority" value="<?php echo $product['priority']; ?>" placeholder="Ưu tiên:" class="form-control">
                          </td>
                          <td class="text-left">
                            <select name="customer_group_id" class="form-control">
                              <?php foreach($customer_groups as $customer_group){ ?>
                                <?php if($customer_group['customer_group_id'] == $product['customer_group_id']){ ?>
                                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                                <?php }else{ ?>
                                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                          </td>
                          <td class="text-right">
                            <a data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Sửa" onclick="saveAjaxProductSpecical('<?php echo $product["product_special_id"]; ?>'); return false;"><i class="ajaxLoading fa fa-save"></i></a>
                          </td>
                        </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </form>

            <div class="row">
              <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
              <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
          </div>

          <div class="tab-pane" id="tab-add">

            <form id="form-add-special" action="index.php?route=module/promotion_campaign/add&token=<?php echo $token; ?>" method="post" enctype="multipart/form-data" id="form-add-product-special" class="form-horizontal">
              <div class="col-sm-12 text-right" style="margin-bottom: 10px;">
                <div class="row">
                  <button type="submit" id="add-special" form="form-product" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Lưu"><i class="fa fa-save"></i>  Lưu giảm giá</button>
                </div>
              </div>

              <div class="table-responsive" style="overflow-x: visible">
                <table style="margin-bottom: 0px;" id="special" class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <td class="text-left">Nhóm khách hàng:</td>
                    <td class="text-right">Độ ưu tiên:</td>
                    <td class="text-right">Giảm giá:</td>
                    <td class="text-left">Từ ngày:</td>
                    <td class="text-left">Đến ngày:</td>
                  </tr>
                  </thead>
                  <tbody>
                  <tr id="special-row0">
                    <td class="text-left"><select name="customer_group_id" class="form-control">
                      <option value="1" selected="selected">Default</option>
                    </select>
                    </td>
                    <td class="text-right">
                      <input type="text" name="priority" value="" placeholder="Ưu tiên:" class="form-control">
                    </td>
                    <td class="text-right">
                      <input style="width: 55%; float: left;" type="text" name="discount_size" value="" placeholder="Giảm giá:" class="form-control">

                      <select style="width: 40%; float: right;" name="discount_type" class="form-control discount_type">
                        <option value="percent">%</option>
                        <option value="amount">Số tiền</option>
                      </select>
                    </td>
                    <td class="text-left" style="width: 20%;">
                      <div class="input-group date">
                        <input type="text" name="date_start" value="" placeholder="Từ ngày:" data-date-format="YYYY-MM-DD" class="form-control">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                      </span>
                      </div>
                    </td>
                    <td class="text-left" style="width: 20%;">
                      <div class="input-group date">
                        <input type="text" name="date_end" value="" placeholder="Đến ngày:" data-date-format="YYYY-MM-DD" class="form-control">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                      </span>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                  <tfoot>

                  </tfoot>
                </table>
              </div>
              <div class="form-group">

                <div class="col-sm-12">
                  <label class="control-label" for="input-product"><h4><b>Sản phẩm giảm giá</b></h4></label>
                </div>
                <div class="col-sm-12">
                  <input type="text" value="" placeholder="Products" id="input-product" name="product_name_filter" class="form-control ui-autocomplete-input ui-autocomplete-loading" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true">
                  <div id="special-product" class="well well-sm" style="height: 150px; overflow: auto;">

                  </div>
                </div>

              </div>
            </form>

          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  function saveAjaxProductSpecical(special_id){
    var special_div = $('#special_row_' + special_id);

    $.ajax({
      'type': 'POST',
      'cache': false,
      'dataType': 'json',
      'url': 'index.php?route=module/promotion_campaign/ajaxUpdateSpecial&token=<?php echo $token; ?>',
      'data': {
        'special_id'        : special_id,
        'old_price'         : special_div.find('input[name="old_price"]').val(),
        'discount_type'     : special_div.find('select[name="discount_type"]').val(),
        'discount_size'     : special_div.find('input[name="discount_size"]').val(),
        'date_start'        : special_div.find('input[name="date_start"]').val(),
        'date_end'          : special_div.find('input[name="date_end"]').val(),
        'priority'          : special_div.find('input[name="priority"]').val(),
        'customer_group_id' : special_div.find('select[name="customer_group_id"]').val(),
      },
      'success': function (data) {
        console.log(data);
        special_div.find('.special_price').html(data['data']['special_price']);
        setTimeout(function(){
          special_div.find('.ajaxLoading').removeClass("fa-spinner fa-spin");
          special_div.find('.ajaxLoading').addClass("fa-check");
          setTimeout(function () {
            special_div.find('.ajaxLoading').removeClass("fa-check");
            special_div.find('.ajaxLoading').addClass("fa-save");
          },800);
        },200);
      },
      'beforeSend': function () {
        special_div.find('.ajaxLoading').removeClass("fa-save");
        special_div.find('.ajaxLoading').addClass("fa-spinner fa-spin");
      },
    });
  }
</script>

<script type="text/javascript"><!--
  $('input[name=\'product_name_filter\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'product_name_filter\']').val('');

      $('#special-product' + item['value']).remove();

      $('#special-product').append('<div id="special-product-' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');
    }
  });

  $('#special-product').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();
  });

  $("#add-special").click(function(e){
    e.preventDefault();

    $("#form-add-special").submit();
    return false;
  });

  //--></script>



<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});

$('.time').datetimepicker({
  pickDate: false
});

$('.datetime').datetimepicker({
  pickDate: true,
  pickTime: true
});
//--></script>

<?php echo $footer; ?>