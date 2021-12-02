<?php 
    session_start();
    include "koneksi.php";
    $cart=@$_SESSION['cart'];
    if(count($cart)>0){
         $id=mysqli_insert_id($conn);
        foreach ($cart as $key_produk => $val_produk) {
            mysqli_query($conn,"insert into detail_pembelian_senjata (id_pembelian_senjata,id_senjata,qty) value('".$id."','".$val_produk['id_senjata']."','".$val_produk['qty']."')");
        }
        unset($_SESSION['cart']);
        echo '<script>alert("Anda berhasil membeli senjata");location.href="histori_pembelian.php"</script>';
    }
?>