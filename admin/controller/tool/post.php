<?php
require_once 'goutte.phar';
use Goutte\Client;

class ControllerToolPost extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('tool/post');
        $this->load->model('tool/post');

        $this->getList();
    }
    function crawler() {
        $this->load->language('tool/post');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('tool/post');


        if (isset($this->request->post['link_crawler'])) {
            $count_post = count($this->model_tool_post->getAllPost());
            $data['link_crawler'] = $this->request->post['link_crawler'];
            if (!strpos($data['link_crawler'], 'http://')) {
                $data['link_crawler'] = 'http://' . $data['link_crawler'];
            }
            try {
                $client = new Client();

                $crawler = $client->request('GET', $data['link_crawler']);
//                $status_code = $client->getStatusCode();
                $link_exits = $crawler->filter('.news-stream.w690 > .list-news.fl.pt10 > .list-news-img.fl.mr30.mt10 > a');

                if ($link_exits) {
//                $links = array();
                    $links = $crawler->filter('.news-stream.w690 > .list-news.fl.pt10 > .list-news-img.fl.mr30.mt10 > a')->each(function( Symfony\Component\DomCrawler\Crawler $ele, $i) {

                        $img = $ele->filter('img');
                        $div_short = $ele->parents()->siblings();
                        $title = $div_short->filter('h2 > a')->text();
//                    var_dump($short_description);
                        return $links[$i] = array(
                            'link' => 'http://genk.vn/'.$ele->attr('href'),
                            'img_title' => $img->attr('src'),
                            'title' => $title
                        );
                        // var_dump($ele);
                    });
//                var_dump($links);
                }

                if ((count($links)) > 0) {
                    $count = $count_post;
                    foreach($links as $key => $value) {
                        if ($count < MAX_POST) {
                            $clientChild = new Goutte\Client();
                            $crawlerChild = $clientChild->request('GET', $links[$key]['link']);
                            $short_description = $crawlerChild->filter('.content > h2')->html();
                            $contentPost = $crawlerChild->filter('#ContentDetail')->html();

                            $content['post_title'] = $links[$key]['title'];
                            $content['post_short_description'] = $short_description;
                            $content['post_content'] = $contentPost;
                            $content['img_title'] = $links[$key]['img_title'];
                            $content['post_type'] = 'crawler';
                            $this->model_tool_post->addPost($content);
                        }
                        $count++;
                    }

                    $this->session->data['success'] = $this->language->get('text_success');
                } else {
                    $this->error['error_crawler'] = $this->language->get('error_crawler');
                }
            } catch (Guzzle\Http\Exception\CurlException $ex) {
                $this->error['error_link_crawler'] = $this->language->get('error_link_crawler');
            } catch (Exception $ex) {
                $this->error['error_link_crawler'] = $this->language->get('error_link_crawler');
            }


        }
        $this->getList();
    }
    public function delete() {
        $this->load->language('tool/post');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('tool/post');

        if (isset($this->request->post['selected']) ) {
            foreach($this->request->post['selected'] as $post_id) {
                $this->model_tool_post->deletePost($post_id);
            }
            $url = '';
            $this->response->redirect($this->url->link('tool/post', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    public function edit() {
        $this->load->language('tool/post');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('tool/post');


        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
                $this->model_tool_post->editPost($this->request->get['post_id'], $this->request->post);
            $url = '';
            $this->response->redirect($this->url->link('tool/post', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }
    public function getList() {
        $url = '';
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' =>$this->language->get('text/home'),
            'href' =>$this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('tool/post', 'token=' . $this->session->data['token'] . $url, true)
        );
        $data['crawler'] = $this->url->link('tool/post/crawler', 'token=' . $this->session->data['token'] . $url, true);
        $data['add'] = $this->url->link('tool/post/add', 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('tool/post/delete', 'token=' . $this->session->data['token'] . $url, true);
        $data['heading_title'] = $this->language->get('heading_title');
        $listPost = $this->model_tool_post->getAllPost();
        
        foreach ($listPost as $post) {
            $data['posts'][] = array (
                'post_id'    =>$post['ID'],
                'title' => $post['post_title'],
                'post_type' => $post['post_type'],
                'post_date' => $post['post_date'],
                'post_status' => $post['post_status'],
                'post_modified' => $post['post_modified'],
                'post_edit'     => $this->url->link('tool/post/edit', 'token=' . $this->session->data['token'] . '&post_id=' . $post['ID'] . $url, true)
            );
        }

        $data['button_add'] = $this->language->get('button_add');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['column_title']   = $this->language->get('column_title');
        $data['column_type']   = $this->language->get('column_type');
        $data['column_status']  = $this->language->get('column_status');
        $data['column_post_date'] = $this->language->get('column_post_date');
        $data['column_modified']  =$this->language->get('column_modified');
        $data['column_action']  =$this->language->get('column_action');

        if (isset($this->error['error_crawler'])) {
            $data['error_warning'] = $this->error['error_crawler'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['error_link_crawler'])) {
            $data['error_link_crawler'] = $this->error['error_link_crawler'];
        } else {
            $data['error_link_crawler'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('tool/post_list', $data));
    }

    public function add() {
        $this->load->language('tool/post');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('tool/post');

        if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
            var_dump($this->request->post);

            $this->model_tool_post->addPost($this->request->post);

            $url = '';
            $this->response->redirect($this->url->link('tool/post', 'token=' . $this->session->data['token'] . $url, true));
        }
        $this->getForm();

    }

    protected function getForm() {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['post_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_post_title'] = $this->language->get('post_title');
        $data['text_short_title'] = $this->language->get('text_short_title');
        $data['text_avata'] = $this->language->get('text_avata');
        $data['text_post_content'] = $this->language->get('post_content');
        $data['meta_keyword'] = $this->language->get('meta_keyword');
        $data['entry_tag'] = $this->language->get('entry_tag');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();


        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['post_title'])) {
            $data['error_post_title'] = $this->error['post_title'];
        } else {
            $data['error_post_title'] = '';
        }

        if (isset($this->error['post_short_description'])) {
            $data['error_post_short_description'] = $this->error['post_short_description'];
        } else {
            $data['error_post_short_description'] = '';
        }

        if (isset($this->error['post_content'])) {
            $data['error_post_content'] = $this->error['post_content'];
        } else {
            $data['error_post_content'] = '';
        }
        $url = '';
        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('tool/post', 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['post_id'])) {
            $data['action'] = $this->url->link('tool/post/add', 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('tool/post/edit', 'token=' . $this->session->data['token'] . '&post_id=' . $this->request->get['post_id'] . $url, true);
        }

        if (isset($this->request->get['post_id'])) {
            $post_info = $this->model_tool_post->getPostInfo($this->request->get['post_id']);
            foreach($post_info as $key => $value) {
                $data[$key] = $value;
            }
        }
        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($post_info)) {
            $data['image'] = $post_info['post_image'];
        } else {
            $data['image'] = '';
        }

        $this->load->model('tool/image');

        if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($post_info) && is_file(DIR_IMAGE . $post_info['post_image'])) {
            $data['thumb'] = $this->model_tool_image->resize($post_info['post_image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

        $data['cancel'] = $this->url->link('tool/post', 'token=' . $this->session->data['token'] . $url, true);

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('tool/post_add', $data));
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'tool/post')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'tool/post')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }


        if ((utf8_strlen($this->request->post['post_title']) < 3) || (utf8_strlen($this->request->post['post_title']) > 200)) {
            $this->error['post_title'] = $this->language->get('error_post_title');
        }
        if ((utf8_strlen($this->request->post['post_short_description']) < 3) || (utf8_strlen($this->request->post['post_short_description']) > 200)) {
            $this->error['post_short_description'] = $this->language->get('error_post_short_description');
        }
        if ((utf8_strlen($this->request->post['post_content']) < 3) || (utf8_strlen($this->request->post['post_content']) > 3000)) {
            $this->error['post_content'] = $this->language->get('error_post_content');
        }


        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }
}