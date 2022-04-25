<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once("Lib/dompdf/autoload.inc.php");
use Dompdf\Dompdf;

class CI_AZDomPDF extends CI_AZ {

	public function __construct() {
		$this->ci =& get_instance();
	}

	public function instance() {
		return new Dompdf();
	}


}