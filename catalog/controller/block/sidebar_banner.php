<?php
class ControllerBlockSidebarBanner extends Controller {
    public function index() {
        $this->load->model('tool/image');
        $this->load->model('design/banner');

        $data = array();

        $banner_sidebars = $this->model_design_banner->getBannerByPosition('sidebar');

        $data['banner_sidebars'] = array();

        foreach($banner_sidebars as $banner){
            $data['banner_sidebars'][] = array(
                'link'                     => $banner['link'],
                'title'                    => $banner['title'],
                'image'                    => HTTP_IMAGE . $banner['image'],
            );
        }

        return $this->load->view('block/sidebar_banner', $data);
    }
}