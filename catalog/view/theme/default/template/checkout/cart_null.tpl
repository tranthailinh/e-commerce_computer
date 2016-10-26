<?php echo $header; ?>
<div class="container">

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
        <h3>Không có sản phẩm nào trong giỏ hàng!</h3>

        <div class="buttons" style="text-align: right; margin: 0px;">
          <a href="<?php echo $address_shipping; ?>" class="btn btn-primary">Tiếp tục</a>
        </div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 