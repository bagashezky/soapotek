<?php defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'functions.php';
/**
* This is Example Controller
*/
class Example extends CI_Controller
{
	
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('apotek_data');
        $this->load->database();
        $this->load->helper(array('form', 'url'));
       
        $data['nullstock'] = $this->apotek_data->countstock();
        $data['nullex'] = $this->apotek_data->countex();
        $this->template->write_view('sidenavs', 'template/default_sidenavs', true);
		$this->template->write_view('navs', 'template/default_topnavs.php', $data, true);
	}

	

	function index() {
		$data['stockobat'] = $this->apotek_data->count_med();
		$data['stockkat'] = $this->apotek_data->count_cat();
		$data['sup'] = $this->apotek_data->count_sup();
		$data['unit'] = $this->apotek_data->count_unit();
		$data['inv'] = $this->apotek_data->count_inv();
		$data['pur'] = $this->apotek_data->count_pur();
		$data['totpur'] = $this->apotek_data->count_totpur();
		$data['totinv'] = $this->apotek_data->count_totinv();

		$this->template->write('title', 'Beranda', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/mypage', $data, true);

		$this->template->render();
	}

	

	function dashboard() {
		$this->template->write('title', 'Dashboard', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/dashboard', '', true);

		$this->template->render();
	}

	

	function table_exp() {
		$data['table_exp'] = $this->apotek_data->expired()->result();
		$data['table_alex'] = $this->apotek_data->almostex()->result();
		$this->template->write('title', 'Obat Kadaluarsa', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/table_exp', $data, true);

		$this->template->render();

	}

	function table_stock() {
		$data['table_stock'] = $this->apotek_data->outstock()->result();
		$data['table_alstock'] = $this->apotek_data->almostout()->result();
		$this->template->write('title', 'Obat Habis', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/table_stock', $data,  true);

		$this->template->render();
	}

	function form_cat() {
		$data['get_cat'] = $this->apotek_data->get_category();
		$data['get_penyimpanan'] = $this->apotek_data->get_penyimpanan();
		$this->template->write('title', 'Tambah Kategori', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_cat', $data, true);

		$this->template->render();
	}
	
	function form_coa() {
		$this->template->write('title', 'Tambah Coa', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_coa','', true);

		$this->template->render();
	}
	function form_unit() {
		$this->template->write('title', 'Tambah Jenis', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_unit', '', true);

		$this->template->render();
	}
	function form_penyimpanan() {
		$this->template->write('title', 'Tambah Penyimpanan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_penyimpanan', '', true);
		
		$this->template->render();
	}
	
	function form_med() {
		$data['get_penyimpanan'] = $this->apotek_data->get_penyimpanan();
		$data['get_cat'] = $this->apotek_data->get_category();
		$data['get_catr'] = $this->apotek_data->get_categoryrak();
		$data['get_sup'] = $this->apotek_data->get_supplier();
		$data['get_unit'] = $this->apotek_data->get_unit();
		$this->template->write('title', 'Tambah Obat', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_med', $data, true);
		$this->template->render();
	}


	function obats() {
		
		$data['obats'] = $this->apotek_data->medicine()->result();
		$this->template->write('title', 'Lihat Obat', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/obats', $data, true);

		$this->template->render();
	}
	function coa() {
		
		$data['coa'] = $this->apotek_data->coa()->result();
		$this->template->write('title', 'Lihat Obat', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/coa', $data, true);

		$this->template->render();
	}

	function jenis_obat() {
		
		$data['jenis_obat'] = $this->apotek_data->unit()->result();
		$this->template->write('title', 'Lihat Jenis', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/jenis_obat', $data, true);

		$this->template->render();
		
	}
	function rak_penyimpanan() {
		
		$data['rak_penyimpanan'] = $this->apotek_data->nama_rak_penyimpanan()->result();
		$this->template->write('title', 'Lihat Jenis', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/rak_penyimpanan', $data, true);

		$this->template->render();
		
	}


	function invoice_report() {		
		$this->template->write('title', 'Grafik Penjualan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/invoice_report', true);

		$this->template->render();
		
	}

	function purchase_report() {

		$this->template->write('title', 'Grafik Pembelian', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/purchase_report', true);

		$this->template->render();
		
	}

	function report() {
		$data['totpur'] = $this->apotek_data->count_totpur();
		$data['totinv'] = $this->apotek_data->count_totinv();
		$data['report'] = $this->apotek_data->get_report();
		$this->template->write('title', 'Laporan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/report', $data, true);

		$this->template->render();
		
	}

	function kategori_obat() {
		
		$data['kategori_obat'] = $this->apotek_data->category()->result();
		$this->template->write('title', 'Lihat Kategori', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/kategori_obat', $data, true);

		$this->template->render();
	}

	function supplier() {
		$data['supplier'] = $this->apotek_data->supplier()->result();
		
		$this->template->write('title', 'Lihat Supplier', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/supplier', $data, true);

		$this->template->render();
	}

	

	function form_sup() {
		$this->template->write('title', 'Tambah Supplier', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_sup', '', true);

		$this->template->render();
	}


	

	function form_invoice() {
		$data['obats'] = $this->apotek_data->medicine()->result();
		$data['get_cat'] = $this->apotek_data->get_category();
		$data['get_med'] = $this->apotek_data->get_medicine();
		$data['get_unit'] = $this->apotek_data->get_unit();
		$this->template->write('title', 'Tambah Penjualan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_invoice', $data, true);

		$this->template->render();
	}


	function form_purchase() {
		$data['obats'] = $this->apotek_data->medicine()->result();
		$data['get_sup'] = $this->apotek_data->get_supplier();
		
		$data['get_med'] = $this->apotek_data->get_medicine();
		
		$this->template->write('title', 'Tambah Pembelian', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_purchase', $data, true);

		$this->template->render();
	}

	function pembelian() {
		$data['pembelian'] = $this->apotek_data->purchase()->result();
		
		$this->template->write('title', 'Lihat Pembelian', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/pembelian', $data, true);

		$this->template->render();
	}

	function getmedbysupplier(){
        $nama_supplier=$this->input->post('nama_supplier');
        $data=$this->apotek_data->getmedbysupplier($nama_supplier);
        echo json_encode($data);
    }
	
	function getcatbyrak(){
        $nama_kategori=$this->input->post('nama_kategori');
        $data=$this->apotek_data->getcatbyrak($nama_kategori);
        echo json_encode($data);
    }

	

	function form_customer() {
		$this->template->write('title', 'Tambah Pelanggan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/form_customer', '', true);

		$this->template->render();
	}

	

	function table_customer() {
		$this->template->write('title', 'Lihat Pelanggan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/table_customer', '', true);

		$this->template->render();
	}

	function table_invoice() {
		$data['table_invoice'] = $this->apotek_data->invoice()->result();
		$this->template->write('title', 'Lihat Penjualan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/table_invoice', $data, true);

		$this->template->render();
	}



	function add_medicine()
	{
		$nama_obat = $this->input->post('nama_obat');

// Memeriksa apakah nama obat sudah ada di database
		$this->load->model('apotek_data');
		if ($this->apotek_data->get_obat_by_nama($nama_obat)) {
			$this->session->set_flashdata('med_ada', 'Data obat sudah ada');
			redirect('example/obats');
		} else {
			$jmlh_stok = $this->input->post('jmlh_stok');
			$unit = $this->input->post('unit');
			$nama_kategori = $this->input->post('nama_kategori');
			$tgl_beli = date("Y-m-d", strtotime($this->input->post('tgl_beli')));
			$tgl_kadaluarsa = date("Y-m-d", strtotime($this->input->post('tgl_kadaluarsa')));
			$des_obat = $this->input->post('des_obat');
			$harga_obat = $this->input->post('harga_obat');
			$harga_jual = $this->input->post('harga_jual');
			$nama_supplier = $this->input->post('nama_supplier');

			$data = array(
				'nama_obat' => $nama_obat,
				'jmlh_stok' => $jmlh_stok,
				'unit' => $unit,
				'nama_kategori' => $nama_kategori,
				'tgl_beli' => $tgl_beli,
				'tgl_kadaluarsa' => $tgl_kadaluarsa,
				'des_obat' => $des_obat,
				'harga_obat' => $harga_obat,
				'harga_jual' => $harga_jual,
				'nama_supplier' => $nama_supplier,
			);

			$this->apotek_data->insert_data($data, 'obats');

			$this->session->set_flashdata('med_added', 'Obat berhasil ditambahkan');
			redirect('example/obats');
		}


	}
	function add_coa()
	{
		$kode_coa = $this->input->post('kode_coa');

// Memeriksa apakah nama obat sudah ada di database
		$this->load->model('apotek_data');
		if ($this->apotek_data->get_coa_by_nama($kode_coa)) {
			$this->session->set_flashdata('coa_eror', 'Kode Coa sudah ada');
			redirect('example/coa');
		} else {
			$nama_coa = $this->input->post('nama_coa');
			$header_akun = $this->input->post('header_akun');
			$posisi_db_cr = $this->input->post('posisi_db_cr');

			$data = array(
				'kode_coa' => $kode_coa,
				'nama_coa' => $nama_coa,
				'header_akun' => $header_akun,
				'posisi_db_cr' => $posisi_db_cr,
			);

			$this->apotek_data->insert_data($data, 'coa');

			$this->session->set_flashdata('coa_added', 'COA berhasil ditambahkan');
			redirect('example/coa');
		}


	}


	function add_category(){
		$data['get_catr'] = $this->apotek_data->get_penyimpanan();
		$nama_kategori = $this->input->post('nama_kategori');

		$this->load->model('apotek_data');
		if ($this->apotek_data->get_kat_by_nama($nama_kategori)) {
			$this->session->set_flashdata('cat_ada', 'Data Kategori sudah ada');
			redirect('example/form_cat');
		} else {

		$nama_rak = $this->input->post('nama_rak_penyimpanan');
		$des_kat = $this->input->post('des_kat');
 
		$data = array(
			'nama_kategori' => $nama_kategori,
			'nama_rak_penyimpanan' => $nama_rak,
			'des_kat' => $des_kat,
			
			);
		$this->apotek_data->insert_data($data,'kategori_obat');

		$this->session->set_flashdata('cat_added', 'Kategori berhasil ditambahkan');
		redirect('example/kategori_obat');
	}
}

	function add_unit(){
		$unit = $this->input->post('unit');
		$this->load->model('apotek_data');
		if ($this->apotek_data->get_unit_by_nama($unit)) {
			$this->session->set_flashdata('jen_ada', 'Data Jenis Obat sudah ada');
			redirect('example/form_unit');
		} else {

		$data = array(
			'unit' => $unit,
			
			
			);
		$this->apotek_data->insert_data($data,'jenis_obat');

		$this->session->set_flashdata('unit_added', 'Jenis Obat berhasil ditambahkan');
		redirect('example/jenis_obat');
	}
}
	
	function add_penyimpanan(){
		$nama_rak_penyimpanan = $this->input->post('nama_rak_penyimpanan');

		$this->load->model('apotek_data');
		if ($this->apotek_data->get_rak_by_nama($nama_rak_penyimpanan)) {
			$this->session->set_flashdata('nama_rak_error', 'Data Rak sudah ada');
			redirect('example/rak_penyimpanan');
		} else {
		$data = array(
			'nama_rak_penyimpanan' => $nama_rak_penyimpanan,
			);


		$this->apotek_data->insert_data($data,'rak_penyimpanan');

		$this->session->set_flashdata('penyimpanan_added', 'Rak berhasil ditambahkan');
		redirect('example/rak_penyimpanan');
	}
}

	function add_supplier(){
		$nama_supplier = $this->input->post('nama_supplier');
		$alamat = $this->input->post('alamat');
		$no_telp = $this->input->post('no_telp');
 
		$data = array(
			'nama_supplier' => $nama_supplier,
			'alamat' => $alamat,
			'no_telp' => $no_telp,
			);
		$this->apotek_data->insert_data($data,'supplier');

		$this->session->set_flashdata('sup_added', 'Supplier berhasil ditambahkan');
		redirect('example/supplier');
	}

	


	function add_invoice(){
		 
			$nama_pembeli = $this->input->post('nama_pembeli');
			$tgl_beli = date("Y-m-d",strtotime($this->input->post('tgl_beli')));
			$grandtotal = $this->input->post('grandtotal');
			$ref = generateRandomString();
			$nama_obat = $this->input->post('nama_obat');
			$harga_jual = $this->input->post('harga_jual');
			$banyak = $this->input->post('banyak');
			$subtotal = $this->input->post('subtotal');

		foreach($nama_obat as $key=>$val){
		   
		$data[] = array(
				'nama_pembeli' => $nama_pembeli,
				'tgl_beli' => $tgl_beli,
				'grandtotal' => $grandtotal,
				'ref' => $ref,
				'nama_obat' => $val,
				'harga_jual' => $harga_jual[$key],
				'banyak' => $banyak[$key],
				'subtotal' => $subtotal[$key],
				
				);

		$this->db->set('jmlh_stok', 'jmlh_stok-'.$banyak[$key], FALSE);
	    $this->db->where('nama_obat', $val);
	    $updated = $this->db->update('obats');
		
		}
		
		$this->db->insert_batch('table_invoice', $data);

		$this->session->set_flashdata('inv_added', 'Penjualan berhasil ditambahkan');
		redirect('example/table_invoice');
	}

	function add_purchase(){
		 
			$nama_supplier = $this->input->post('nama_supplier');
			$tgl_beli = date("Y-m-d",strtotime($this->input->post('tgl_beli')));
			$grandtotal = $this->input->post('grandtotal');
			$ref = generateRandomString();
			$nama_obat = $this->input->post('nama_obat');
			$harga_obat = $this->input->post('harga_obat');
			$banyak = $this->input->post('banyak');
			$subtotal = $this->input->post('subtotal');

		foreach($nama_obat as $key=>$val){
		   
		$data[] = array(
				'nama_supplier' => $nama_supplier,
				'tgl_beli' => $tgl_beli,
				'grandtotal' => $grandtotal,
				'ref' => $ref,
				'nama_obat' => $val,
				'harga_obat' => $harga_obat[$key],
				'banyak' => $banyak[$key],
				'subtotal' => $subtotal[$key],
				
				);

		$this->db->set('jmlh_stok', 'jmlh_stok+'.$banyak[$key], FALSE);
	    $this->db->where('nama_obat', $val);
	    $updated = $this->db->update('obats');
		
		}
		
		$this->db->insert_batch('pembelian', $data);
		$this->session->set_flashdata('pur_added', 'Pembelian berhasil ditambahkan');
		redirect('example/pembelian');
		
	}



	function invoice_page($ref) {
		$where = array('ref' => $ref);
		$data['table_invoice'] = $this->apotek_data->show_data($where, 'table_invoice')->result();
		$data['show_invoice'] = $this->apotek_data->show_invoice($where, 'table_invoice')->result();
		$this->template->write('title', 'Invoice Penjualan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/invoice', $data, true);

		$this->template->render();
	}


	function purchase_page($ref) {
		$where = array('ref' => $ref);
		$data['pembelian'] = $this->apotek_data->show_data($where, 'pembelian')->result();
		$data['show_invoice'] = $this->apotek_data->show_invoice($where, 'pembelian')->result();
		$this->template->write('title', 'Invoice Pembelian', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/purchase', $data, true);

		$this->template->render();
	}


	function edit_form_cat($id_kategori_obat) {
		$where = array('id_kategori_obat' => $id_kategori_obat);
		$data['kategori_obat'] = $this->apotek_data->edit_data($where,'kategori_obat')->result();
		$this->template->write('title', 'Ubah Kategori', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/edit_form_cat', $data, true);

		$this->template->render();
	}
	
	function edit_form_coa($kode_coa) {
		$where = array('kode_coa' => $kode_coa);
		$data['coa'] = $this->apotek_data->edit_data($where,'coa')->result();
		$this->template->write('title', 'Ubah COA', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/edit_form_coa', $data, true);

		$this->template->render();
	}
	function update_category(){
		$id_kategori_obat = $this->input->post('id_kategori_obat');
		$nama_kategori = $this->input->post('nama_kategori');
		$nama_rak_penyimpanan = $this->input->post('nama_rak_penyimpanan');
		$des_kat = $this->input->post('des_kat');

		$data = array(
			'nama_kategori' => $nama_kategori,
			'nama_rak_penyimpanan' => $nama_rak_penyimpanan,
			'des_kat' => $des_kat,
		);

		$where = array(
			'id_kategori_obat' => $id_kategori_obat
		);

		$this->apotek_data->update_data($where,$data,'kategori_obat');

		$this->session->set_flashdata('cat_added', 'Data kategori berhasil diperbarui');
		redirect('example/kategori_obat');
	}
	
	function update_coa(){
		$kode_coa = $this->input->post('kode_coa');
		$nama_coa = $this->input->post('nama_coa');
		$header_akun = $this->input->post('header_akun');
		$posisi_db_cr = $this->input->post('posisi_db_cr');

		$data = array(
			'kode_coa' => $kode_coa,
			'nama_coa' => $nama_coa,
			'header_akun' => $header_akun,
			'posisi_db_cr' => $posisi_db_cr,
		);

		$where = array(
			'kode_coa' => $kode_coa
		);

		$this->apotek_data->update_data($where,$data,'coa');

		$this->session->set_flashdata('coa_added', 'Data COA berhasil diperbarui');
		redirect('example/coa');
	}
	function edit_form_med($id_obat) {
		$data['get_cat'] = $this->apotek_data->get_category();
		$data['get_sup'] = $this->apotek_data->get_supplier();
		$data['get_unit'] = $this->apotek_data->get_unit();
		$data['get_penyimpanan'] = $this->apotek_data->get_penyimpanan();
		$where = array('id_obat' => $id_obat);
		$data['obats'] = $this->apotek_data->edit_data($where,'obats')->result();
		$this->template->write('title', 'Ubah Obat', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/edit_form_med', $data, true);

		$this->template->render();
	}

	function update_medicine(){
		$id_obat = $this->input->post('id_obat');
		$nama_obat = $this->input->post('nama_obat');
		// $penyimpanan = $this->input->post('nama_rak_penyimpanan');
		$jmlh_stok = $this->input->post('jmlh_stok');
		$unit = $this->input->post('unit');
		$nama_kategori = $this->input->post('nama_kategori');
		$tgl_kadaluarsa = date("Y-m-d",strtotime($this->input->post('tgl_kadaluarsa')));
		$des_obat = $this->input->post('des_obat');
		$harga_obat = $this->input->post('harga_obat');
		$harga_jual = $this->input->post('harga_jual');
		$nama_supplier = $this->input->post('nama_supplier');
	
		$data = array(
			'nama_obat' => $nama_obat,
			// 'nama_rak_penyimpanan' => $penyimpanan,
			'jmlh_stok' => $jmlh_stok,
			'unit' => $unit,
			'nama_kategori' => $nama_kategori,
			'tgl_kadaluarsa' => $tgl_kadaluarsa,
			'des_obat' => $des_obat,
			'harga_obat' => $harga_obat,
			'harga_jual' => $harga_jual,
			'nama_supplier' => $nama_supplier,
		);

		$where = array(
			'id_obat' => $id_obat
		);

		$this->apotek_data->update_data($where,$data,'obats');
		$this->session->set_flashdata('med_added', 'Data obat berhasil diperbarui');
		redirect('example/obats');
	}


	function edit_form_sup($id_supplier) {
		$where = array('id_supplier' => $id_supplier);
		$data['supplier'] = $this->apotek_data->edit_data($where,'supplier')->result();
		$this->template->write('title', 'Ubah Supplier', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/edit_form_sup', $data, true);

		$this->template->render();
	}

	function edit_form_unit($id_unit) {
		$where = array('id_unit' => $id_unit);
		$data['jenis_obat'] = $this->apotek_data->edit_data($where,'jenis_obat')->result();
		$this->template->write('title', 'Ubah Unit', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/edit_form_unit', $data, true);

		$this->template->render();
	}
	
	function edit_form_penyimpanan($kode_rak) {
		$where = array('kode_rak' => $kode_rak);
		$data['rak_penyimpanan'] = $this->apotek_data->edit_data($where,'rak_penyimpanan')->result();
		$this->template->write('title', 'Ubah Rak Penyimpanan', TRUE);
		$this->template->write('header', 'Dashboard');
		$this->template->write_view('content', 'tes/edit_form_penyimpanan', $data, true);

		$this->template->render();
	}

	function update_supplier(){
		$id_supplier = $this->input->post('id_supplier');
		$nama_supplier = $this->input->post('nama_supplier');
		$alamat = $this->input->post('alamat');
		$no_telp = $this->input->post('no_telp');

		$data = array(
			'nama_supplier' => $nama_supplier,
			'alamat' => $alamat,
			'no_telp' => $no_telp,
		);

		$where = array(
			'id_supplier' => $id_supplier
		);

		$this->apotek_data->update_data($where,$data,'supplier');

		$this->session->set_flashdata('sup_added', 'Data Supplier berhasil diperbarui');
		redirect('example/supplier');
	}

	function update_unit(){
		$id_unit = $this->input->post('id_unit');
		$unit = $this->input->post('unit');
		
		$data = array(
			'unit' => $unit,
		
		);

		$where = array(
			'id_unit' => $id_unit
		);

		$this->apotek_data->update_data($where,$data,'jenis_obat');

		$this->session->set_flashdata('unit_added', 'Data unit berhasil diperbarui');
		redirect('example/jenis_obat');
	}
	
	function update_penyimpanan(){
		$kode_rak = $this->input->post('kode_rak');
		$nama_rak_penyimpanan = $this->input->post('nama_rak_penyimpanan');
		
		$data = array(
			'nama_rak_penyimpanan' => $nama_rak_penyimpanan,
		
		);

		$where = array(
			'kode_rak' => $kode_rak
		);

		$this->apotek_data->update_data($where,$data,'rak_penyimpanan');

		$this->session->set_flashdata('nama_rak_penyimpanan_added', 'Rak Penyimpanan berhasil diperbarui');
		redirect('example/rak_penyimpanan');
	}
	function update_nama_rak_penyimpanan(){
		$kode_rak = $this->input->post('kode_rak');
		$unit = $this->input->post('unit');
		
		$data = array(
			'unit' => $unit,
		
		);

		$where = array(
			'kode_rak' => $kode_rak
		);

		$this->apotek_data->update_data($where,$data,'penyimpanan');

		$this->session->set_flashdata('nama_rak_penyimpanan_added', 'Data Penyimpanan berhasil diperbarui');
		redirect('example/penyimpanan');
	}

	function remove_med($id_obat){
		$where = array('id_obat' => $id_obat);
		$this->apotek_data->delete_data($where,'obats');
		redirect('example/obats');
	}

	function remove_cat($id_kategori_obat){
		$where = array('id_kategori_obat' => $id_kategori_obat);
		$this->apotek_data->delete_data($where,'kategori_obat');
		redirect('example/kategori_obat');
	}
	function remove_coa($kode_coa){
		$where = array('kode_coa' => $kode_coa);
		$this->apotek_data->delete_data($where,'coa');
		redirect('example/coa');
	}

	function remove_sup($id_supplier){
		$where = array('id_supplier' => $id_supplier);
		$this->apotek_data->delete_data($where,'supplier');
		redirect('example/supplier');
	}

	function remove_unit($id_unit){
		$where = array('id_unit' => $id_unit);
		
		$this->apotek_data->delete_data($where,'jenis_obat');
		redirect('example/jenis_obat');
	}
	
	function remove_penyimpanan($kode_rak){
		$where = array('kode_rak' => $kode_rak);
		
		$this->apotek_data->delete_data($where,'rak_penyimpanan');
		redirect('example/rak_penyimpanan');
	}

	function remove_inv($ref){
		$where = array('ref' => $ref);
		$this->apotek_data->delete_data($where,'table_invoice');


		redirect('example/table_invoice');
	}

	function remove_purchase($ref){
		$where = array('ref' => $ref);
		$this->apotek_data->delete_data($where,'pembelian');
		redirect('example/pembelian');
	}


	 function product()
	{
	    $nama_obat=$this->input->post('nama_obat');
        $data=$this->apotek_data->get_product($nama_obat);
        echo json_encode($data);
	}

	 


	function chart()
	{
       $data = $this->apotek_data->get_chart_cat();
		echo json_encode($data);
	}

	function chart_unit()
	{
       $data = $this->apotek_data->get_chart_unit();
		echo json_encode($data);
	}


	function chart_trans()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->get_chart_trans($tahun_beli);
		echo json_encode($data);
	}

	function chart_purchase()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->get_chart_purchase($tahun_beli);
		echo json_encode($data);
	}

	function gabung()
	{
       $tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->get_gabung($tahun_beli);
		echo json_encode($data);
	}

	function topdemand()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->topDemanded($tahun_beli);
		echo json_encode($data);
	}

	function leastdemand()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->leastDemanded($tahun_beli);
		echo json_encode($data);
	}

	function highearn()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->highestEarners($tahun_beli);
		echo json_encode($data);
	}

	function lowearn()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->lowestEarners($tahun_beli);
		echo json_encode($data);
	}

	function toppurchase()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->topPurchase($tahun_beli);
		echo json_encode($data);
	}

	function leastpurchase()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->leastPurchase($tahun_beli);
		echo json_encode($data);
	}

	function highpurchase()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->highestPurchase($tahun_beli);
		echo json_encode($data);
	}

	function lowpurchase()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->lowestPurchase($tahun_beli);
		echo json_encode($data);
	}



	function totale()
	{
		$tahun_beli=$this->input->post('tahun_beli');
       	$data = $this->apotek_data->get_tot($tahun_beli);
		echo json_encode($data);
	}

	

    

	

}









