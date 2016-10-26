<div class="box_find_brands">
    <div class="brand_header"><span>Find brand</span></div>
    <div id="slide_findbrands">
        <?php foreach($brands as $brand){ ?>
        <div class="item">
            <div class="manufacturer_box">
                <a href="<?php echo $brand['href']; ?>" class="manufacturer" title="<?php echo $brand['name']; ?>">
                    <div style="background-image: url('<?php echo $brand['image']; ?>')"></div>
                </a>

            </div>
        </div>
        <?php } ?>

    </div>
</div>

<script type="text/javascript">
$('#slide_findbrands').owlCarousel({
    items: 6,
    autoPlay: false,
    singleItem: false,
    navigation: true,
    navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
    pagination: false
});
</script>