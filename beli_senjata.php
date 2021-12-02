<?php
include "header.php";
include "koneksi.php";
$qry_detail_senjata=mysqli_query($conn,"select * from senjata where id_senjata = '".$_GET['id_senjata']."'");
$dt_senjata=mysqli_fetch_array($qry_detail_senjata);
?>
<h2>Beli Senjata</h2>
<div class="row">
    <div class="col-md-4">
<img src="W._Excalibur_result.jpg"class="card-img-top"> 
</div>
<div class="col-md-8">
    <form
    action="masukkankeranjang.php?id_senjata=<?=$dt_senjata ['id_senjata']?>"
    method="post">
    <table class="table table-hover table-striped">
        <thead>
            <tr>
            <td>Senjata</td><td><?=$dt_senjata['nama_senjata']?></td>
                    </tr>
            <tr>
                        <td>Deskripsi</td><td><?=$dt_senjata['deskripsi']?></td>
                    </tr>
<tr>
    <td>Jumlah Beli</td><td><input type="number"
    name="jumlah_beli" value="1"></td>
</tr>
<tr>
    <td colspan="2"><input class="btn btn-success"
    type="submit" value="BUY"></td>
</tr>
</thead>
</table>
</form>
</div>
</div>
<?php
include "footer.php";
?>