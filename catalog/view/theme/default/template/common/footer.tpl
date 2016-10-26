<footer>
  <div class="footer_fb_support">
    <div class="custom-container">
        <div class="block_fanpage">
          <div class="fb-page" data-href="https://www.facebook.com/FacebookVietnam/?fref=ts" data-width="481" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/FacebookVietnam/?fref=ts" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/FacebookVietnam/?fref=ts">Facebook</a></blockquote></div>
        </div>
        <div class="block_support">
          <div class="header">Tổng đài hõ trợ</div>
          <div class="cl cl1">
            <p style="color: #0083c0; margin-bottom: 5px;">Bán hàng online</p>
            <p style="color: #0083c0;font-size: 19px;margin-bottom: 15px;">Tổng đài: 19001234</p>
            <p>#0 Để gặp chăm sóc khách hàng</p>
            <p>#1 Để mua hàng trực tuyến</p>
            <p>#2 Để hỗ trợ kỹ thuật</p>
            <p>#3 Để yêu cầu bảo hành</p>
          </div>
          <div class="cl cl2">
            <p style="color: #fff;">.</p>
            <p style="color: #0083c0;margin-bottom: 15px;">Góp ý, thắc mắc, khiếu nại</p>
            <p>skh@hanoicomputer.com</p>
            <p>Tổng đài: 043.628.0886 #0</p>
            <p>Hotline: 09123456789</p>
          </div>

          <img src="image/1-Homepage-TNCStore1.png" alt="">
        </div>
    </div>
  </div>

  <div class="footer_info">
    <div class="custom-container">
        <p class="header">Công ty TNHH thương mại & tin học tú nguyệt</p>
        <div class="cl cl1">
          <p class="title">Trụ sở</p>
          <p>11 Vũ Thạnh - Cát Linh - Đống Đa - HN</p>
          <p>Tel: (04) 35120778; Fax : (04) 36288790</p>
        </div>
        <div class="cl cl2">
          <p class="title">Showroom</p>
          <p>Số 222 Lê Thanh Nghị - Hà Nội</p>
          <p>Tel: (04) 36288790 Fax : (04) 36288790</p>
        </div>
        <div class="cl cl3">
          <p class="title">Trung tâm bảo hành</p>
          <p>Số 222 Lê Thanh Nghị - Hà Nội </p>
          <p>Tel:(04) 36288790 Fax :(04) 36288790 </p>
        </div>
    </div>
  </div>


</footer>
<div id="background_overlay"></div>

<?php echo $banner_left_right; ?>

<script>
  $('.footer_fb_support > div > div').equalHeights();

  $(document).ready(function() {
      $('#seach-hover').click(function(){
        $("#background_overlay").css('display', 'block');
        $("#search").css('display', 'inline-table');
      });

      $('#background_overlay').click(function(){
        $("#background_overlay").css('display', 'none');
        $("#search").css('display', 'none');
        $("#basket-content").css('display', 'none');
      });

    $(document).on("click", "#basket-hover", function(){
      $("#background_overlay").css('display', 'block');
      $("#basket-content").css('display', 'block');
    });
  });

</script>
<!--<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<style>
  #cfacebook{
    position: fixed;
    bottom: 0px;
    right: 8px;
    z-index: 999999999999999;
    width: 250px; height: auto;
    box-shadow: 6px 6px 6px 10px rgba(0,0,0,0.2);
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    overflow: hidden;
  }
  #cfacebook .fchat{float: left; width: 100%; height: 295px; overflow: hidden; display: none; background-color: #fff;}
  #cfacebook .fchat .chat-single{float: left; line-height: 25px; line-height: 25px; color: #333; width: 100%;}
  #cfacebook .fchat .chat-single a{float: right; text-decoration: none; margin-right: 10px; color: #888; font-size: 12px;}
  #cfacebook .fchat .chat-single a:hover{color: #222;}

  #cfacebook .fchat .fb-page{margin-top: -130px; float: left;}
  #cfacebook a.chat_fb{
    float: left;
    padding: 0 25px;
    width: 250px;
    color: #fff;
    text-decoration: none;
    height: 40px;
    line-height: 40px;
    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);

    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAqCAMAAABFoMFOAAAAWlBMV�8/UxBxQDQuFwlpqgBZBq6+P+unVY1GnDgwqbD2zGz5e1lBdwvGGPE6OgAAAABJRU5ErkJggg==);
    background-repeat: repeat-x;
    background-size: auto;
    background-position: 0 0;
    background-color: #0065BF;
    border: 0;
    border-bottom: 1px solid #0065BF;
    z-index: 9999999;
    margin-right: 12px; font-size: 18px;}
  #cfacebook a.chat_fb:hover{color: yellow; text-decoration: none;}
</style>
<script>
  function fchat()
  {
    var tchat= document.getElementById("tchat").value;
    if(tchat==0 || tchat=='0')
    {
      document.getElementById("fchat").style.display = "block";
      document.getElementById("tchat").value=1;
    }else{
      document.getElementById("fchat").style.display = "none";
      document.getElementById("tchat").value=0;
    }
  }
  setTimeout(function() {document.getElementById("fchat").style.display = "block";}, 6000);
</script>

<div id="cfacebook">
  <a href="javascript:;" class="chat_fb" onclick="javascript:fchat();"><i class="fa fa-comments"></i> Hỗ trợ trực tuyến</a>
  <div id="fchat" class="fchat">
    <div class="fb-page" data-tabs="messages" data-href="https://www.facebook.com/Fashion-tees-1400981270192581/" data-width="250" data-height="400" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"></div>
    <div class="chat-single"><a target="_blank" href="https://www.facebook.com/Fashion-tees-1400981270192581/"><i class="fa fa-facebook-square"></i> Phùng Thế Anh</a></div>
  </div>
  <input type="hidden" id="tchat" value="0"/>
</div>
-->

</body></html>