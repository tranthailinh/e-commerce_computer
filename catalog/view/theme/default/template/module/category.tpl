<div class="module-category">
  <h3>Danh mục sản phẩm</h3>
  <ul class="list-group list-unstyled">
      <?php foreach ($categories as $category) { ?>
          <li>
            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php if($category['children']){ ?>
                <ul class="sub-cat lv2 list-unstyled" style="background-image: url(<?php echo HTTP_SERVER .'image/' . $category['image']; ?>)">
                    <?php foreach ($category['children'] as $category) { ?>
                        <li>
                          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                          <?php if($category['children']){ ?>
                            <ul class="sub-cat lv3 list-unstyled">
                              <?php foreach ($category['children'] as $category) { ?>
                              <li>
                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                              </li>
                              <?php } ?>
                            </ul>
                          <?php } ?>
                        </li>
                    <?php } ?>
                </ul>
            <?php } ?>
          </li>
      <?php } ?>
  </ul>

  <div style="text-align: center; padding-bottom: 20px;">
    <a href="<?php echo HTTP_SERVER ?>xay-dung-cau-hinh-pc"><img src="image/cauhinh_pc.png" alt=""></a>
  </div>

</div>

<script type="text/javascript">
  $(document).ready(function($) {
    $(".module-category > ul > li").hover(function() {
      $(this).addClass('viewing');
    }, function() {
      $(this).removeClass('viewing');
    });
  });
</script>