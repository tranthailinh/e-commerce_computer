<?php

class ControllerPostPost extends Controller{
    private $error = array();

    public function index() {
        $this->load->language('post/post');
        $this->load->model('post/post');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['post_id'])) {
            $path = '';

            $parts = explode('_', (string)$this->request->get['post_id']);


            $post_id = (int)array_pop($parts);

            $post_details = $this->model_post_post->getPostInfo($post_id);
            foreach($post_details as $key => $value) {
                if ($key === 'post_content') {
                    $data[$key] = html_entity_decode($value, ENT_HTML5, 'UTF-8');
                } else {
                    $data[$key] = $value;
                }
            }
//            $data['post_detail'] = $post_details;
//
//            $data['post_title'] = $post_details['post_title'];
//            $data['post_short_description'] = $post_details['post_short_description'];
//            $data['post_content'] =  html_entity_decode($post_details['post_content'], ENT_HTML5, 'UTF-8');

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_post'),
                'href' => $this->url->link('post/post')
            );

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('post/post_content', $data));
        } else {

            if (isset($this->request->get['page'])) {
                $page = $this->request->get['page'];
            } else {
                $page = 1;
            }
            if (isset($this->request->get['post_type'])) {
                $post_type = $this->request->get['post_type'];
            } else {
                $post_type = 'crawler';
            }
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_post'),
                'href' => $this->url->link('post/post')
            );

            $datafilter = array(
                'post_type' => $post_type,
                'start' => ($page - 1) * 10,
                'limit' => 10
            );
            $post_total = $this->model_post_post->getTotalPosts($datafilter);
            $listPost = $this->model_post_post->getAllPost($datafilter);

            foreach ($listPost as $post) {
                $data['posts'][] = array (
                    'post_id'    =>$post['ID'],
                    'title' => $post['post_title'],
                    'post_type' => $post['post_type'],
                    'post_date' => $post['post_date'],
                    'post_status' => $post['post_status'],
                    'post_modified' => $post['post_modified'],
                    'post_image'    => $post['post_image']
                );
            }
            $url = '';
            $limit = 10;


            $pagination = new Pagination();
            $pagination->total =  $post_total;
            $pagination->page = $page;
            $pagination->limit = $limit;

            if ($post_type == 'write') {
                $pagination->url = $this->url->link('post/post', '&post_type=write&page={page}');
                $pagination->limit = 0.5;
            } else {
                $pagination->url = $this->url->link('post/post', 'page={page}');
                $pagination->limit = $limit;
            }


            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($post_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($post_total - $limit)) ? $post_total : ((($page - 1) * $limit) + $limit), $post_total, ceil($post_total / $limit));

            if ($page == 1) {
                $this->document->addLink($this->url->link('post/post', true), 'canonical');
            } elseif ($page == 2) {
                $this->document->addLink($this->url->link('post/post', true), 'prev');
            } else {
                $this->document->addLink($this->url->link('post/post','&page='. ($page - 1), true), 'prev');
            }

            if ($limit && ceil($post_total / $limit) > $page) {
                $this->document->addLink($this->url->link('post/post', 'page='. ($page + 1), true), 'next');
            }

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('post/post', $data));
        }

    }
}