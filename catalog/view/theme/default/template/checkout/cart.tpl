<?php echo $header; ?>
<div class="container">

  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="single_cart">
      <?php echo $content_top; ?>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>

      <div id="checkout_session">
        <div class="current s1" style="z-index: 3;"><span>Thông tin đơn hàng</span><span class="glyphicon glyphicon-ok"></span></div>
        <div class="s2" style="z-index: 2;"><span>Thông tin vận chuyển</span></div>
        <div class="s3" style="z-index: 1;"><span>Hoàn tất</span></div>
      </div>

      <div class="checkout_content">

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <div class="table-responsive">
            <table class="table table-bordered checkout_cart">
              <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center" style="width: 160px;">
                  <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?>

                  <div class="total_price">
                    <?php echo $product['total']; ?>
                  </div>

                  <div class=" input-group btn-block" style="max-width: 200px;">
                    <label for="">Số lượng </label>
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="quantity" />
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="update"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="trash" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="glyphicon glyphicon-trash"></i></button>
                  </div>
                </td>
                <td class="text-left">
                  <p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
                  <?php if ($product['configure']) { ?>

                  <?php foreach ($product['configure'] as $configure) { ?>
                  <p style="margin-bottom: 5px;"><strong class="name_config_system"><?php echo $configure['name']; ?></strong> <?php echo $configure['value']; ?></p>
                  <?php } ?>
                  <?php } ?>


                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />

                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?>
                </td>

              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </form>

        <div class="row">
          <div class="all_product_total_wrap">
            <div class="col-sm-6">

            </div>
            <div class="all_product_total col-sm-6">
              <span>Tổng tiền thanh toán <br><small>(Đã bao gồm VAT)</small></span>
              <span><?php echo $all_product_total; ?></span>
            </div>
          </div>
        </div>

        <div class="buttons" style="text-align: right; margin: 0px;">
          <a href="<?php echo $address_shipping; ?>" class="btn btn-primary">Tiếp tục</a>
        </div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 