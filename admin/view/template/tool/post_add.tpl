<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">

                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <ul class="nav nav-tabs" id="language">
                                <?php foreach ($languages as $language) { ?>
                                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                            <div class="tab-content">
                                <?php foreach ($languages as $language) { ?>
                                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $text_post_title; ?></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="post_title" value="<?php echo isset($post_title) ? $post_title : ''; ?>" placeholder="<?php echo $text_post_title; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                                            <input type="hidden" name="post_type" value="write"  id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                                            <?php if ($error_post_title) { ?>
                                            <div class="text-danger"><?php echo $error_post_title; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $text_avata; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="post_short_description" rows="5" placeholder="<?php echo $text_short_title ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($post_short_description) ? $post_short_description : ''; ?></textarea>
                                            <!--<input type="text" name="post_short_description" value="<?php echo isset($post_short_description) ? $post_short_description : ''; ?>" placeholder="<?php echo $text_short_title; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />-->
                                            <?php if ($error_post_short_description) { ?>
                                            <div class="text-danger"><?php echo $error_post_short_description; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_post_content; ?></label>
                                        <div class="col-sm-10">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover">
                                                    <tbody>
                                                    <tr>
                                                        <td class="text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                                            <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_post_content; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="post_content"  id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($post_content) ? $post_content : ''; ?></textarea>
                                            <?php if ($error_post_content) { ?>
                                            <div class="text-danger"><?php echo $error_post_content; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $meta_keyword; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                                        <div class="col-sm-10">
                                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <?php } ?>
                            </div>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
    <script type="text/javascript"><!--
    $('#language a:first').tab('show');
    $('#option a:first').tab('show');
    //--></script></div>
<?php echo $footer; ?>
