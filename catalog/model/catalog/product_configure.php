<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 9/26/2016
 * Time: 10:19 AM
 */

class ModelCatalogProductConfigure extends Model {
    public function getConfigure($product_id){
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_configure WHERE product_id = " .$product_id);

        return $query->rows;
    }

    public function getChildProducts($product_id){
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_configure_child WHERE product_cf_id = " .$product_id);

        return $query->rows;
    }

    public function getConfigurePrice($product_id){

    }
}