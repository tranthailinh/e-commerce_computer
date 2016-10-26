<?php
class ModelToolPost extends Model {
    public function addPost($data) {
        $this->db->query("INSERT INTO " . DB_PREFIX . "post SET  post_date = NOW()" . ", post_content = '" . $this->db->escape($data['post_content']) . "', post_title = '" . $this->db->escape($data['post_title']) . "', post_image = '" . $this->db->escape($data['img_title']) . "', post_type = '" . $data['post_type'] . "', post_short_description = '" . $this->db->escape($data['post_short_description']) . "'");

        $post_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "post SET post_image = '" . $this->db->escape($data['image']) . "' WHERE ID = '" . (int)$post_id . "'");
        }
    }

    public function deletePost($id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "post WHERE ID = '" . $id . "'");
    }

    public function editPost($post_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "post SET post_content = '" . $this->db->escape($data['post_content']) . "', post_title = '" . $this->db->escape($data['post_title']) . "', post_modified = NOW() WHERE ID = '" . (int)$post_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "post SET post_image = '" . $this->db->escape($data['image']) . "' WHERE ID = '" . (int)$post_id . "'");
        }
    }

    public function getPostInfo($post_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "post WHERE ID = '" . (int)$post_id . "'");

//        foreach ($query->rows as $result) {
//            $post_info = array(
//                'post_title' => $result['post_title'],
//                'post_content' => $result['post_content']
//            );
//        }

        return $query->row;
    }
    public function getAllPost() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "post");

        return $query->rows;
    }
}