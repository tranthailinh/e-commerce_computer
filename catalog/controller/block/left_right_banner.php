<?php
class ControllerBlockLeftRightBanner extends Controller {
    public function index() {
        $this->load->model('tool/image');
        $this->load->model('design/banner');

        $data = array();

        $banner_lefts = $this->model_design_banner->getBannerByPosition('scroll-left');

        $data['banner_lefts'] = array();

        foreach($banner_lefts as $banner){
            $data['banner_lefts'][] = array(
                'link'                     => $banner['link'],
                'title'                    => $banner['title'],
                'image'                    => HTTP_IMAGE . $banner['image'],
            );
        }

        $banner_rights = $this->model_design_banner->getBannerByPosition('scroll-right');

        $data['banner_rights'] = array();

        foreach($banner_rights as $banner){
            $data['banner_rights'][] = array(
                'link'                     => $banner['link'],
                'title'                    => $banner['title'],
                'image'                    => HTTP_IMAGE . $banner['image'],
            );
        }

        return $this->load->view('block/left_right_banner', $data);
    }
}