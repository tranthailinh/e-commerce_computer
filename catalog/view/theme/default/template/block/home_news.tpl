<div class="box_column news">
    <div class="box_container">
        <div class="box_header">
            <span class="header_icon"> </span>
            <span class="header_text">Tin tức</span>
        </div>

        <div class="box_body">
            <div id="slideshow_news">
                <div class="item">
                    <?php foreach($posts as $key => $post){ ?>

                        <?php if(($key + 1) % 4 == 0){ ?>

                            <div class="item_new">
                                <a class="link_img" href="<?php echo $post['href']; ?>"><img src="<?php echo $post['image']; ?>" alt=""></a>
                                <h2 class="title"><a href="<?php echo $post['href']; ?>"><?php echo $post['title']; ?></a></h2>
                                <p class="description">
                                    <?php echo $post['description']; ?>
                                </p>
                            </div></div><div class="item">

                        <?php }else{ ?>
                            <div class="item_new">
                                <a class="link_img" href="<?php echo $post['href']; ?>"><img src="<?php echo $post['image']; ?>" alt=""></a>
                                <h2 class="title"><a href="<?php echo $post['href']; ?>"><?php echo $post['title']; ?></a></h2>
                                <p class="description">
                                    <?php echo $post['description']; ?>
                                </p>
                            </div>
                        <?php } ?>

                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
$('#slideshow_news').owlCarousel({
    items: 1,
    autoPlay: false,
    singleItem: true,
    navigation: false,
    navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
    pagination: true
});
--></script>