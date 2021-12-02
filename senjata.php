<?php
include "header.php";
?>
<h2>Daftar Senjata</h2>
<div class="row">
    <?php
    include "koneksi.php";
    $qry_senjata=mysqli_query($conn, "select * from senjata");
    while ($dt_senjata=mysqli_fetch_array($qry_senjata)){
        ?>
        <div class="col-md-3">
            <div class="card" >
              <img src="W._Excalibur_result.jpg" class="card-img-top">
              <div class="card-body">
                        <h5 class="card-title"><?=$dt_senjata ['nama_senjata']?></h5>
                        <a
                        href="beli_senjata.php?id_senjata=<?=$dt_senjata ['id_senjata']?>" class="btn btn-primary">BUY</a>
    </div>
    </div>
    </div>
    <?php
    }
    ?>
</div>
<?php
include "footer.php";
?>