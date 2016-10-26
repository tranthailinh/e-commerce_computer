<?php
class ControllerModulePromotionCampaign extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/promotion_campaign');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

        $this->getForm();
    }

    public function add(){
        $this->load->language('module/promotion_campaign');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/promotion_campaign');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            if (isset($this->request->post['product'])){
                foreach ($this->request->post['product'] as $product_id) {
                    $this->model_sale_promotion_campaign->addSpecial($this->request->post, $product_id);
                }
            }

            $this->session->data['success'] = $this->language->get('text_add_special_success');

            $this->response->redirect($this->url->link('module/promotion_campaign', 'token=' . $this->session->data['token'], true));
        }

        $this->getForm();
    }

    public function edit(){

    }

    public function delete(){
        $this->load->language('module/promotion_campaign');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('sale/promotion_campaign');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $special_id) {
                $this->model_sale_promotion_campaign->deleteSpecial($special_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('module/promotion_campaign', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function getForm(){
        $this->load->model('sale/promotion_campaign');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $special_total = $this->model_sale_promotion_campaign->getTotalSpecial();

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
        );

        if (!isset($this->request->get['module_id'])) {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('module/latest', 'token=' . $this->session->data['token'], true)
            );
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('module/latest', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
            );
        }

        // Hiển thị danh sách sản phẩm
        $this->load->model('sale/promotion_campaign');
        $this->load->model('tool/image');

        $filter_data = array(
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $results = $this->model_sale_promotion_campaign->getProductSpecials($filter_data);

        $data['products'] = array();

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            if($result['discount_type'] == 'percent'){
                $discount_size = ($result['price'] - $result['special_price'])/$result['price'] * 100;
            }else{
                $discount_size = $result['price'] - $result['special_price'];
            }

            $data['products'][] = array(
                'product_special_id' => $result['product_special_id'],
                'customer_group_id'      => $result['customer_group_id'],
                'discount_type'      => $result['discount_type'],
                'discount_size'      => $discount_size,
                'priority'      => $result['priority'],
                'date_start'      => ($result['date_start'] != '0000-00-00') ? $result['date_start'] : '',
                'date_end'      => ($result['date_end'] != '0000-00-00') ? $result['date_end'] : '',
                'image'      => $image,
                'name'       => $result['name'],
                'price'      => $result['price'],
                'special_price'      => $result['special_price'],
                'discount'      => $result['discount_type'],
                'edit'       => $this->url->link('module/promotion_campaign/ajaxUpdateSpecial', 'token=' . $this->session->data['token'], true)
            );
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $data['token'] = $this->session->data['token'];

        $pagination = new Pagination();
        $pagination->total = $special_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');  
        $pagination->url = $this->url->link('module/promotion_campaign', 'token=' . $this->session->data['token'] . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($special_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($special_total - $this->config->get('config_limit_admin'))) ? $special_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $special_total, ceil($special_total / $this->config->get('config_limit_admin')));


        $this->load->model('customer/customer_group');
        $data['customer_groups'] = array();
        $data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/promotion_campaign', $data));
    }

    public function ajaxUpdateSpecial(){
        $json = array();

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->load->model('sale/promotion_campaign');
            $result = $this->model_sale_promotion_campaign->updateSpecial($this->request->post);

            if($result){
                $json['data'] = $result;
            }else{
                $json['error'] = 'true';
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'module/promotion_campaign')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/latest')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        if (!$this->request->post['width']) {
            $this->error['width'] = $this->language->get('error_width');
        }

        if (!$this->request->post['height']) {
            $this->error['height'] = $this->language->get('error_height');
        }

        return !$this->error;
    }
}