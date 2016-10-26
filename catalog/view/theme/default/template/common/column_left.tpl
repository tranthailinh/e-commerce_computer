<?php if ($modules) { ?>
<aside id="column-left">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>

  <div class="left-social">
    <ul class="list-unstyled sidebarbox">
      <li class="fb"><a target="_blank" href="https://www.facebook.com">Facebook</a></li>
      <li class="it"><a target="_blank" href="https://www.instagram.com">Instagram</a></li>
      <li class="yt"><a target="_blank" href="https://www.youtube.com">Youtube</a></li>
    </ul>
  </div>

  <?php echo $top_brands; ?>

  <?php echo $banner_sidebar; ?>

</aside>
<?php } ?>
