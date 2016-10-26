<?php
class ModelPostPost extends  Model {
    public function getPostInfo($post_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "post WHERE ID = '" . (int)$post_id . "'");

        return $query->row;
    }
    public function getAllPost() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "post");

        return $query->rows;
    }

    public function getTotalPosts($data = array()) {
        $sql = "SELECT COUNT(DISTINCT ID) AS total FROM " . DB_PREFIX . "post WHERE post_type = '" . $this->db->escape($data['post_type']) . "'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

}

