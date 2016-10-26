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
        <div class="current s2" style="z-index: 2;"><span>Thông tin vận chuyển</span><span class="glyphicon glyphicon-ok"></span></div>
        <div class="s3" style="z-index: 1;"><span>Hoàn tất</span></div>
      </div>

      <div class="checkout_content">

        <form id="form-shipping-address" class="form-horizontal">
          <div id="shipping-new">
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-shipping-firstname">Họ tên</label>
              <div class="col-sm-10">
                <input type="text" name="firstname" value="" placeholder="Họ tên" id="input-shipping-firstname" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-shipping-email">Email</label>
              <div class="col-sm-10">
                <input type="email" name="email" value="" placeholder="Email" id="input-shipping-email" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-shipping-telephone">Số điện thoại</label>
              <div class="col-sm-10">
                <input type="text" name="telephone" value="" placeholder="Telephone" id="input-shipping-telephone" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
              <div class="col-sm-10">
                <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-shipping-company" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-shipping-address-1">Địa chỉ</label>
              <div class="col-sm-10">
                <input type="text" name="address_1" value="" placeholder="Địa chỉ" id="input-shipping-address-1" class="form-control" />
              </div>
            </div>

            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-shipping-district">Quận/Huyện</label>
              <div class="col-sm-4">
                <input type="text" name="district" value="" placeholder="Quận/Huyện" id="input-shipping-district" class="form-control" />
              </div>
              <label class="col-sm-2 control-label" for="input-shipping-city">Tỉnh/Thành phố</label>
              <div class="col-sm-4">
                <input type="text" name="city" value="" placeholder="Tỉnh/Thành phố" id="input-shipping-city" class="form-control" />
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-shipping-note">Yêu cầu khác</label>
              <div class="col-sm-10">
                <textarea rows="5" type="text" name="comment" value="" placeholder="Chú thích thêm" id="input-shipping-note" class="form-control" ></textarea>
              </div>
            </div>

            <input type="hidden" name="country_id" value="230"/>
            <input type="hidden" name="zone_id" value="3776"/>
          </div>
          <div class="buttons clearfix">
            <div class="pull-right" style="margin-right: 20px;">
              <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
            </div>
          </div>
        </form>

      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
  // Shipping Address
  $(document).delegate('#button-shipping-address', 'click', function() {
    $.ajax({
      url: 'index.php?route=checkout/shipping_address/save',
      type: 'post',
      data: $('#form-shipping-address input[type=\'text\'],#form-shipping-address input[type=\'email\'], #form-shipping-address textarea, #form-shipping-address input[type=\'hidden\']'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-shipping-address').button('loading');
      },
      complete: function() {
        $('#button-shipping-address').button('reset');
      },
      success: function(json) {
        console.log(json);
        $('.alert, .text-danger').remove();

        if (json['redirect']) {
          location = json['redirect'];
        } else if (json['error']) {

          for (i in json['error']) {
            var element = $('#input-shipping-' + i.replace('_', '-'));

            if ($(element).parent().hasClass('input-group')) {
              $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
            } else {
              $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
            }
          }

          // Highlight any found errors
          $('.text-danger').parent().parent().addClass('has-error');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

//--></script>