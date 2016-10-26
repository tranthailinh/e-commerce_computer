<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data_lv2 = array();
				$categoris_lv2 = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($categoris_lv2 as $key => $category_lv2) {

					// Level 3
					$children_data_lv3 = array();
					$categoris_lv3 = $this->model_catalog_category->getCategories($category_lv2['category_id']);

					foreach ($categoris_lv3 as $key => $category_lv3) {
						$children_data_lv3[] = array(
							'category_id' => $category_lv3['category_id'],
							'name'  => $category_lv3['name'],
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $category_lv2['category_id'] . '_' . $category_lv3['category_id']),
							'level'	=> 3
						);
					}

					$children_data_lv2[] = array(
						'category_id' => $category_lv2['category_id'],
						'name'  => $category_lv2['name'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $category_lv2['category_id']),
						'level'	   => 2,
						'children' => $children_data_lv3
					);
				}

				// Level 1
				$data['categories'][] = array(
					'category_id' => $category['category_id'],
					'name'     => $category['name'],
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
					'image'	   => $category['image'],
					'level'	   => 1,
					'children' => $children_data_lv2
				);
			}
		}

		return $this->load->view('module/category', $data);
	}

}