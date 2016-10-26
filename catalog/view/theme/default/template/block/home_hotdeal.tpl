<div class="box_column hotdeal">
    <div class="box_container">
        <div class="box_header">
            <span class="header_icon"> </span>
            <span class="header_text">Deal trong tuần</span>
        </div>

        <div class="box_body">
            <?php if($products){ ?>
                <?php foreach($products as $product){ ?>
                    <div class="box_article_outer">
                        <div class="box_article">
                            <div class="img_rating">
                                <a class="link_outer" href="<?php echo $product['href']; ?>"><img class="img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                                <div class="rating">
                                    <?php $i = 1; for($i; $i <= 5; $i++){ ?>
                                    <span class="fa fa-stack">
                                        <?php if($i > 0 && $i <= $product['rating']){ ?>
                                        <span class="fa fa-star fa-stack-1x"></span>
                                        <?php } ?>
                                        <span class="fa fa-star-o fa-stack-1x"></span>
                                    </span>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="info">
                                <h2  class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
                                <div class="special_price">
                                    <?php if($product['special']){ ?>
                                        <span class="special"><?php echo $product['price']; ?></span>
                                        <span class="price"><?php echo $product['special']; ?></span>
                                    <?php }else{ ?>
                                        <span class="price"><?php echo $product['price']; ?></span>
                                    <?php } ?>

                                    <?php if($product['percent']){ ?>
                                    <span class="percent"><?php echo $product['percent']; ?></span>
                                    <?php } ?>
                                </div>

                                <div class="status_addtocart">
                                    <span class="status_stock"><i class="fa fa-circle green"></i> Còn hàng</span>
                                    <button class="addtocart" type="button" onclick="cart.add('<?php echo $product["product_id"]; ?>'); return false;">Mua hàng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>
        </div>
    </div>
</div>