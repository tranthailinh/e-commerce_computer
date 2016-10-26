<?php if($brands){ ?>
<div class="left-topbrands">
    <h3>Top Brands</h3>

    <ul class="list-unstyled sidebarbox">
        <?php foreach($brands as $brand){ ?>
            <li>
                <a href="<?php echo $brand['href']; ?>" title="<?php echo $brand['name']; ?>">
                    <div class="image_holder" style="background-image: url('<?php echo $brand['image']; ?>')"></div>
                </a>
            </li>
        <?php } ?>
    </ul>
</div>
<?php } ?>