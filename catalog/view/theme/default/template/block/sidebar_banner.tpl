<?php if($banner_sidebars){ ?>
<div class="left-banner">
    <ul class="list-unstyled">
        <?php foreach($banner_sidebars as $banner){ ?>
            <li>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></a>
            </li>
        <?php } ?>
    </ul>
</div>
<?php } ?>