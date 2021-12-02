<?php
session_start();
if ($_POST){
    include "koneksi.php";
    $qry_get_senjata=mysqli_query($conn,"select * from senjata where id_senjata = '".$_GET['id_senjata']."'");
    $dt_senjata=mysqli_fetch_array($qry_get_senjata);
    $_SESSION['cart'][]=array(
        'id_senjata'=>$dt_senjata['id_senjata'],
        'nama_senjata'=>$dt_senjata['nama_senjata'],
        'qty'=>$_POST['jumlah_pinjam']
    );
}
header('location: keranjang.php');
?>
