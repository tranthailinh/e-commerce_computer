<?php echo $header; ?>
<div class="custom-container">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content">
      <?php echo $content_top; ?>
        <div class="box_image_category">
          <ul class="box_body list-unstyled">
              <li class="box_item">
                  <a class="link-wrapper" href="#" type="Gaming pc">
                      <span class="box-title">Gaming pc</span>
                      <div style="background-image: url('image/gaming-pc.png') ;" class="box-image"></div>
                  </a>
              </li>

              <li class="box_item">
                  <a class="link-wrapper" href="#" type="Gaming pc">
                      <span class="box-title">Gaming laptop</span>
                      <div style="background-image: url('image/gaming-laptop.png') ;" class="box-image"></div>
                  </a>
              </li>

              <li class="box_item">
                  <a class="link-wrapper" href="#" type="Gaming pc">
                      <span class="box-title">Gaming gear</span>
                      <div style="background-image: url('image/gaming-gear.png') ;" class="box-image"></div>
                  </a>
              </li>
              <li class="box_item">
                  <a class="link-wrapper" href="#" type="Gaming pc">
                      <span class="box-title">Bàn ghế game</span>
                      <div style="background-image: url('image/ghe-choigame.png') ;" class="box-image"></div>
                  </a>
              </li>
              <li class="box_item">
                  <a class="link-wrapper" href="#" type="Gaming pc">
                      <span class="box-title">Thiết bị âm thanh</span>
                      <div style="background-image: url('image/thietbiamthanh.png') ;" class="box-image"></div>
                  </a>
              </li>
              <li class="box_item">
                  <a class="link-wrapper" href="#" type="Gaming pc">
                      <span class="box-title">Tản nhiệt khí nước cho pc</span>
                      <div style="background-image: url('image/tannhiet-pc.png') ;" class="box-image"></div>
                  </a>
              </li>

          </ul>
      </div>
        <div class="box_two_column_wrap">
          <div class="box_column_left">
              <?php echo $block_hotdeal; ?>
              <?php echo $block_news; ?>
          </div>

          <div class="box_column_right">
              <?php echo $block_highlight; ?>
          </div>
      </div>

        <div class="home_latest_block">
            <?php echo $block_home_latest; ?>
        </div>

        <div class="box_home_text_block">
            <div class="box_home_text_block_header">
                Thông tin mua hàng
            </div>
            <div class="box_home_text_block_content">
                <img src="<?php echo HTTP_SERVER ?>img-baohanh.png" alt="" class="img">
                <div class="description">
                    Overclockers UK offers the widest range of components and peripherals for your gaming PC needs. Overclockers UK products include: PC Gaming Systems, a range of Graphics cards from leading manufacturers, monitors - including 4k and ultrawide, powerful gaming laptops, high specification mobile workstations, Intel and AMD CPUs, ultra fast memory.
                </div>
                <a class="see_more" href="#">Xem thêm</a>
            </div>
            <div class="box_home_text_block_header">
               Chính sách bảo hành
            </div>
            <div class="box_home_text_block_content">
                <img src="<?php echo HTTP_SERVER ?>img-baohanh.png" alt="" class="img">
                <div class="description">
                    Overclockers UK offers the widest range of components and peripherals for your gaming PC needs. Overclockers UK products include: PC Gaming Systems, a range of Graphics cards from leading manufacturers, monitors - including 4k and ultrawide, powerful gaming laptops, high specification mobile workstations, Intel and AMD CPUs, ultra fast memory.
                </div>
                <a class="see_more" href="#">Xem thêm</a>
            </div>
            <div class="box_home_text_block_header">
                Thông tin vận chuyển
            </div>
            <div class="box_home_text_block_content">
                <img src="<?php echo HTTP_SERVER ?>img-vanchuyen.png" alt="" class="img">
                <div class="description">
                    Overclockers UK offers the widest range of components and peripherals for your gaming PC needs. Overclockers UK products include: PC Gaming Systems, a range of Graphics cards from.
                </div>
                <a class="see_more" href="#">Xem thêm</a>
            </div>
        </div>
      <?php echo $content_bottom; ?>
    </div>

    <?php echo $block_find_brands; ?>
    <?php echo $block_recent_viewed; ?>

    <?php echo $column_right; ?>
</div>

<script type="text/javascript">
    $('.box_two_column_wrap > div').equalHeights();
</script>
<?php echo $footer; ?>