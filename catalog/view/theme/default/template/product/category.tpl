<?php echo $header; ?>
<div class="container">
  <div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content">
      <?php echo $content_top; ?>
      <ul class="breadcrumb">
        <li><a href="/"><i class="fa fa-home" aria-hidden="true"></i></a></li>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>

      <?php if($result_banners){ ?>
      <div class="banner_image zone_category">
        <?php foreach($result_banners as $banner){ ?>
        <div class="banner_item">
          <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></a>
        </div>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if($manufacturers){ ?>
      <div class="category-filter brands">
        <div class="brands-list">

          <ul>
            <?php foreach($manufacturers as $key => $manufacturer){ ?>
              <?php if($key > 0 && $key%2 == 0){ ?>
              </ul><ul><li>
                <input type="radio" name="manufacturer_id" <?php if( isset($_GET['manufacturer_id']) && $_GET['manufacturer_id'] == $manufacturer['manufacturer_id']){ echo 'checked'; } ?> value="<?php echo $manufacturer['manufacturer_id']; ?>">
                <label><?php echo $manufacturer['name']; ?> (<?php echo $manufacturer['total']; ?>)</label>
                <div class="check"></div>
              </li>
              <?php }else{ ?>
                  <li>
                    <input type="radio" name="manufacturer_id" <?php if( isset($_GET['manufacturer_id']) && $_GET['manufacturer_id'] == $manufacturer['manufacturer_id']){ echo 'checked'; } ?> value="<?php echo $manufacturer['manufacturer_id']; ?>">
                    <label><?php echo $manufacturer['name']; ?> (<?php echo $manufacturer['total']; ?>)</label>
                    <div class="check"></div>
                  </li>
              <?php } ?>
            <?php } ?>
          </ul>

          <script type="text/javascript"><!--
          $('.category-filter .brands-list ul li').on('click', function() {
            var manufacturer_id = $('.category-filter .brands-list input[name^=\'manufacturer_id\']:checked').val();
            var link_manufacturer_filter = "<?php echo html_entity_decode($link_manufacturer_filter); ?>";

            link_manufacturer_filter = link_manufacturer_filter.replace("FILTER_MANUFACTURER", manufacturer_id);

            window.location.href = link_manufacturer_filter;
          });
          //--></script>

        </div>
      </div>
      <?php } ?>
      <?php if ($categories && $products) { ?>
      <div class="category-filter with-price">
        <div class="header">
          <div class="headline">Lựa chọn mức giá</div>
        </div>

        <div class="price-slider">
          <div class="price-slider-control">
            <div id="priceSlider" class="">
            </div>
          </div>
        </div>
      </div>
      <?php } ?>

      <script type="text/javascript">
        tooltipSlider = document.getElementById('priceSlider');

        noUiSlider.create(tooltipSlider, {
          connect: true,
          behaviour: 'tap',
          start: [<?php echo $current_minprice; ?>, <?php echo $current_maxprice; ?>],
        tooltips: [ wNumb({ decimals: 1 }), true ],
                range: {
          'min': <?php echo $minprice; ?>,
          'max': <?php echo $maxprice; ?>
        }

        });

        var nodes = [
          document.getElementById('priceSlider').getElementsByClassName('noUi-tooltip')[0], // 0
          document.getElementById('priceSlider').getElementsByClassName('noUi-tooltip')[1] // 1
        ];

        //        tooltipSlider.noUiSlider.on('update', function( values, handle, unencoded, isTap, positions ) {
        //          nodes[handle].innerHTML = values[handle] + ' VN?';
        //        });

        price_filter_url = "<?php echo html_entity_decode($link_category_filter); ?>";

        tooltipSlider.noUiSlider.on('end', function(values, handle ){
          price_filter_url = price_filter_url.replace("PRICE_MIN", values[0]);
          price_filter_url = price_filter_url.replace("PRICE_MAX", values[1]);

          window.location.href = price_filter_url;

        });

      </script>

      <div class="wrap-products">
        <ul class="tabs product-list">
          <li class="tab-link current" data-tab="tab-1">Tất cả sản phẩm</li>
          <li class="tab-link" data-tab="tab-2">Sản phẩm nổi bật</li>
          <li class="tab-link" data-tab="tab-3">Sản phẩm khuyến mại</li>
          <li class="tab-link" data-tab="tab-4">Sản phẩm bán chạy</li>
        </ul>

        <div id="tab-1" class="tab-content product-list current">
          <?php if ($products) { ?>
              <?php foreach ($products as $product) { ?>
              <div class="product-layout product-list">
                <div class="product-layout-inner">
                  <div class="product-thumb">
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

                    <div class="caption">
                      <h4 class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

                      <?php if ($product['price']) { ?>
                      <p class="price">
                        <?php if (!$product['special']) { ?>
                        <?php echo $product['price']; ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                        <?php } ?>
                        <?php if ($product['tax']) { ?>
                        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                        <?php } ?>
                      </p>
                      <?php } ?>
                    </div>

                  </div>

                  <div class="overlay">
                    <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>

                    <div class="rating">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } else { ?>
                      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } ?>
                      <?php } ?>
                    </div>

                    <p class="description"><?php echo $product['description']; ?></p>
                    <div class="button-wrap">
                      <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></button>
                    </div>
                  </div>

                </div>
              </div>
              <?php } ?>
              <div class="row">
                <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>
              </div>
            <?php } ?>
        </div> <!-- END TAB 1 -->

        <div id="tab-2" class="tab-content product-list">
            <?php if($products_highlight){ ?>
            <?php foreach ($products_highlight as $product) { ?>
            <div class="product-layout product-list">
              <div class="product-layout-inner">
                <div class="product-thumb">
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

                  <div class="caption">
                    <h4 class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                      <?php if ($product['tax']) { ?>
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>
                  </div>

                </div>

                <div class="overlay">
                  <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>

                  <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                    <?php } ?>
                  </div>

                  <p class="description"><?php echo $product['description']; ?></p>
                  <div class="button-wrap">
                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></button>
                  </div>
                </div>

              </div>
            </div>
            <?php } ?>
          <?php } ?>
        </div>

        <div id="tab-3" class="tab-content product-list">

          <?php if($products_specials){ ?>
          <?php foreach ($products_specials as $product) { ?>
          <div class="product-layout product-list">
            <div class="product-layout-inner">
              <div class="product-thumb">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

                <div class="caption">
                  <h4 class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

                  <?php if ($product['price']) { ?>
                  <p class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                    <?php } ?>
                    <?php if ($product['tax']) { ?>
                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
                  </p>
                  <?php } ?>
                </div>

              </div>

              <div class="overlay">
                <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>

                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>

                <p class="description"><?php echo $product['description']; ?></p>
                <div class="button-wrap">
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></button>
                </div>
              </div>

            </div>
          </div>
          <?php } ?>
          <?php } ?>

        </div>
        <div id="tab-4" class="tab-content product-list">
          <?php if($products_bestseller){ ?>
          <?php foreach ($products_bestseller as $product) { ?>
          <div class="product-layout product-list">
            <div class="product-layout-inner">
              <div class="product-thumb">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>

                <div class="caption">
                  <h4 class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

                  <?php if ($product['price']) { ?>
                  <p class="price">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                    <?php } ?>
                    <?php if ($product['tax']) { ?>
                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
                  </p>
                  <?php } ?>
                </div>

              </div>

              <div class="overlay">
                <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>

                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>

                <p class="description"><?php echo $product['description']; ?></p>
                <div class="button-wrap">
                  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></button>
                </div>
              </div>

            </div>
          </div>
          <?php } ?>
          <?php } ?>
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

        <script>
          $('.wrap-products-gp .product-layout').equalHeights();
          $('.wrap-products .product-layout').equalHeights();
        </script>

      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
