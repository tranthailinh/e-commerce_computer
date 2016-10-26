<?php if($banner_lefts){ ?>
<div id="bannerLeft">
    <?php foreach($banner_lefts as $banner){ ?>
    <div class="banner">
        <a href="<?php echo $banner['link']; ?>" alt="<?php echo $banner['title']; ?>">
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
        </a>
    </div>
    <?php } ?>
</div>
<?php } ?>

<?php if($banner_rights){ ?>
<div id="bannerRight">
    <?php foreach($banner_rights as $banner){ ?>
    <div class="banner">
        <a href="<?php echo $banner['link']; ?>" alt="<?php echo $banner['title']; ?>">
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
        </a>
    </div>
    <?php } ?>
</div>
<?php } ?>

<style>
    #bannerLeft {
        position: fixed;
        left: 40px;
        top: 110px;
    }
    #bannerRight {
        position: fixed;
        right: 40px;
        top: 110px;
    }
</style>