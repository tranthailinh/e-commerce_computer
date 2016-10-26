<?php echo $header; ?>
<div class="container">

    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="single_cart">
            <?php echo $content_top; ?>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>

            <div id="checkout_session">
                <div class="current s1" style="z-index: 3;"><span>Thông tin đơn hàng</span><span class="glyphicon glyphicon-ok"></span></div>
                <div class="current s2" style="z-index: 2;"><span>Thông tin vận chuyển</span><span class="glyphicon glyphicon-ok"></span></div>
                <div class="current s3" style="z-index: 1;"><span>Hoàn tất</span><span class="glyphicon glyphicon-ok"></span></div>
            </div>

            <div class="checkout_content">
                <form method="post" name="formbaogia1" id="formbaogia1">
                    <table width="100%" align="center">
                            <tr>
                                <td style="padding: 20px;">
                                    <div class="pcConfig-header">
                                        <p class="pcConfig-logo">
                                            <a href="http://hanoicomputer.vn/"><img src="<?php echo $logo; ?>" alt=""></a>
                                        </p>
                                        <p class="pcConfig-address">
                                            <b>Công ty TNHH thương mại và tin học Tú Nguyệt</b><br>
                                            Trụ sở chính : 11 Vũ Thạnh - Cát Linh - Đống Đa - HN <br>
                                            Tel: (04) 35120778; Fax : (04) 36288790
                                        </p>
                                    </div>

                                    <div id="pnSendFlase">
                                        <div class="clear"></div>

                                        <div class="pcConfig-title">
                                            <div>
                                                <h1 class="cssH1">BẢNG CHÀO GIÁ </h1></div>
                                            <div style="font-size:11px;">Tue, 18/10/2016 01:29am</div>
                                        </div>

                                        <div class="clear"></div>

                                        <div class="pcConfig-customer">
                                            <div class="customerLeft">
                                                <p>Ông/bà: Quý khách hàng</p>
                                                <p>Đơn vị:</p>
                                                <p>Địa chỉ:</p>
                                                <p>Điện thoại:</p>
                                            </div>
                                            <div class="customerRight">
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                                <p>Email:</p>
                                                <p>Fax:</p>
                                            </div>
                                            <div class="clear"></div>
                                        </div>


                                        <table id="tb_config" cellpading="0" cellspacing="0" border="1" bordercolor="#999999">
                                            <tbody><tr id="row_config">
                                                <td style="text-align:center; width:12px; ">STT</td>
                                                <td>Tên sản phẩm</td>
                                                <td style="text-align:center; width:20px;">Số lượng</td>
                                                <td style="text-align:center; width:80px;">Đơn giá (VNĐ)</td>
                                                <td style="text-align:center; width:80px;">Thành tiền (VNĐ)</td>
                                                <td style="text-align:center; width:50px;">Bảo hành</td>
                                            </tr>
                                            <?php if($products){ ?>
                                                <?php foreach($products as $key => $product){ ?>
                                                <tr>
                                                    <td><?php echo ($key + 1); ?></td>
                                                    <td>
                                                        <p class="pcName">
                                                            <a href="<?php echo $product['href']; ?>" target="_blank"><?php echo $product['name']; ?></a>
                                                        </p>
                                                        <p class="pcSKU"><b>Mã SP: </b><?php echo $product['model']; ?></p>
                                                        <p class="pcSummary"></p>
                                                        <p style="border-bottom: 1px solid #ccc;"><strong>Cấu hình sản phẩm: </strong></p>
                                                        <?php if($product['configure']){ ?>
                                                            <p class="pcSummary configure">
                                                                <?php foreach($product['configure'] as $configure){ ?>
                                                                    <p><strong><?php echo $configure['name']; ?>: </strong><?php echo $configure['value']; ?></p>
                                                                <?php } ?>
                                                            </p>
                                                        <?php } ?>
                                                    </td>
                                                    <td><input type="text" value="<?php echo $product['quantity']; ?>" style="width:50px" name="txtQuantiry1" rel="1359000" relclass="cssTotal1" class="cssCount quantity_confiq_0"> </td>
                                                    <td style="text-align:right; padding-right:5px;">
                                                        <span class="price"><?php echo $product['price']; ?></span>

                                                    </td>
                                                    <td style="text-align:right; padding-right:5px;">
                                                        <?php echo $product['total']; ?>
                                                    </td>
                                                    <td>36T</td>
                                                </tr>
                                                <?php } ?>
                                            <?php } ?>

                                            <tr>
                                                <td colspan="4" align="right"><b>Tổng tiền : </b></td>
                                                <td colspan="2" style=" font-weight:bold;">
                                                    <span id="TotalPrice"><?php echo $totals[1]['text']; ?></span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <div align="right" style="padding:10px 0px;" id="button-comfirm-print">
                                            <a href="#" class="comfirm">Đặt hàng</a>
                                            <a href="javascript:window.print();">In báo giá</a>
                                        </div>

                                        <script type="text/javascript">
                                            $('#button-comfirm-print .comfirm').on('click', function() {
                                                $.ajax({
                                                    type: 'get',
                                                    url: 'index.php?route=checkout/confirm',
                                                    cache: false,
                                                    beforeSend: function() {
                                                        $('#button-comfirm-print .comfirm').button('loading');
                                                    },
                                                    complete: function() {
                                                        $('#button-comfirm-print .comfirm').button('reset');
                                                    },
                                                    success: function() {
                                                            location = 'index.php?route=checkout/success';
                                                    },
                                                    error: function(xhr, ajaxOptions, thrownError) {
                                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                                    }
                                                });

                                                return false;
                                            });
                                        </script>

                                    </div>

                                </td>
                            </tr>
                    </table>
                </form>
            </div>

            <?php echo $content_bottom; ?>
        </div>
        <form method="post" name="formbaogia1" id="formbaogia2">
            <table width="100%" align="center">
                <tr>
                    <td style="padding: 20px;">
                        <div class="pcConfig-header">
                            <p class="pcConfig-logo">
                                <a href="http://hanoicomputer.vn/"><img src="<?php echo $logo; ?>" alt=""></a>
                            </p>
                            <p class="pcConfig-address">
                                <b>Công ty TNHH thương mại và tin học Tú Nguyệt</b><br>
                                Trụ sở chính : 11 Vũ Thạnh - Cát Linh - Đống Đa - HN <br>
                                Tel: (04) 35120778; Fax : (04) 36288790
                            </p>
                        </div>

                        <div id="pnSendFlase">
                            <div class="clear"></div>

                            <div class="pcConfig-title">
                                <div>
                                    <h1 class="cssH1">BẢNG CHÀO GIÁ </h1></div>
                                <div style="font-size:11px;">Tue, 18/10/2016 01:29am</div>
                            </div>

                            <div class="clear"></div>

                            <div class="pcConfig-customer">
                                <div class="customerLeft">
                                    <p>Ông/bà: Quý khách hàng</p>
                                    <p>Đơn vị:</p>
                                    <p>Địa chỉ:</p>
                                    <p>Điện thoại:</p>
                                </div>
                                <div class="customerRight">
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>Email:</p>
                                    <p>Fax:</p>
                                </div>
                                <div class="clear"></div>
                            </div>


                            <table id="tb_config" cellpading="0" cellspacing="0" border="1" bordercolor="#999999">
                                <tbody><tr id="row_config">
                                    <td style="text-align:center; width:12px; ">STT</td>
                                    <td>Tên sản phẩm</td>
                                    <td style="text-align:center; width:20px;">Số lượng</td>
                                    <td style="text-align:center; width:80px;">Đơn giá (VNĐ)</td>
                                    <td style="text-align:center; width:80px;">Thành tiền (VNĐ)</td>
                                    <td style="text-align:center; width:50px;">Bảo hành</td>
                                </tr>
                                <tr>
                                    <td> 1</td>
                                    <td>
                                        <p class="pcName"><a href="/cpu-intel-pentium-g4400-33g-3mb-hd-graphics-510-socket-1151-skylake/p30139.html" target="_blank">CPU Intel Pentium G4400 3.3G / 3MB / HD Graphics 510 / Socket 1151 (Skylake)</a></p>
                                        <p class="pcSKU"><b>Mã SP: </b>CPUI197</p>
                                        <p class="pcSummary"></p>
                                        <p class="pcSummary">Khuyến mại giảm 150.000đ khi mua kèmDDRam 4 AVEXIR 4GB/2400 (1*4GB) 1COB - Core( RAAV095)  và Mainboard Asrock H110M-HDV (MBAR161)</p>
                                    </td>
                                    <td><input type="text" value="1" style="width:50px" name="txtQuantiry1" rel="1359000" relclass="cssTotal1" class="cssCount quantity_confiq_0"> </td>
                                    <td style="text-align:right; padding-right:5px;">
                                        <span class="price">1.359.000 <span class="currencyVND">VND</span></span>

                                    </td>
                                    <td style="text-align:right; padding-right:5px;"><span class="cssTotal1" relbefore="1359000">1.359.000</span></td>
                                    <td>36T</td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="right"><b>Tổng tiền : </b></td>
                                    <td colspan="2" style=" font-weight:bold;">
                                        <span id="TotalPrice"><?php echo $total; ?></span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </td>
                </tr>
            </table>
        </form>
        <style>
            #tb_config {
                width: 100%;
                border-collapse: collapse;
            }
            #row_config {
                background-color: #88a3c4;
                font-weight: bold;
                color: #fff;
            }
            #tb_config td {
                padding: 6px;
            }
            .pcConfig-hello {
                display: block;
                text-align: center;
                font-weight: bold;
                padding-bottom: 5px;
            }
            .pcConfig-header {
                float: left;
                width: 100%;
                border-bottom: solid #666666 1px;
            }
            .pcConfig-logo {
                float: left;
            }
            .pcConfig-address {
                float: right;
                line-height: 18px;
                text-align: right;
                color: #000;
            }
            .pcConfig-address b {
                color: #12488a;
                font-size: 15px;
                display: inline-block;
                padding-bottom: 10px;
            }
            .clear {
                clear: both;
            }
            .pcConfig-title {
                text-align: center;
                border-top: 1px solid #666666;
                margin-top: 1px;
                display: block;
                padding-top: 5px;
            }
            .pcConfig-title h1 {
                font-size: 27px;
                color: #12488a;
                font-weight: bold;
            }
            .pcConfig-customer {
                padding-top: 10px;
                margin-bottom: 15px;
            }
            .pcConfig-customer .customerLeft {
                float: left;
                width: 50%;
            }
            .pcConfig-customer p {
                margin-bottom: 2px;
                color: #000;
                font-size: 13px;
            }
            .pcConfig-customer .customerRight {
                float: left;
            }
        </style>

        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
    // Shipping Address
    $(document).delegate('#button-shipping-address', 'click', function() {
        $.ajax({
            url: 'index.php?route=checkout/shipping_address/save',
            type: 'post',
            data: $('#form-shipping-address input[type=\'text\'],#form-shipping-address input[type=\'email\'], #collapse-shipping-address textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-shipping-address').button('loading');
            },
            complete: function() {
                $('#button-shipping-address').button('reset');
            },
            success: function(json) {
                console.log(json);
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {

                    for (i in json['error']) {
                        var element = $('#input-shipping-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().parent().addClass('has-error');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    //--></script>