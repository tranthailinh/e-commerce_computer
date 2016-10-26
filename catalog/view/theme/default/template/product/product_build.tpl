<?php echo $header; ?>
<div class="custom-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content-single" class="single-build <?php echo $class; ?>"><?php echo $content_top; ?>

        <div class="detail-top">
          <div class="inner">
            <div class="left col-sm-5">
              <?php if($thumb){ ?>
              <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
              <?php } ?>
            </div>

            <div class="right col-sm-7">

                <h1><?php echo $heading_title; ?></h1>

                <?php if ($review_status) { ?>
                <div class="rating">
                  <p>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($rating < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } ?>
                    <?php } ?>
                  </p>
                </div>
                <?php } ?>

                <div class="short-desc">
                  <?php echo $short_description; ?>
                </div>

                <div id="configure_total_price">0 đ</div>

                <div id="product">
                  <div class="form-inline">
                    <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                  </div>

                  <div class="share">
                    <a href="http://www.facebook.com/share.php?u=<?php echo $href; ?>title=<?php echo $heading_title; ?>" rel="me" class="ss-social-facebook">Facebook</a>
                    <a href="http://pinterest.com/pin/create/bookmarklet/?url=<?php echo $href; ?>description=<?php echo $heading_title; ?>" rel="me" class="ss-social-pinterest">Pinterest</a>
                    <a href="https://plus.google.com/share?url=<?php echo $href; ?>" rel="me" class="ss-social-google">Google</a>
                  </div>

                  <div class="form-group">
                    <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
                  </div>

                  <?php if ($minimum > 1) { ?>
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                  <?php } ?>
                </div>

            </div>
          </div>

        </div>

        <div class="detail-bottom">
          <div class="left">
            <div class="configurable_block">
              <ul class="tabs product-list">
                <li class="tab-link current" data-tab="tab-1">Xây dựng cấu hình PC</li>
                <li class="tab-link" data-tab="tab-2">Phụ kiện</li>
                <li class="tab-link" data-tab="tab-3">Tab 3</li>
              </ul>
              <div id="tab-1" class="tab-content product-list current">
                <div id="computer_building_fields">
                  <?php if($products_gp){ ?>
                  <?php foreach($products_gp as $key => $field){ ?>
                    <div id="group<?php echo $field['product_cf_id']; ?>" class="field-wrapper <?php if($key == 0){ echo 'viewmode-carousel closed'; } ?>" group="<?php echo $field['product_cf_id']; ?>">
                      <div class="field-header">
                        <div class="field_name"><?php echo $field['option_name']; ?></div>
                        <div class="field_choice">
                          <div class="status status1 in_stock" title="In stock"></div>
                          <span class="option_title"><?php echo $field['child'][0]['info']['name']; ?></span>
                        </div>
                        <div class="arrow"></div>
                      </div>
                      <div class="field-container">
                        <?php if($key > 0){ ?>
                        <div class="group_option_images">
                          <?php foreach($field['child'] as $key_img => $child){ ?>
                          <img id="option_img_<?php echo $field['product_cf_id']; ?>_<?php echo $child['info']['product_id']; ?>" src="<?php echo $child['info']['thumb']; ?>" <?php if($key_img > 0){ echo 'style="display: none;"'; } ?>>
                          <?php } ?>
                        </div>
                        <?php } ?>
                        <div class="group_options">
                          <?php foreach($field['child'] as $key1 => $option){ ?>
                            <?php if($key == 0){ ?>
                                <div class="group_options_option item">
                                  <div class="option_image" style="background-image: url('<?php echo $option['info']['thumb'] ?>')"></div>
                                  <label id="LabelconfiguratorOption_<?php echo $option['info']['product_id']; ?>_<?php echo $field['product_cf_id']; ?>" for="configuratorOption_<?php echo $option['info']['product_id']; ?>_<?php echo $field['product_cf_id']; ?>" style="max-width: 876px;">
                                    <div class="headerHtml">
                                      <div class="status status1 in_stock" title="In stock"></div>
                                      <span class="option_title" title="<?php echo $option['info']['name']; ?>"><?php echo $option['info']['name']; ?></span>
                                    </div>
                                  </label>
                                  <input price="<?php if($option['info']['ori_special']){ echo $option['info']['ori_special']; }else{ echo $option['info']['ori_price']; } ?>" normalprice="74.988" type="radio" name="configuratorValues[<?php echo $field['product_cf_id']; ?>]" id="configuratorOption_<?php echo $option['info']['product_id']; ?>_<?php echo $field['product_cf_id']; ?>" value="<?php echo $option['info']['product_id']; ?>" group="<?php echo $field['product_cf_id']; ?>" <?php if($key1 == 0){ echo 'checked'; } ?>>
                                </div>
                            <?php }else{ ?>
                            <div class="group_options_option">
                              <input price="<?php if($option['info']['ori_special']){ echo $option['info']['ori_special']; }else{ echo $option['info']['ori_price']; } ?>" normalprice="74.988" type="radio" name="configuratorValues[<?php echo $field['product_cf_id']; ?>]" id="configuratorOption_<?php echo $option['info']['product_id']; ?>_<?php echo $field['product_cf_id']; ?>" value="<?php echo $option['info']['product_id']; ?>" group="<?php echo $field['product_cf_id']; ?>" <?php if($key1 == 0){ echo 'checked'; } ?>>
                              <label id="LabelconfiguratorOption_<?php echo $option['info']['product_id']; ?>_<?php echo $field['product_cf_id']; ?>" for="configuratorOption_<?php echo $option['info']['product_id']; ?>_<?php echo $field['product_cf_id']; ?>" style="max-width: 876px;">
                                <div class="headerHtml">
                                  <div class="status status2 in_stock" title="In stock"></div>
                                  <span class="option_title" title="<?php echo $option['info']['name']; ?>"><?php echo $option['info']['name']; ?></span>
                                </div>
                              </label>
                            </div>
                            <?php } ?>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  <?php } ?>
                  <?php } ?>
                </div>

                <script type="text/javascript"><!--
                  $('#computer_building_fields .viewmode-carousel .group_options').owlCarousel({
                    items: 4,
                    autoPlay: false,
                    singleItem: false,
                    navigation: false,
                    pagination: true
                  });
                  --></script>

                <script>
                  $( "#computer_building_fields .field-wrapper .field-header" ).click(function() {
                    $( this).parent().toggleClass( "closed" );
                  });

                  $(document).ready(function() {
                    $( "#computer_building_fields input" ).change(function () {
                      $option_id = $(this).val();
                      $group_id = $(this).attr('group');

                      var label = $('#LabelconfiguratorOption_'+$option_id+'_'+$group_id+' .headerHtml');
                      $("#group" + $group_id + " .field-header .field_choice").html(label.html());

                      $("#group" + $group_id + " .group_option_images img").css("display", "none");

                      $("#option_img_" + $group_id + "_" + $option_id + "").css("display", "block");
                      updateGPTotal();
                    });

                  });
                  updateGPTotal();
                  function updateGPTotal() {

                    $.ajax({
                      url: 'index.php?route=product/product/updateGPTotalConfigurable',
                      type: 'post',
                      dataType: 'json',
                      data: $('#computer_building_fields input:checked'),
                      beforeSend: function() {

                      },
                      complete: function() {

                      },
                      success: function(json) {
                        $('.buy_follower').html(json['total']);
                        $('#configure_total_price').html(json['total']);
                        console.log(json);
                      }
                    });

                  }
                  // $('#computer_building_fields .viewmode-carousel .group_options .item').equalHeights();
                </script>
              </div>

              <div id="tab-2" class="tab-content product-list">
                Phụ kiện
              </div>

              <div id="tab-3" class="tab-content product-list">
                Tab 3
              </div>

              <script type="text/javascript">
                $(document).ready(function(){

                  $('ul.tabs li').click(function(){
                    var tab_id = $(this).attr('data-tab');

                    $('ul.tabs li').removeClass('current');
                    $('.tab-content').removeClass('current');

                    $(this).addClass('current');
                    $("#"+tab_id).addClass('current');
                  })

                })
              </script>
            </div>
            <div class="description-block">
              <div class="block-title">Chi tiết sản phẩm</div>
              <div class="block-content">
                <?php echo $description; ?>
              </div>
            </div>

            <div class="rating-block">
              <div class="block-title">Đánh giá sản phẩm</div>

              <div class="block-content">
                <?php if ($review_status) { ?>
                <form class="form-horizontal" id="form-review">
                  <div id="review"></div>
                  <?php if ($review_guest) { ?>

                  <div class="form-inline">
                    <div class="form-group col-sm-6">
                      <label class="control-label col-sm-3 text-left" style="text-align: left;" for="input-name"><div class="row"> Họ và tên</div></label>
                      <div class="col-sm-9">
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" style="width: 100%;" />
                      </div>
                    </div>

                    <div class="form-group col-sm-6">
                      <label class="control-label col-sm-3" for="input-email">Email</label>
                      <div class="col-sm-9">
                        <input type="text" name="email" value="<?php echo $customer_email; ?>" id="input-email" class="form-control"  style="width: 100%;" />
                      </div>
                    </div>
                  </div>

                  <div class="form-group" style="margin-bottom: 0px;">

                    <div class="form-group col-sm-6">
                      <label style="margin-top: 12px;" class="control-label col-sm-3" for="rating">Đánh giá </label>
                      <div class="col-sm-9">
                        <div class="rating-container col-sm-12">
                          <input type="radio" name="rating" class="rating"  value="1" />
                          &nbsp;
                          <input type="radio" name="rating" class="rating"  value="2" />
                          &nbsp;
                          <input type="radio" name="rating" class="rating"  value="3" />
                          &nbsp;
                          <input type="radio" name="rating" class="rating"  value="4" />
                          &nbsp;
                          <input type="radio" name="rating" class="rating"  value="5" />
                        </div>
                      </div>
                    </div>

                  </div>

                  <script type="text/javascript">
                    $(function(){
                      $('.rating-container').rating();
                    });
                  </script>

                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                      <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    </div>
                  </div>

                  <?php echo $captcha; ?>
                  <div class="buttons clearfix">
                    <div class="pull-right">
                      <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                    </div>
                  </div>
                  <?php } else { ?>
                  <?php echo $text_login; ?>
                  <?php } ?>
                </form>
                <?php } ?>
              </div>

            </div>
          </div>

          <div class="right">

            <?php if ($products) { ?>
            <div class="box">
              <h3><?php echo $text_related; ?></h3>
              <div class="row">
                <?php $i = 0; ?>
                <?php foreach ($products as $product) { ?>

                <div class="col-sm-12">
                  <div class="product-thumb transition">
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                    <div class="caption">
                      <h4><a href="<?php echo $product['href']; ?>"><?php echo substr($product['name'], 0, 40); ?>...</a></h4>
                      <p class="stock_status"><span class="status status1 in_stock"></span>Còn hàng</p>

                      <?php if ($product['price']) { ?>
                      <p class="price">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                      </p>
                      <?php } ?>
                    </div>

                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></button>
                  </div>
                </div>
                <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
                <div class="clearfix visible-md visible-sm"></div>
                <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
                <div class="clearfix visible-md"></div>
                <?php } elseif ($i % 4 == 0) { ?>
                <div class="clearfix visible-md"></div>
                <?php } ?>
                <?php $i++; ?>
                <?php } ?>
              </div>
            </div>
            <?php } ?>



            <?php if ($products_incat) { ?>
            <div class="box">
              <h3>Sản phẩm cùng bộ lọc</h3>
              <div class="row">
                <?php $i = 0; ?>
                <?php foreach ($products_incat as $product) { ?>

                <div class="col-sm-12">
                  <div class="product-thumb transition">
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                    <div class="caption">
                      <h4><a href="<?php echo $product['href']; ?>"><?php echo substr($product['name'], 0, 40); ?>...</a></a></h4>
                      <p class="stock_status"><span class="status status1 in_stock"></span>Còn hàng</p>

                      <?php if ($product['price']) { ?>
                      <p class="price">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                      </p>
                      <?php } ?>
                    </div>

                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></button>
                  </div>
                </div>
                <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
                <div class="clearfix visible-md visible-sm"></div>
                <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
                <div class="clearfix visible-md"></div>
                <?php } elseif ($i % 4 == 0) { ?>
                <div class="clearfix visible-md"></div>
                <?php } ?>
                <?php $i++; ?>
                <?php } ?>
              </div>
            </div>
            <?php } ?>

          </div>

          <div class="buy_follower">
            9.850.000 đ
          </div>
        </div>


      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#computer_building_fields  input[type=\'radio\']:checked, #product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
          console.log(json);
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

                $('#cart').load('index.php?route=common/cart/info #cart > div');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
