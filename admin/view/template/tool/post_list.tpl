<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($error_link_crawler) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_link_crawler; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="well">
                    <div class="row">
                        <?php if (isset($link_crawler)) { ?>
                        <h4><?php echo $link_crawler;?></h4>
                        <?php } ?>
                        <form action="<?php echo $crawler; ?>" method="post" id="form-upload">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <input type="text" name="link_crawler" value=""
                                           placeholder="Nhập link cần lấy dữ liệu" id="input-name" class="col-sm-8 form-control" style="width: 80%"/>
                                    <button type="button" class="btn btn-default" onclick="$('#form-upload').submit()">
                                        Gửi
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td style="width: 1px;" class="text-center"><input type="checkbox"
                                                                                   onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"/>
                                </td>
                                <td class="text-center"><?php echo $column_title; ?></td>
                                <td class="text-center"><?php echo $column_post_date; ?></td>
                                <td class="text-center"><?php echo $column_status; ?></td>
                                <td class="text-center"><?php echo $column_type; ?></td>
                                <td class="text-center"><?php echo $column_modified; ?></td>
                                <td class="text-center"><?php echo $column_action; ?></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (isset($posts)) { ?>
                            <?php foreach ($posts as $post) { ?>

                            <tr>
                                <td class="text-center">
                                    <input type="checkbox" name="selected[]" value="<?php echo $post['post_id']; ?>" />
                                </td>
                                <td class="text-left"><?php echo $post['title']; ?></td>
                                <td class="text-left"><?php echo $post['post_date']; ?></td>
                                <td class="text-left"><?php echo $post['post_status']; ?></td>
                                <td class="text-left"><?php echo $post['post_type']; ?></td>
                                <td class="text-left"><?php echo $post['post_modified']; ?></td>
                                <td class="text-right"><a href="<?php echo $post['post_edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                            </tr>
                            </tbody>

                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>