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

            <div class="row container_content">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 news-details">
                    <div id="ContentPlaceHolder1_ContentPlaceHolder1_divNews" class="w690 fl mt5 mb10 news-details">
                        <div class="news-show">
                            <h1><?php echo $post_title; ?></h1>
                            <div>
                                <span><?php echo $post_modified; ?></span>
                            </div>
                            <div class="content clearfix">
                                <h2 class="init_content oh"><?php echo $post_short_description; ?></h2>
                                <div id="ContentDetail"><?php echo $post_content; ?></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?php echo $content_bottom; ?>
            <?php echo $column_right; ?>
        </div>
    </div>
</div>
<?php echo $footer; ?>