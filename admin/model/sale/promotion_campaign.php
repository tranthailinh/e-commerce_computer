<?php
class ModelSalePromotionCampaign extends Model {
    public function addSpecial($data, $product_id){
        $query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product WHERE product_id = " . $product_id);
        $old_price = $query->row;

        if($data['discount_type'] == 'percent'){
            $price = $old_price['price'] - $old_price['price']*(float)$data['discount_size']/100;
        }else{
            $price = $old_price['price'] - $data['discount_size'];
        }

        $this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = " . (int)$product_id . ", discount_type = '" . $this->db->escape($data['discount_type']) . "', customer_group_id = " . (int)$data['customer_group_id'] . ", priority = " . (int)$data['priority'] . ", price = " . (float)$price . ", date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "'");
    }

    public function getProductSpecials($data = array()) {
        $sql = "SELECT ps.product_special_id, ps.discount_type, ps.customer_group_id, ps.priority, ps.price as special_price, ps.date_start, ps.date_end, p.price as price, pd.name, p.image FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) ORDER BY ps.priority, ps.price";


        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getProductSpecial($product_special_id) {
        $query = $this->db->query("SELECT ps.discount_type, ps.customer_group_id, ps.priority, ps.price as special_price, ps.date_start, ps.date_end, p.price as price, pd.name, p.image FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE ps.product_special_id = ".$product_special_id);

        return $query->row;
    }

    public function getTotalSpecial() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_special");

        return $query->row['total'];
    }

    public function updateSpecial($data){
        if($data['discount_type'] == 'percent'){
            $price = $data['old_price'] - $data['old_price']*$data['discount_size']/100;
        }else{
            $price = $data['old_price'] - $data['discount_size'];
        }

        $this->db->query("UPDATE " . DB_PREFIX . "product_special SET discount_type = '".$this->db->escape($data['discount_type'])."', customer_group_id = ".(int)$data['customer_group_id'].", priority = ".(int)$data['priority'].", price = ".(float)$price.", date_start = '".$this->db->escape($data['date_start'])."', date_end = '".$this->db->escape($data['date_end'])."' WHERE product_special_id = " . (int)$data['special_id']);

        return $this->getProductSpecial($data['special_id']);
    }

    public function deleteSpecial($special_id){
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_special_id = " . (int)$special_id );
    }
}