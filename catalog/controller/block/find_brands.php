<?php
class ControllerBlockFindBrands extends Controller {
    public function index() {
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $data['brands'] = array();

        $this->load->model('catalog/manufacturer');

        $results = $this->model_catalog_manufacturer->getManufacturers();
        $this->load->model('tool/image');

        foreach ($results as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
            }

            $data['brands'][] = array(
                'name' => $result['name'],
                'image' => $image,
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
            );
        }

        return $this->load->view('block/find_brands', $data);
    }
}
