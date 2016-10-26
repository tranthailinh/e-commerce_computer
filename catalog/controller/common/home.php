<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$data['block_hotdeal'] = $this->load->controller('block/home_hotdeal');
		$data['block_highlight'] = $this->load->controller('block/home_highlight');
		$data['block_news'] = $this->load->controller('block/home_news');

		$data['block_find_brands'] = $this->load->controller('block/find_brands');
		$data['block_recent_viewed'] = $this->load->controller('block/recent_viewed');

		$data['block_home_latest'] = $this->load->controller('block/home_latest');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}