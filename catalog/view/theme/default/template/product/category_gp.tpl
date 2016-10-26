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

        price_filter_url = "<?php echo html_entity_decode($link_category_filter); ?>";

        tooltipSlider.noUiSlider.on('end', function(values, handle ){
          price_filter_url = price_filter_url.replace("PRICE_MIN", values[0]);
          price_filter_url = price_filter_url.replace("PRICE_MAX", values[1]);

          window.location.href = price_filter_url;

        });

      </script>

      <h2 class="cat-title"><span><?php echo $heading_title; ?></span></h2>

      <?php if ($products) { ?>

      <div class="wrap-products-gp">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list">
          <div class="product-layout-inner">
            <a class="p-title" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <div class="product-thumb">
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                <div class="caption">
                  <p class="description"><?php echo $product['description']; ?></p>
                  <?php if ($product['rating']) { ?>
                  <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
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
                  <a class="button" href="<?php echo $product['href']; ?>">Build ngay</a>
                </div>

            </div>
          </div>
        </div>
        <?php } ?>
        <div class="row">
          <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>
        </div>
        <?php } ?>

        <script>
          $('.wrap-products-gp .product-layout').equalHeights();
        </script>

      </div>

      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>