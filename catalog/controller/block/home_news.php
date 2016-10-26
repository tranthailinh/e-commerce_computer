<?php
class ControllerBlockHomeNews extends Controller {
    public function index() {
        $this->load->model('post/post');

        $data['posts'] = array();

        $results = $this->model_post_post->getAllPost();

        foreach($results as $result){
            $data['posts'][] = array(
                'title' => $result['post_title'],
                'image' => $result['post_image'],
                'href'  => $this->url->link('post/post', 'post_id=' . $result['ID']),
                'description'  => $result['post_short_description']
            );
        }

        return $this->load->view('block/home_news', $data);
    }
}