<div id="cart" class="btn-group btn-block" title="Xem giỏ hàng">
  <div id="basket-hover">
    <i class="fa fa-shopping-cart"></i>
    <div>
      <p><?php echo $count_product; ?> sản phẩm</p>
      <p><?php echo $total; ?></p>
    </div>
  </div>

  <div id="basket-content">
    <h3 class="header">Bán có <span><?php echo $count_product ?> sản phẩm</span> trong giỏ hàng</h3>

    <ul class="list-item">
      <?php if ($products || $vouchers) { ?>
      <li>
        <table class="table table-striped">
          <tr class="thead">
            <th>Hình ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Tạm tính</th>
          </tr>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-center">
              <?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
              <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <br />
              - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
              <?php } ?></td>
            <td class="text-right"><?php echo $product['price']; ?></td>
            <td class="text-right">x <?php echo $product['quantity']; ?></td>
            <td class="text-right"><?php echo $product['total']; ?></td>
          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td class="text-center"></td>
            <td class="text-left"><?php echo $voucher['description']; ?></td>
            <td class="text-right">x&nbsp;1</td>
            <td class="text-right"><?php echo $voucher['amount']; ?></td>
            <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
          </tr>
          <?php } ?>
        </table>
      </li>
      <li>
        <div class="col-sm-8"></div>
        <div class="col-sm-4">
          <div class="row">
            <table class="table table-bordered table-total-price">
              <?php foreach ($totals as $total) { ?>
              <tr>
                <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
                <td class="text-right"><?php echo $total['text']; ?></td>
              </tr>
              <?php } ?>
            </table>
            <p class="text-right"><a style="background: #0f4f9e; text-align: center; padding: 8px 12px;" href="<?php echo $cart; ?>"><strong style="color: #fff;">Tiến hành đặt hàng</strong></a></p>
          </div>
        </div>
      </li>
      <?php } else { ?>
      <li>
        <p class="text-center"><?php echo $text_empty; ?></p>
      </li>
      <?php } ?>
    </ul>
  </div>

</div>
