<?php echo $header; ?>
<div class="container">
    <div class="row">
        <?php echo $column_left; ?>
        <div id="content" class="col-sm-9"><?php echo $content_top; ?>
            <div class="row">
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-4 catalog_wrap">
                    <div class="catalog_title">
                        <a href="tin-tuc-mang">
                            <img src="<?php echo HTTP_IMAGE; ?>catalog/newinternet.png"/>
                            Tin Tức Báo Mạng
                        </a>
                    </div>
                </div>
                <div class="col-md-4 catalog_wrap">
                    <div class="catalog_title">
                        <a href="tin-tuc-tnc">
                            <img src="<?php echo HTTP_IMAGE; ?>catalog/logotiny.png"/>
                            Tin Tức Từ TNC
                        </a>
                    </div>
                </div>
                <div class="col-md-4 catalog_wrap">
                    <div class="catalog_title">
                        <a href="#">
                            <img src="<?php echo HTTP_IMAGE; ?>catalog/khuyenmai.png"/>
                            Tin Tức Khuyến Mại
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php if(isset($posts)) { ?>
                <?php $i = 0;
                            $len = count($posts);
                            foreach($posts as $post) {
                                if ($i == 0) { ?>
                <div class="row wrap-first">
                    <div class="col-sm-6 post_wrap post_first">
                        <div class="home-highlight-5-primary item" data-boxtype="zonenewsposition">
                            <div class="home-highlight-5-img">
                                <img src="<?php echo $post['post_image']; ?>"/>
                                <a href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>" class="home-highlight-5-glass sprite"></a>
                            </div>
                            <div class="home-highlight-5-title">
                                <div class="home-highlight-5-thread thread nodisplay"></div>
                                <h2><a title="<?php echo $post['title']; ?>"
                                       href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>"
                                       data-id="20161008115602425"
                                       data-linktype="newsdetail"><?php echo $post['title']; ?></a></h2>
                            </div>
                        </div>
                    </div>
                    <?php if ($len == 0) {?>
                    </div>
                    <?php } ?>
                    <?php } else if ($i == 1) { ?>
                    <div class="col-sm-6 post_wrap">
                        <div class="row" style="margin-left: -14px">
                            <div class="col-sm-12 post_wrap">
                                <div class="home-highlight-5-second item-0" data-boxtype="zonenewsposition">
                                    <div class="home-highlight-5-img">
                                        <img src="<?php echo $post['post_image']; ?>"/>
                                        <a href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>" class="home-highlight-5-glass sprite glass-0"></a>
                                    </div>
                                    <div class="home-highlight-5-title">
                                        <div class="home-highlight-5-thread thread nodisplay"></div>
                                        <h2><a title="<?php echo $post['title']; ?>"
                                               href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>"
                                               data-id="20161008115602425"
                                               data-linktype="newsdetail"><?php echo $post['title']; ?></a></h2>
                                    </div>
                                </div>
                            </div>
                            <?php if ($len == 2) {?>
                            </div>
                            </div>
                            </div>
                            <?php } ?>
                            <?php } else if ($i == 2) { ?>
                            <div class="col-sm-12 post_wrap">
                                <div class="home-highlight-5-second item-1" data-boxtype="zonenewsposition">
                                    <div class="home-highlight-5-img">
                                        <img src="<?php echo $post['post_image']; ?>"/>
                                        <a href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>" class="home-highlight-5-glass sprite glass-1"></a>
                                    </div>
                                    <div class="home-highlight-5-title">
                                        <div class="home-highlight-5-thread thread nodisplay"></div>
                                        <h2><a title="<?php echo $post['title']; ?>"
                                               href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>"
                                               data-id="20161008115602425"
                                               data-linktype="newsdetail"><?php echo $post['title']; ?></a></h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php } else {?>
                <div class="col-sm-6 post_wrap">
                <div class="home-highlight-5-second item-1" data-boxtype="zonenewsposition">
                <div class="home-highlight-5-img">
                <img src="<?php echo $post['post_image']; ?>"/>
                <a href="#" class="home-highlight-5-glass sprite glass-1"></a>
                </div>
                <div class="home-highlight-5-title">
                <div class="home-highlight-5-thread thread nodisplay"></div>
                <h2><a title="<?php echo $post['title']; ?>"
                href="index.php?route=post/post&post_id=<?php echo $post['post_id']; ?>"
                data-id="20161008115602425"
                data-linktype="newsdetail"><?php echo $post['title']; ?></a>
                </h2>
                </div>
                </div>
                </div>
                <?php } ?>
                <?php $i++;} ?>
                <?php } ?>

            </div>

            <?php if($pagination){ ?>
            <div class="row wrap_pagintion" style="margin-bottom: 8px; margin-left: 0px;">
                <div class="col-sm-6 text-right"><?php echo $pagination; ?></div>
            </div>
            <?php } ?>

            <?php echo $content_bottom; ?>
            <?php echo $column_right; ?>
        </div>
    </div>
</div>
<?php echo $footer; ?>
