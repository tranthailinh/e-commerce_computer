<?php
class ControllerPostWrite extends Controller
{
    public function index()
    {
        $this->load->language('post/post');
        $this->load->model('post/post');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_post'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_post'),
            'href' => $this->url->link('post/write')
        );

        $datafilter = array(
            'post_type' => 'write',
            'start' => ($page - 1) * 10,
            'limit' => 10
        );
        $post_total = $this->model_post_post->getTotalPosts($datafilter);
        var_dump($post_total);
        $listPost = $this->model_post_post->getAllPost($datafilter);
        $this->load->model('tool/image');
        foreach ($listPost as $post) {
            $data['posts'][] = array(
                'post_id' => $post['ID'],
                'title' => $post['post_title'],
                'post_type' => $post['post_type'],
                'post_date' => $post['post_date'],
                'post_status' => $post['post_status'],
                'post_modified' => $post['post_modified'],
                'post_image' => $this->model_tool_image->resize($post['post_image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'))
        );
        }
        $url = '';
        $limit = 10;


        $pagination = new Pagination();
        $pagination->total = $post_total;
        $pagination->page = $page;
        $pagination->limit = $limit;


        $pagination->url = $this->url->link('post/write', 'page={page}');

        $data['pagination'] = $pagination->render();


        $data['results'] = sprintf($this->language->get('text_pagination'), ($post_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($post_total - $limit)) ? $post_total : ((($page - 1) * $limit) + $limit), $post_total, ceil($post_total / $limit));

        if ($page == 1) {
            $this->document->addLink($this->url->link('post/write', true), 'canonical');
        } elseif ($page == 2) {
            $this->document->addLink($this->url->link('post/write', true), 'prev');
        } else {
            $this->document->addLink($this->url->link('post/write', '&page=' . ($page - 1), true), 'prev');
        }

        if ($limit && ceil($post_total / $limit) > $page) {
            $this->document->addLink($this->url->link('post/write', 'page=' . ($page + 1), true), 'next');
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