<?php if($products){ ?>
<div class="box_recent_viewed">
    <div class="recent_viewed_header"><span>Sản phẩm vừa xem</span></div>
    <div id="slide_recent_viewed">
        <?php foreach($products as $product){ ?>
            <div class="item">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
            </div>
        <?php } ?>
    </div>
</div>
<?php } ?>

<script type="text/javascript"><!--
$('#slide_recent_viewed').owlCarousel({
    items: 5,
    autoPlay: false,
    singleItem: false,
    navigation: true,
    navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
    pagination: false
});
--></script>
<script>
    $('#slide_recent_viewed .item').equalHeights();
    $('.box_two_column_wrap > div').equalHeights();
</script>