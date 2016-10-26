<h3><span>Sản phẩm mới nhất</span></h3>
<div id="slide_latest_product">
  <?php foreach ($products as $product) { ?>
  <div class="item">

      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>

      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
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
  <?php } ?>
</div>

<script type="text/javascript"><!--
$('#slide_latest_product').owlCarousel({
  items: 5,
  autoPlay: false,
  singleItem: false,
  navigation: false,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  pagination: true
});

$('#slide_latest_product .item').equalHeights();
--></script>
